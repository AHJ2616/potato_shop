<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/admin_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>관리자게시판 - 상세보기</title>
    <link rel="stylesheet" href="/resources/css/memberList.css">
</head>
<body>
    <div class="dashboard">
        <header class="dashboard-header">
            <h1 class="dashboard-title">포테이토 관리자 게시판</h1>
        </header>
        <section class="section">
            <h2 class="section-title"></h2>
            <div class="container">
                <div class="form-row">
                     <div class="form-group">
                        <label for="reportNumber">작성자</label>
                        <input type="text" id="reportNumber" name="report_number" class="form-control" value="${reportVO.report_number}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="reportDate">등록일</label>
                        <input type="text" id="reportDate" name="regidate" class="form-control" value="<fmt:formatDate value='${reportVO.regidate}' pattern='yyyy년 MM월 dd일 (E) HH:mm:ss' />" readonly>
                    </div>
                </div>
                
                 <div class="form-row">
                <div class="form-group">
                    <label for="writerId">글제목</label>
                    <input type="text" id="writerId" name="writer_id" class="form-control" value="${reportVO.writer_id}" readonly>
                </div>
            </div>
                
                <div class="form-row">
                    <div class="form-group" style="width: 100%;">
                        <label for="reportContent">신고내용</label>
                        <textarea id="reportContent" name="content" class="form-control" readonly>${reportVO.content}</textarea>
                    </div>
                </div>
                <%-- <div class="form-actions" style="margin-top: 1rem;">
                    <form method="post" action="/admin/report_do" style="display: flex; gap: 1rem;">
                        <input type="hidden" name="defendant" value="${reportVO.defendant}" />
                        <input type="hidden" name="report_number" value="${reportVO.report_number}" />
                        <input type="hidden" name="writer_id" value="${reportVO.writer_id}" />
						<button class="btn">등록</button> 
                    </form> --%>
                    <button type="button" class="btn" onclick="window.history.back();">돌아가기</button>
                </div>
            </div>
        </section>
    </div>
</body>
</html>