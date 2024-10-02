let generatedCode = ''; // 랜덤 인증번호

// 버튼으로 input창에 금액 입력
function addAmount(amount) {
    const inputField = document.getElementById('amount');
    const currentAmount = parseInt(inputField.value) || 0; 
    inputField.value = currentAmount + amount; // 현재 입력된 값에 더하기
    toggleClearButton(); // X 버튼 상태 업데이트
}

// input창 금액 비우기
function clearAmount() {
    document.getElementById('amount').value = ''; // 입력 필드 비우기
    toggleClearButton(); // X 버튼 상태 업데이트
}

// 금액 없을때 x버튼 숨김
function toggleClearButton() {
    const inputField = document.getElementById('amount');
    const clearButton = document.querySelector('.clear-button');
    clearButton.style.display = inputField.value ? 'block' : 'none'; // 금액이 있으면 X 버튼 표시
}

// 인증 팝업 열기
function openVerificationWindow() {
    // 랜덤 6자리 숫자 생성
    generatedCode = String(Math.floor(100000 + Math.random() * 900000));
    console.log("생성된 인증번호: " + generatedCode); // 콘솔에 출력
    
    // 인증번호를 localStorage에 저장
    localStorage.setItem('generatedCode', generatedCode);

    // 금액을 localStorage에 저장
    const amount = document.getElementById('amount').value;
    localStorage.setItem('payAmount', amount);
    
    // member_number 가져오기
    const memberNumber = document.getElementById('charge-container').dataset.memberNumber;

    // 인증번호 입력 팝업 열기, member_number를 URL 파라미터로 추가
    window.open(`/pay/verification?member_number=${memberNumber}`, '인증번호 입력', 'width=600,height=400');
}

// URL 파라미터에서 member_number 가져오기
function getMemberNumberFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('member_number');
}

// 인증하기
function submitVerification() {
    const memberNumber = getMemberNumberFromURL(); // URL에서 member_number 가져오기
    if (!memberNumber) {
        alert("회원 번호를 가져올 수 없습니다.");
        return;
    }
    console.log("Member Number in submitVerification:", memberNumber); // 회원 번호 로그 출력

    const verificationCodeInput = document.getElementById('verificationCode');
    if (!verificationCodeInput) {
        alert("인증번호 입력 필드를 찾을 수 없습니다.");
        return;
    }

    const code = verificationCodeInput.value;
    const receivedCode = localStorage.getItem('generatedCode');

    if (code === receivedCode) {
        const payAmount = localStorage.getItem('payAmount');
        const payVO = {
            from_member_number: memberNumber,
            to_member_number: memberNumber,
            pay_amount: parseFloat(payAmount),
            point_amount: 0
        };

        console.log("PayVO 객체:", payVO);
        
        $.ajax({
		    url: '/pay/charge',
		    type: 'POST',
		    contentType: 'application/json',
		    data: JSON.stringify(payVO),
		    success: function(data) {
		        console.log(data); // 응답을 콘솔에 출력하여 확인
		        if (data && data.message) {
		            alert(data.message); // JSON 응답에서 메시지 표시
		            window.opener.location.href = '/pay/pay_info'; // 부모 창 리다이렉트
                    window.close(); // 현재 팝업창 닫기
		        } else {
		            alert("응답 형식이 올바르지 않습니다.");
		        }
		        window.close();
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        alert("충전 실패: " + errorThrown);
		    }
		});
    } else {
        alert("인증번호가 일치하지 않습니다.");
    }
}

// 포인트를 페이로 전환하기
function convertPoints(point) {
    const memberNumber = '${sessionScope.member_number}'; // 세션에서 member_number 가져오기
    //const point = parseInt('${point}'); // 전환 가능한 포인트 가져오기

    // 포인트가 0인지 확인
    if (point <= 0) {
        alert("전환 가능한 포인트가 없습니다.");
        return;
    }

    // 확인 알림창
    const confirmMessage = "정말로 전환하시겠습니까?";
    if (!confirm(confirmMessage)) {
        return; // 사용자가 "아니오"를 선택하면 함수 종료
    }

    $.ajax({
        url: '/pay/convertPoints',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ member_number: memberNumber, point: point }),
        success: function(response) {
            alert(response); // 성공 메시지 표시
            // 페이지 새로고침 또는 업데이트
            window.location.reload(); // 현재 페이지 새로고침
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("포인트 전환 실패: " + errorThrown);
        }
    });
}

// $(document).ready() 안에서 글로벌 함수로 추가
$(document).ready(function() {
    window.addAmount = addAmount;
    window.clearAmount = clearAmount;
    window.openVerification = openVerificationWindow;
    window.toggleClearButton = toggleClearButton;
    window.convertPoints = convertPoints;
});