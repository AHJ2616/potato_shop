<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/admin_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/admin.css">

<div class="main-content">

	<div class="content-wrapper">
		<div class="left-panel">
			<section class="section">
				<h2 class="section-title">회원 검색</h2>
				<form action="/admin/memberList" method="GET">
					<div class="form-group">
						<input type="text" id="searchInput" name="id" class="form-control"
							placeholder="회원 ID 입력">
						<button type="submit" id="searchBtn" class="btn">검색</button>
					</div>
				</form>
			</section>

			<c:if test="${not empty message}">
				<div class="alert alert-warning">${message}</div>
			</c:if>

			<section class="section">
				<h2 class="section-title">신고 내역</h2>
				<table class="table">
					<thead>
						<tr>
							<th>신고자</th>
							<th>대상</th>
							<th>신고날짜</th>
							<th>신고내용확인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reportVO" items="${reportList}">
							<tr>
								<td><c:out value="${reportVO.writer_id}" /></td>
								<td><c:out value="${reportVO.defendant_id}" /></td>
								<td><fmt:formatDate value="${reportVO.regidate}"
										pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
								<td><a
									href="/admin/report?report_number=${reportVO.report_number}">검토하기</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>

		<div class="right-panel">
			<section class="section">
				<h2 class="section-title">블랙리스트 관리</h2>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>등록일</th>
							<th>해제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="blacklist" items="${black}">
							<tr>
								<td><c:out value="${blacklist.id}" /></td>
								<td><fmt:formatDate value="${blacklist.update_date}"
										pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
								<td>
									<form method="post" action="/admin/blacklist"
										onsubmit="return confirmClearBlacklist();">
										<input type="hidden" name="member_number"
											value="${blacklist.member_number}" /> <input type="hidden"
											name="grade" value="0" />
										<button class="btn">해제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
			<section class="section">
				<h2 class="section-title">고객의 편지</h2>
				
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>내용</th>
							<th>등록일</th>
							<th>IP주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="coment" items="${coments}">
								<tr>
									<td>
									<c:choose>
									<c:when test="${coment.id=='비회원'}">
									<c:out value="${coment.id}" />
									</c:when>
									<c:otherwise>
									<a href="/admin/memberList?id=${coment.id}">
									<c:out value="${coment.id}" />
									</a>
									</c:otherwise>
									</c:choose>
									</td>
									<td><c:out value="${coment.message}" /></td>
									<td><fmt:formatDate value="${coment.regidate}"
											pattern="yyyy년 MM월 dd일" /></td>
									<td><c:out value="${coment.ip_address}" /></td>
								</tr>
							</c:forEach>
					</tbody>
				</table>
			</section>

			<section class="section">
				<h2 class="section-title"
					style="display: flex; justify-content: space-between; align-items: center;">
					관리자 공지 <a
						href="../admin/notiView?member_number=${sessionScope.member_number}"
						style="font-size: 14px;">>>더보기</a>
				</h2>
				<table class="table">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="notification" items="${noti}">
							<tr>
								<td><c:out value="${notification.title}" /></td>
								<td><c:out value="${notification.writer}" /></td>
								<td><fmt:formatDate value="${notification.regidate}"
										pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
	</div>
</div>

<script>
	function confirmClearBlacklist() {
		return confirm("정말로 블랙리스트에서 해제하시겠습니까?");
	}
</script>

<%@ include file="../common/footer.jsp"%>