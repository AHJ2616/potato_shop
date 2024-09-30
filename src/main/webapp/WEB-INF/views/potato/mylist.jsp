<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/mypage.css">
<div class="mypage-container">
	<div class="mypage-member">
		<c:if test="${check!=sessionScope.id}">
		<h2><c:out value="${check}" />님의 활동내역</h2>
		</c:if>
		<c:if test="${check==sessionScope.id}">
		<h2>나의 활동내역</h2>
		</c:if>
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
					<td><fmt:formatDate value="${board.regidate}" pattern="yyyy년 MM월 dd일" /></td>
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
					<td><fmt:formatDate value="${reply.regidate}" pattern="yyyy년 MM월 dd일" /></td>
				</tr>
				</c:forEach>
			</table>
			<table class="member-table">
				<tr>
					<td><strong>신고내용</strong></td>
				</tr>
				
				<tr>
					<td>신고대상</td>
					<td>신고일</td>
					<td>처리상태</td>
					
				</tr>
				<c:forEach var="reports" items="${reportVO}">
				<tr>
					<td><c:out value="${reports.defendant_id}"/></td>
					<td><fmt:formatDate value="${reports.regidate}" pattern="yyyy년 MM월 dd일" /></td>
					<td><c:choose>
					<c:when test="${reports.status == 0}"><span>검토 예정</span></c:when>
					<c:when test="${reports.status == 1}"><span>처리 완료</span></c:when>
					</c:choose></td>
				</tr>
				</c:forEach>
			</table>
			
		</div>
		<div class="member-info">
			<table class="member-table">
				<tr>
					<td><strong>후기 답글</strong></td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<c:forEach var="re_reply" items="${re_replyVO}">
				<tr>
					<td><c:out value="${re_reply.writer}" /></td>
					<td><fmt:formatDate value="${re_reply.regidate}" pattern="yyyy년 MM월 dd일" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
	<%@ include file="../common/footer.jsp"%>