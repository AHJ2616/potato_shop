$(document).ready(function() {
  $('#coments').on('submit', function(event) {
     event.preventDefault(); // 기본 form 제출 동작 방지
     let message = $('#coment').val();
     let id = $('#id').val()     
	 if(id==null || id==""){id="비회원";
	 }
                $.ajax({
                    url: '/rest/coments',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({"message":message,"id":id}),
                    success: function(response) {
						 $('#coment').val(''); // Clear input field
                        alert('소중한 의견 감사합니다');
                    },
                    error: function(xhr, status, error) {
                        alert('제출 실패: ' + error);
                        console.log(xhr.responseText);
                    }
                });
            });
        });