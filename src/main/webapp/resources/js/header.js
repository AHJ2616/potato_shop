$(document).ready(function() {
  // 로그인 링크 클릭 시 모달 표시
  $('a[href="#login"]').click(function(e) {
    e.preventDefault();
    $('#loginModal').show();
  });

  // 모달 닫기 버튼 클릭 시 모달 숨기기
  $('.close').click(function() {
    $('#loginModal').hide();
  });

  // 모달 외부 클릭 시 모달 숨기기
  $(window).click(function(e) {
    if ($(e.target).is('#loginModal')) {
      $('#loginModal').hide();
    }
  });

  // 로그인 폼 제출
  $('#loginForm').submit(function(e) {
    e.preventDefault();
    $.ajax({
      url: '/rest/login',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
        id: $('#loginId').val(),
        pass: $('#loginPass').val()
      }),
      success: function(response) {
        if (response && response.id) {
          alert('로그인 성공');
          $('#loginModal').modal('hide');
          window.location.href = window.location.href;
        } else {
          alert('로그인 실패: 아이디 또는 비밀번호가 올바르지 않습니다.');
        }
      },
      error: function(xhr, status, error) {
        alert('로그인 실패: ' + (xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : '서버 오류가 발생했습니다.'));
      }
    });
  });

  // 로그아웃 처리
  $('#logoutLink').click(function(e) {
    e.preventDefault();
    $.ajax({
      url: '/rest/logout',
      type: 'GET',
      dataType: 'json',
      success: function(response) {
        alert(response.message);
        window.location.href = response.redirect;
      },
      error: function() {
        alert('로그아웃 처리 중 오류가 발생했습니다.');
      }
    });
  });
  
  //회원가입 버튼 처리
  $('#register').click(function(e){
	e.href= potato/register;
	
});
});