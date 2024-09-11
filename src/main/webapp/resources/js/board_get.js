$(document).ready(function() {
	var modal = $("#deleteModal");
	var boardNumber;
	
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
	$("#likeForm").on("submit", function() {
		let board_number = $("#board_number").val();
		let data = {"type":"likes","board_number":board_number};
		updateValue(data);
		location.reload();
	});

	// 관심 버튼 클릭 시
	$("#interestForm").on("submit", function() {
		let board_number = $("#board_number").val();
		let data = {"type":"interest","board_number":board_number};
		updateValue(data);
		location.reload();
	});

	// 값을 서버에 업데이트하는 함수
	function updateValue(data) {
		$.ajax({
			url: "/shop/update",
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function() {
			},
			error: function() {
				alert("업데이트 실패");
			}
		});
	}
	
});