$(document).ready(function() {
	
	
    let modal = $("#deleteModal");
    let board_number = document.getElementById("board_number").value;
    let member_number = document.getElementById("member_number").value;
    
     // 좋아요 버튼
    $("#likeBtn").on("click", function() {
	console.log('실행1:'+member_number);
	if(member_number && member_number.trim() !== ''){
       $.ajax({
          url: "/shop/update_like",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
		  likes : '1', 
		  likes_board_number: board_number, 
		  likes_member_number: member_number
		  }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
             window.location.reload();
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
  
}
else{ alert("로그인 후 이용해주세요.");}
    });
 
    // 좋아요 취소 버튼
    $("#cancelLikeBtn").on("click", function() {
       $.ajax({
          url: "/shop/cancel_like",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
		  likes : '0', 
		  likes_board_number: board_number, 
		  likes_member_number:member_number
		  }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
             window.location.reload();
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
    });
    
     // 관심 취소
    $("#cancelInterestBtn").on("click", function() {
       $.ajax({
          url: "/shop/cancel_interest",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
		  interest : '0', 
		  likes_board_number: board_number, 
		  likes_member_number: member_number
		  }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
             window.location.reload();
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
  

    });
 
    // 관심 버튼
    $("#interestBtn").on("click", function() {
	if(member_number && member_number.trim() !== ''){
       $.ajax({
          url: "/shop/update_interest",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
		  interest : '1', 
		  likes_board_number: board_number, 
		  likes_member_number: member_number
		  }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
             window.location.reload();
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
       }else{ alert("로그인 후 이용해주세요.");}
    });
    
    // 리스트 페이지 이동
    document.getElementById('listBtn').addEventListener('click', function() {
       window.location.href = '/shop/list';
      });
    
    // 삭제 버튼 클릭 시 모달 열기
    $("#removeBtn").on("click", function() {
       modal.modal("show");
    });
 
    // 모달의 삭제 확인 버튼 클릭 시 삭제 요청
    $("#confirmDeleteBtn").on("click", function() {
       $.ajax({
          url: "/shop/remove",
          type: "POST",
          data: { board_number: board_number },
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
 
   
 
 });