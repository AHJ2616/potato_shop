$(document).ready(function() {
            const sender = $('#sender').val(); // 보내는사람
			const chat_number = $('#chat_number').val();
			let status = $('#set_status').val();
			let buyer_number = $('#buyer_number').val();
			let celler_number = $('#celler_number').val();
			let board_number = $('board_number').val();
			
            // 채팅보내기
            function sendMessage(message) {
                $.ajax({
                    url: '/chat/send',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        sender: sender,
                        chat_number: chat_number,
                        content: message,
                        time_stamp: new Date() // Optional, if needed
                    }),
                    success: function() {
                        $('#content').val(''); // Clear input field
                        loadMessages(); // Reload messages
						$('.chat-body').scrollTop($('.chat-body')[0].scrollHeight);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error sending message:', error);
                    }
                });
            }

            // 채팅내용 불러오기
    function loadMessages() {
    $.ajax({
      url: '/chat/messages',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
        chat_number:chat_number
      }),
      success: function(response) {
	  let chat_list = response; //list<ChatVO> 넣기
        $('.message-left').empty();
        $('.message-right').empty();
        chat_list.forEach(function(chat) {
		const formattedTime = new Date(chat.time_stamp).toLocaleString('ko-KR', {
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        hour12: false
    }).replace(',', ''); // 쉼표 제거
          const messageClass = chat.sender === sender?'.message-right' :'.message-left';
          const messageHTML = `
            <div class="message">
              <span class="content">${chat.content}</span><br>
              <span class="time-stamp">${formattedTime}</span>
            </div>
          `;
           $(messageClass).append(messageHTML);
        });
        $('.chat-messages').scrollTop($('.chat-messages')[0].scrollHeight); // Scroll to bottom
      },
      error: function(xhr, status, error) {
        console.error('Error loading messages:', error);
      }
    });
  }


            // 채팅 지우기
            function deleteMessage(chatNumber) {
                $.ajax({
                    url: '/chat/delete',
                    type: 'insert',
                    data: {
                        sender: sender,
                        chat_number: chat_number,
                        time_stamp : time_stamp
                    },
                    success: function() {
                        loadMessages(); // Reload messages after deletion
                    },
                    error: function(xhr, status, error) {
                        console.error('Error deleting message:', error);
                    }
                });
            }

            // Load messages initially
            loadMessages();

            // 전송버튼 눌러서 전송하기
            $('#send-button').click(function() {
                const message = $('#content').val().trim();
                if (message) {
                    sendMessage(message);
                }
            });

            // 엔터키를 눌러도 전송이 되게하기
            $('#message-input').keypress(function(e) {
                if (e.which === 13) { // Enter key
                    $('#send-button').click();
                }
            });
              // 삭제버튼 눌러서 삭제하기
  $(document).on('click', '.delete-button', function() {
    const time_stamp = $(this).parent().find('.time-stamp').text();
    deleteMessage(chat_number, time_stamp);
  });
  
function chat_status() {
	console.log("status=" + status +" ,chat_number="+chat_number);
    $.ajax({
      url: '/chat/status',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({
            chat_number: chat_number,
            status: status,
            board_number:board_number,
            celler_number:celler_number,
            buyer_number:buyer_number
        }),
        success: function(response) {
            console.log('예약신청 성공:', response);
            window.location.href = window.location.href;
            // 추가적인 성공 처리 로직
        },
        error: function(xhr, status, error) {
            console.error('예약신청 오류:', error);
        }
    });
}

$("#buyBtn").on('click',chat_status);
$("#buyBtn2").on('click',chat_status);
$("#cellBtn").on('click',chat_status);
$("#cellBtn2").on('click',chat_status);  
loadMessages();
function focus_roll(){ $('.chat-body').scrollTop($('.chat-body')[0].scrollHeight);	}
focus_roll;		
  setInterval(function() {
  loadMessages();
}, 5000); // 3초마다 채팅내용을 불러옵니다.
  
});
            