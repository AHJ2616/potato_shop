<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl 코어 태그용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl 포메팅 태그용 -->

<%@ include file="../common/header.jsp"%>
<script src="/resources/js/button.js"></script>

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
		<form>
		<div class="form-group">
			<input type="hidden" id="likes" name="likes" value="<c:out value="${board.likes}"/>"/>
			<input type="hidden" id="board" name="board" value="<c:out value="${board.board_number}"/>"/>
			<input type="hidden" id="type" name="type" value="likes"/>
            <button id="likeBtn" class="btn btn-success" type="submit">
                <span id="likesCount"><c:out value="${ board.likes }" /></span> 좋아요
            </button>
        </div>
        </form>
        <div class="form-group">
        	<input type="hidden" id="interest" name="interest" value='<c:out value="${ board.interest }"/>'/>
            <button id="interestBtn" class="btn btn-warning" type="button">
                <span id="interestCount"><c:out value="${ board.interest }" /></span> 관심
            </button>
        </div>

        <form id="setup" action="/shop/modify" method="get">
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

<%@ include file="../common/footer.jsp"%>