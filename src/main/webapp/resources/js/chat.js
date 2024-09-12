$(document).ready(function() {
            const sender = $('#sender').val(); // 보내는사람
			const chat_number = $('#chat_number').val();
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
  
  setInterval(function() {
  loadMessages();
}, 5000); // 1초마다 채팅내용을 불러옵니다.
  
});
            