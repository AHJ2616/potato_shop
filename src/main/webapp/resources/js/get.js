$(document).ready(function() {
    var modal = $("#deleteModal");
    let boardNumber;
    
    // 리스트 페이지 이동
    document.getElementById('listBtn').addEventListener('click', function() {
       window.location.href = '/shop/list';
      });
    
    // 삭제 버튼 클릭 시 모달 열기
    $("#removeBtn").on("click", function() {
       boardNumber = $("input[name='board_number']").val();
       modal.modal("show");
    });
 
    // 모달의 삭제 확인 버튼 클릭 시 삭제 요청
    $("#confirmDeleteBtn").on("click", function() {
       $.ajax({
          url: "/shop/remove",
          type: "POST",
          data: { board_number: boardNumber },
          success: function() {
             alert("삭제되었습니다.");
             modal.modal("hide");
             window.location.href = '/shop/list';
          },
          error: function() {
             alert("삭제 중 오류가 발생했습니다.");
          }
       });
    });
 
    // 좋아요 버튼 클릭 시
    $("#likeBtn").on("click", function(event) {
       event.preventDefault(); // 기본 제출 방지
       let likesInput = $("#likes");
       let currentLikes = parseInt(likesInput.val());
       let newLikes = currentLikes + 1;
       likesInput.val(newLikes);
       $("#likesCount").text(newLikes);

       // JSON 데이터 생성
       const data = {
          board_number: $("#board").val(),
          type: "likes",
          value: newLikes
       };

    });
 
    // 관심 버튼 클릭 시
    $("#interestBtn").on("click", function() {
       let interestInput = $("#interest");
       let currentInterest = parseInt(interestInput.val());
       let newInterest = currentInterest + 1;
       interestInput.val(newInterest);
       $("#interestCount").text(newInterest);
       updateValue("interest", newInterest);
    });
 
    // 값을 서버에 업데이트하는 함수
    function updateValue(type, value) {
       $.ajax({
          url: "/shop/update",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({ type: type, value: value }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
    }
 });