$(document).ready(function() {
	// 폼 제출 시
    $('#memberForm').on('submit', function(event) { // .on('submit', ...)으로 변경
		event.preventDefault(); // 기본 제출 방지
		let isValid = true; // 유효성 검사 플래그 초기화

		$('#memberForm input[required]').each(function() {
			if (!$(this).val().trim()) {
				showCustomAlert($(this).data('error'), `#alert-${this.id}`); // 사용자 정의 알림 표시
				$(this).focus(); // 비어있는 필드에 포커스
				highlightField($(this)); // 필드 강조
				isValid = false; // 유효성 검사 실패
				return false; // 반복문 중단
			}
		});

		// 전화번호 유효성 검사 추가
		const phoneInput = $('#phone'); // 전화번호 입력 필드 선택
		const phoneValue = phoneInput.length ? phoneInput.val().trim() : ''; // 필드가 존재하는지 확인
		if (phoneValue && !/^\d{11}$/.test(phoneValue)) {
			showCustomAlert('전화번호는 11자리 숫자만 입력할 수 있습니다.', '#alert-phone'); // 사용자 정의 알림 표시
			phoneInput.focus(); // 전화번호 필드에 포커스
			highlightField(phoneInput); // 필드 강조
			isValid = false; // 유효성 검사 실패
		}

		// 추가: 모든 필드가 유효할 경우에만 제출
		if (isValid) {
			this.submit(); // 유효성 검사 통과 시 폼 제출
			
			// 성공 메시지 또는 오류 메시지 표시
			const success_message = $('#success').val(); // 성공 메시지 가져오기
			const error_message = $('#errorMessage').val(); // 오류 메시지 가져오기

			if (success_message) {
				alert(success_message); // 성공 메시지 알림
			} else if (error_message) {
				alert(error_message); // 오류 메시지 알림
			}
			// 폼 제출
			
		}
    });

	    $('#delete').click(function(e) {
        e.preventDefault(); // 기본 링크 동작 방지
        $('#passwordModal').show(); // 모달 창 표시
    });
     $('#closeModal').click(function() {
        $('#passwordModal').hide(); // 모달 창 닫기
    });

    $('#passwordForm').submit(function(e) {
        e.preventDefault(); // 기본 폼 제출 방지
        let pass = $('#pass').val();
        let id = $('#id').val();
        // AJAX 요청
        $.ajax({
            url: '/rest/delete', // 비밀번호 확인을 위한 URL
            type: 'POST',
            contentType: 'application/json',
               data: JSON.stringify({pass:pass,id:id}), // JSON 문자열로 변환
            success: function(response) {
                // 성공 시 처리
                if (response.success) {
                } else {
                    alert('비밀번호가 틀렸습니다.');
                }
            },
            error: function() {
                alert('오류가 발생했습니다.');
            }
        });
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
