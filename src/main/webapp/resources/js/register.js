$(document).ready(function() {
    let isValid = true; // 유효성 검사 여부
    let idCheckTimeout; // ID 체크를 위한 타이머

$('#id').on('input', function() {
        clearTimeout(idCheckTimeout);
        isIdChecked = false; // 입력이 변경되면 중복 확인 상태 초기화
        $('#result').text('').css('color', ''); // 결과 메시지 초기화

        idCheckTimeout = setTimeout(function() {
            checkIdDuplicate();
        }, 100); // 0.1초 후에 중복 확인 실행
    });

    // 중복 확인 버튼 클릭 시
    function checkIdDuplicate() {
        const id = $('#id').val();
        if (id) {
            $.ajax({
                url: '/rest/check_id',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ id: id }), // MemberVO에 맞게 JSON 형식으로 데이터 전송
                success: function(response) {
                    if (response === null || response === '') {
                        isIdChecked = true; // ID 중복 확인 완료
                        $('#result').text('사용 가능한 아이디입니다.').css('color', 'green');
                    } else {
                        isIdChecked = false; // ID 중복 확인 실패
                        $('#result').text('이미 사용 중인 아이디입니다.').css('color', 'red');
                    }
                },
                error: function() {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    }

    // 폼 제출 시
    $('#registerForm').submit(function(event) {
        event.preventDefault(); // 기본 제출 동작 방지
        isValid = true; // 유효성 검사 초기화

        if (!isIdChecked) {
            showCustomAlert('아이디 중복 확인을 해주세요.', '#customAlert');
            return false; // 폼 제출 중단
        }

        $('#registerForm input[required]').each(function() {
            if (!$(this).val().trim()) {
                showCustomAlert($(this).data('error'), `#alert-${this.id}`);
                $(this).focus();
                highlightField($(this));
                isValid = false;
                return false; // 반복문 중단
            }
        });

        // 전화번호 유효성 검사 추가
        const phonePattern = /^\d{11}$/; // 11자리 숫자 패턴
        const phoneValue = $('#phone').val().trim();
        if (phoneValue && !phonePattern.test(phoneValue)) {
            showCustomAlert('전화번호는 11자리 숫자만 입력할 수 있습니다.', '#alert-phone'); // 사용자 정의 알림 표시
            $('#phone').focus(); // 전화번호 필드에 포커스
            highlightField($('#phone')); // 필드 강조
            isValid = false; // 유효성 검사 실패
            return false; // 반복문 중단
        }

        // 모든 검증을 통과한 경우에만 폼 제출
        if (isValid) {
            this.submit(); // 폼 제출
        }
    });

    // 사용자 정의 알림 표시 함수
    function showCustomAlert(message, targetSelector) {
        const alertBox = $(targetSelector);
        alertBox.text(message).addClass('show').show(); // 알림 표시
        setTimeout(function() {
            alertBox.removeClass('show').hide(); // 2초 후 알림 사라짐
        }, 2000); // 2초 후 알림 사라짐
    }
    
    // 필드 강조 함수
    function highlightField(input) {
        const parentDiv = input.closest('.form-control');
        parentDiv.css('border', '2px solid red'); // 테두리 강조
        setTimeout(function() {
            parentDiv.css('border', ''); // 2초 후 테두리 제거
        }, 2000); // 3초 후 테두리 제거
    }

    // 기본 HTML5 유효성 검사 비활성화
   $('#registerForm').attr('novalidate', true);
});
