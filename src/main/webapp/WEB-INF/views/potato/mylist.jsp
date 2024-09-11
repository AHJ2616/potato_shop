<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
<div class="mypage-container">
	<div class="mypage-member">
		<h2>나의 활동내역</h2>
		<div class="member-info">
			<table class="member-table">
				<tr>
					<td><strong>작성한 글</strong></td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td>상품의 상태</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
				<c:forEach var="board" items="${boardVO}">
				<tr>
					<td><a href="/shop/get?board_number=${board.board_number}"><c:out value="${board.title}" /></a></td>
					<td><c:out value="${board.status}" /></td>
					<td><c:out value="${board.regidate}" /></td>
					<td><c:out value="${board.views}" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="member-info">
			<table class="member-table">
				<tr>
					<td><strong>후기</strong></td>
				</tr>
				
				<tr>
					<td>판매자</td>
					<td>작성일</td>
				</tr>
				<c:forEach var="reply" items="${replyVO}">
				<tr>
					<td><c:out value="${reply.id}" /></td>
					<td><c:out value="${reply.regidate}" /></td>
				</tr>
				</c:forEach>
			</table>
			<table class="member-table">
				<tr>
					<td><strong>신고내용</strong></td>
				</tr>
				
				<tr>
					<td>신고번호</td>
					<td>신고일</td>
					
				</tr>
				<c:forEach var="reports" items="${reportVO}">
				<tr>
					<td><c:out value="${reports.report_number}" /></td>
					<td><c:out value="${reports.regidate}" /></td>
				</tr>
				</c:forEach>
			</table>
			
		</div>
		<div class="member-info">
			<table class="member-table">
				<tr>
					<td><strong>후기</strong></td>
				</tr>
				
				<tr>
					<td>판매자</td>
					<td>작성일</td>
				</tr>
				<c:forEach var="reply" items="${replyVO}">
				<tr>
					<td><c:out value="${reply.id}" /></td>
					<td><c:out value="${reply.regidate}" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
	<%@ include file="../common/footer.jsp"%>