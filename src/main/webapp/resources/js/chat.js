$(document).ready(function() {
            const sender = '$(#sender")'; // 보내는사람
            const chat_number = '$(#chat_number")'; // Recipient user ID
            const time_stamp = '$(#time_stamp)';

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
                        $('#message-input').val(''); // Clear input field
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
      type: 'GET',
      data: {
        chat_number: chat_number
      },
      success: function(response) {
        $('.message-left').empty();
        $('.message-right').empty();
        response.forEach(function(chatVO) {
          const messageClass = chatVO.sender === sender?'message-right' :'message-left';
          const messageHTML = `
            <div class="message">
              <span class="sender">${chatVO.sender}</span>
              <span class="content">${chatVO.content}</span>
              <span class="time-stamp">${chatVO.time_stamp}</span>
              ${msg.sender === sender? '<button id="delete-button" class="btn btn-danger">삭제하기</button>' : ''}
            </div>
          `;
          $(`.${messageClass}`).append(messageHTML);
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
                const message = $('#message-input').val().trim();
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
});
            