<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../common/admin_header.jsp" %>
  <link rel="stylesheet" href="/resources/css/admin.css">
  	<div class="dashboard">
		<header class="dashboard-header">
			<h1 class="dashboard-title">포테이토 서비스 관리 시스템</h1>
			관리자 : <span style="font-weight: bold;"><c:out
					value="${sessionScope.name}" /></span>
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
									<th>신고내용확인</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reportVO" items="${reportList}">
									<tr>
										<td><c:out value="${reportVO.report_number}" /></td>
										<td><c:out value="${reportVO.writer_id}" /></td>
										<td><c:out value="${reportVO.defendant_id}" /></td>
										<td><fmt:formatDate value="${reportVO.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
										<td><a href="/admin/report?report_number=${reportVO.report_number}">검토하기</a></td>
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
									<th>해제하기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="blacklist" items="${black}">
									<tr>
										<td><c:out value="${blacklist.id}" /></td>
										<td><fmt:formatDate value="${blacklist.update_date}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
										<td><form method="post" action="/admin/blacklist">
										<input type="hidden" name="member_number" value="${blacklist.member_number}"/>
										<input type="hidden" name="grade" value="0"/>
										<button>해제</button>
										</form></td>
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
								</tr>
							</thead>
							<tbody>
								<c:forEach var="coment" items="${coments}">
									<tr>
										<td><c:out value="${coment.id}" /></td>
										<td><c:out value="${coment.message}"/></td>
										<td><fmt:formatDate value="${coment.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
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