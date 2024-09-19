$(document).ready(function() {
    $('#regBtn2').click(function() {
        window.location.href = '/shop/register';
    });

document.addEventListener('DOMContentLoaded', function() {
	// 상품 리스트의 모든 링크에 클릭 이벤트를 추가
	document.querySelectorAll('.box a').forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault();

			// 상품 번호를 URL에서 추출
			var href = this.getAttribute('href');
			var boardNumber = href.split('board_number=')[1];
			// 조회수 증가를 위한 AJAX 요청
			$.ajax({
				url: "/shop/update",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify({ "type": "views", "board_number": boardNumber }),
				success: function() {
					window.location.href = href;
				},
				error: function() {
					alert("업데이트 실패");
				}
			});
		});
	});

});
});