<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl 코어 태그용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl 포메팅 태그용 -->

<%@ include file="../common/header.jsp"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세보기</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<div class="product-details" align="center">
		<div class="product-image">
			<img id="productImage" src="../resources/images/${board.photo_name}"
				alt="">
		</div>
		<div class="formbold-mb-3">
			<div>
				<input name="title" class="formbold-form-input"
					value='<c:out value="${ board.title }"/>' readonly="readonly" />
			</div>
		</div>
		<div class="form-group">회원주소</div>
		<div class="form-group">
			<input class="form-control" name="title"
				value='<c:out value="${ board.status }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" name="content"
				value='<c:out value="${ board.content }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" name="price"
				value='<c:out value="${ board.price }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
            <button id="likeBtn" class="btn btn-success" type="button">
                <span id="likesCount"><c:out value="${ board.likes }" /></span> 좋아요
            </button>
            <input type="hidden" id="likes" name="likes" value='<c:out value="${ board.likes }"/>'/>
        </div>
        <div class="form-group">
            <button id="interestBtn" class="btn btn-warning" type="button">
                <span id="interestCount"><c:out value="${ board.interest }" /></span> 관심
            </button>
            <input type="hidden" id="interest" name="interest" value='<c:out value="${ board.interest }"/>'/>
        </div>

        <form action="/shop/modify" method="get">
            <input type="hidden" name="board_number" value='<c:out value="${ board.board_number }"/>' />
            <button id="contactSeller" type="button" class="btn btn-warning">대화연결</button>
            <button id="modifyBtn" type="submit" class="btn btn-primary">수정</button>
            <button id="removeBtn" type="button" class="btn btn-danger">삭제</button>
            <button id="listBtn" type="button" class="btn btn-info">리스트</button>
        </form>

        <!-- 삭제 모달 -->
        <div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">삭제 확인</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>정말로 삭제하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="button" id="confirmDeleteBtn" class="btn btn-danger">삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            var modal = $("#deleteModal");
            var boardNumber;

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
            $("#likeBtn").on("click", function() {
                let likesInput = $("#likes");
                let likesCount = $("#likesCount");
                let currentLikes = parseInt(likesInput.val());
                let newLikes = currentLikes + 1;
                likesInput.val(newLikes);
                likesCount.text(newLikes);
                updateValue("likes", newLikes);
            });

            // 관심 버튼 클릭 시
            $("#interestBtn").on("click", function() {
                let interestInput = $("#interest");
                let interestCount = $("#interestCount");
                let currentInterest = parseInt(interestInput.val());
                let newInterest = currentInterest + 1;
                interestInput.val(newInterest);
                interestCount.text(newInterest);
                updateValue("interest", newInterest);
            });

            // 값을 서버에 업데이트하는 함수
            function updateValue(type, value) {
                $.ajax({
                    url: "/shop/likes",
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
    </script>
<%@ include file="../common/footer.jsp"%>