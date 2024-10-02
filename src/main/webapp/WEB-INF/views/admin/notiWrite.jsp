<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/admin_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>관리자게시판 - 상세보기</title>
    <link rel="stylesheet" href="/resources/css/notiview.css">
</head>
<body>
      
        <div class="container">
        <h1>공지 작성</h1>
        <form action="/admin/notiWrite/registration" method="post" class="form-group">
            <!-- 제목 입력 -->
            <div class="form-row">
                <label for="title">제목</label>         
                <input type="text" id="title" name="title" class="form-control" placeholder="공지 제목을 입력하세요" required>             
            </div>

              <label for="important">중요:</label>
                <input type="checkbox" id="important" name="important" value="1">
            <!-- 내용 입력 -->
            <div class="form-row">
                <label for="content">내용</label>
                <textarea id="content" name="content" class="form-control" rows="10" placeholder="공지 내용을 입력하세요" required></textarea>
            </div>

            <!-- 제출 버튼 -->
            
            <div class="form-actions">
             <input type="hidden" name="writer" value="${sessionScope.member_number}">
                    <button type="submit" class="btn" id="modifyBtn">등록</button>
                    <button type="button" class="btn" onclick="window.history.back();">돌아가기</button>
                </div>
        </form>
    </div>
</body>
</html>