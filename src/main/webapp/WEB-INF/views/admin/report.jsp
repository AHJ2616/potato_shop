<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고내용-상세</title>
</head>
  <link rel="stylesheet" href="/resources/css/admin.css"> 	    
<body>
<div class="dashboard">
		<header class="dashboard-header">
			<h1 class="dashboard-title">포테이토 서비스 관리 시스템</h1>
		</header>
		<section class="section">
						<h2 class="section-title">신고 내역</h2>
						<table class="table">
							<thead>
								<tr>
									<th>신고번호</th>
									<th><c:out value="${reportVO.report_number}" /></th>
									<th>신고날짜</th>
									<th><fmt:formatDate value="${reportVO.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td>신고 작성자</td>
										<td><c:out value="${reportVO.writer_id}" /></td>
										<td>신고 대상</td>
										<td><c:out value="${reportVO.defendant_id}" /></td>
									</tr>
									<tr>
									<td align="center">신고내용</td>
									</tr>
									<tr>
									<td><c:out value="${reportVO.content}" /></td>
									</tr>
							</tbody>
						</table>
						<div>
						   <form method="post" action="/admin/report_do">
						   <input type="hidden" name="defendant" value="${reportVO.defendant}" />
						   <input type="hidden" name="report_number" value="${reportVO.report_number}" />
						   <input type="hidden" name="writer_id" value="${reportVO.writer_id}" />
						   <input type="radio" name="status" value="4"> 블랙리스트 등록
						   <input type="radio" name="status" value="0"> 경고 조치
						   <button>처리하기</button>
						   </form>
						</div>
					</section>
		
		
	    </div>
</body>
</html>