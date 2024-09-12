<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../common/header.jsp" %>
  <link rel="stylesheet" href="/resources/css/admin.css">
  	<div class="dashboard">
		<header class="dashboard-header">
			<h1 class="dashboard-title">포테이토 서비스 관리 시스템</h1>
			관리자 : <span style="font-weight: bold;"><c:out
					value="${member.name}" /></span>
		</header>

		<div class="main-content">
            <div class="content-wrapper">
                <div class="left-panel">
                    <section class="section">
                        <h2 class="section-title">회원 검색</h2>
                        <form>
                            <div class="form-group">
                                <input type="text" id="searchInput" class="form-control" placeholder="회원 ID 입력">
                                <button type="submit" id="searchBtn" class="btn">검색</button>
                            </div>
                        </form>
                    </section>

					<section class="section">
						<h2 class="section-title">신고 내역</h2>
						<table class="table">
							<thead>
								<tr>
									<th>신고번호</th>
									<th>신고자</th>
									<th>대상</th>
									<th>신고날짜</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reportVO" items="${reportList}">
									<tr>
										<td><c:out value="${reportVO.report_number}" /></td>
										<td><c:out value="${reportVO.writer_id}" /></td>
										<td><c:out value="${reportVO.defendant_name}" /></td>
										<td><fmt:formatDate value="${reportVO.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
										<td><button class="btn view-member"	data-id="${blacklist.report_number}">블랙</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
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
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="blacklist" items="${black}">
									<tr>
										<td><c:out value="${blacklist.id}" /></td>
										<td><fmt:formatDate value="${blacklist.update_date}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
										<td><button class="btn view-member"	data-id="${blacklist.member_number}">해제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</section>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../resources/js/admin.js"></script>
  
  <%@ include file="../common/footer.jsp" %>