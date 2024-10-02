<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/admin_header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자게시판 - 상세보기</title>
    <link rel="stylesheet" href="/resources/css/notiview.css">
</head>
<body>
    <div class="container">
        <h1>공지</h1>
            <div class="form-row">
                <label for="title">제목</label>         
                <input type="text" id="title" name="title" class="form-control" value="${notice.title}" readonly>             
            </div>

            <div class="form-row">
                <label for="content">내용</label>
                <textarea id="content" name="content" class="form-control" rows="10" readonly>${notice.content}</textarea>
            </div>
            
           <div class="form-actions">
    <input type="hidden" name=writer value="${sessionScope.member_number}">
    <input type="hidden" name="notice_number" value="${notice.notice_number}">

    <c:if test="${sessionScope.member_number eq notice.writer}"> 
        <!-- 수정 버튼 -->
        <form action="/admin/modifyNotice" method="post" onsubmit="return confirmModify();" style="display:inline;">
            <input type="hidden" name="notice_number" value="${notice.notice_number}">
            <input type="hidden" name="writer" value="${sessionScope.member_number}">
            <button type="submit" class="btn" id="modifyBtn">수정</button>
        </form>

        <!-- 삭제 버튼 -->
        <form action="/admin/deleteNotice" method="post" onsubmit="return confirmDelete();" style="display:inline;">
            <input type="hidden" name="notice_number" value="${notice.notice_number}">
            <button type="submit" class="btn" id="deleteBtn">삭제</button>
        </form>
     </c:if>

    <!-- 돌아가기 버튼 -->
    <button type="button" class="btn" onclick="window.history.back();">돌아가기</button>
</div>
</div>

     
    

    <script>
    function confirmModify() {
        return confirm("정말로 수정하시겠습니까?");
    }
    
    
    function confirmDelete() {
        return confirm("정말로 삭제하시겠습니까?");
    }
    </script>
</body>
</html>
