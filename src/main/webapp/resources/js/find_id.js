$(document).ready(function() {
	 let isValid = true; // 유효성 검사 여부
	$('#find_form').submit(function(event) {
		 $('#registerForm input[required]').each(function() {
            if (!$(this).val().trim()) {
                showCustomAlert($(this).data('error'), `#alert-${this.id}`); // 사용자 정의 알림 표시
                $(this).focus(); // 비어있는 필드에 포커스
                highlightField($(this)); // 필드 강조
                isValid = false; // 유효성 검사 실패
                event.preventDefault(); // 폼 제출 방지
                return false; // 반복문 중단
            }
        });
           if (!isValid) {
            event.preventDefault(); // 폼 제출 방지
        }
	});
});