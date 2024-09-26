$(document).ready(function() {
    $('#modifyLink').click(function(e) {
        e.preventDefault(); // 기본 링크 동작 방지
        $('#passwordModal').show(); // 모달 창 표시
    });

    $('#closeModal').click(function() {
        $('#passwordModal').hide(); // 모달 창 닫기
    });

    $('#passwordForm').submit(function(e) {
        e.preventDefault(); // 기본 폼 제출 방지
        let pass = $('#pass').val();
        let id =$('#id').val();
        // AJAX 요청
        $.ajax({
            url: '/rest/modify_mypage', // 비밀번호 확인을 위한 URL
            type: 'POST',
            contentType: 'application/json',
               data: JSON.stringify({pass:pass,id:id}), // JSON 문자열로 변환
            success: function(response) {
                // 성공 시 처리
                if (response.success) {
				let member_number = response.member_number;
                    window.location.href = "/potato/modify_mypage?member_number=" + member_number ;
                } else {
                    alert('비밀번호가 틀렸습니다.');
                }
            },
            error: function() {
                alert('오류가 발생했습니다.');
            }
        });
    });
    $('#profileImageForm').submit(function(e) {
	e.preventDefault(); // 기본 폼 제출 방지
	let formData = new FormData(this);
	
	$.ajax({
		url: '/rest/upload', // 서버의 업로드 엔드포인트
        type: 'POST',
        data: formData,
        contentType: false, // 파일 전송 시 contentType은 false로 설정
        processData: false, // FormData 객체는 문자열로 변환하지 않음
                    success: function(response) {
                        alert('변경 완료되었습니다. ');
                    },
                    error: function(xhr, status, error) {
                        alert('이미지파일을 선택해주세요.');
                    }
	})
	
	});
});