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

 $('#alarm_button').click(function(e) {
        e.preventDefault(); // 기본 링크 동작 방지
        let alarm_list = document.getElementById('alarm_list');
        alarm_list.style.display = alarm_list.style.display === 'none' ? 'block' : 'none';
    });
 $('#hide').click(function(event){
	  event.preventDefault(); // 기본 링크 동작 방지
      document.getElementById('alarm_list').style.display = 'none'; // 알림 목록 숨기기
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
          if(response.member_number=='admin'){
		  window.location.href ='/admin/home'
		  }else{
          window.location.href = window.location.href;
          }
        } else {
          alert('로그인 실패: 아이디 또는 비밀번호가 올바르지 않습니다.');
          window.location.href = '/potato/login';
          
        }
      },
      error: function(xhr, status, error) {
        alert('로그인 실패: ' + (xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : '서버 오류가 발생했습니다.'));
      }
    });
  });

  // 로그아웃 처리
  $('#logoutLink').click(logout);
  
  //로그아웃 함수
  function logout(e) {
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
  };
  
  //회원가입 버튼 처리
  $('#register').click(function(e){
	e.href= potato/register;
	
});
window.addEventListener('unload', logout);
});   

$('#del_all').on('click',function(e) {
    e.preventDefault(); // 기본 링크 동작 방지
    let member_number = $('#session_number').val();
    $.ajax({
        url: '/alarm/delete_all',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({member_number:member_number}), // 알림 내용 전송
        success: function(response) {
             $li.remove();
        },
        error: function(xhr, status, error) {
            alert('알림 삭제 실패: ' + (xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : '서버 오류가 발생했습니다.'));
        }
    });
});

$('#alarm_del').on('click',function(e) {
    e.preventDefault(); // 기본 링크 동작 방지
    let $li = $(this).closest('li');
    let data = {
        alarm_number: $li.find('#a_number').val(),
        member_number: $('#session_number').val(),
        target_type: $li.find('#a_target_type').val(),
        target_key: $li.find('#a_target_key').val(),
        status: $li.find('#a_status').val(),
    };
    $.ajax({
        url: '/alarm/delete',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data), // 알림 내용 전송
        success: function(response) {
             $li.remove();
             refresh_alarm();
        },
        error: function(xhr, status, error) {
            alert('알림 삭제 실패: ' + (xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : '서버 오류가 발생했습니다.'));
        }
    });
});

$('#alarm_func').on('click',function(e) {
    e.preventDefault(); // 기본 링크 동작 방지
    let $li = $(this).closest('li');
    let data = {
        alarm_number: $li.find('#a_number').val(),
        member_number: $('#session_number').val(),
        target_type: $li.find('#a_target_type').val(),
        target_key: $li.find('#a_target_key').val(),
        status: $li.find('#a_status').val(),
    };
    $.ajax({
        url: '/alarm/func',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data), // 알림 내용 전송
        success: function(url) {
		let redirect_url = url;
        console.log('url주소:'+redirect_url);
		window.location.href = redirect_url;
        

        },
        error: function(xhr, status, error) {
            alert('알림 삭제 실패: ' + (xhr.responseJSON && xhr.responseJSON.message ? xhr.responseJSON.message : '서버 오류가 발생했습니다.'));
        }
    });
});

$(document).on('pagechange', function() {
    refresh_alarm();
});

function refresh_alarm(){
	let session_number = document.getElementById('session_number');
	$.ajax({
      url: '/rest/alarm',
      type: 'POST',
      dataType: 'json',
      data:  JSON.stringify({
	member_number : session_number
	})
	});
}

  