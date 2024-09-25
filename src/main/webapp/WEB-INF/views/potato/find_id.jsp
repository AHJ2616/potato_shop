<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<%@ include file="../common/header.jsp"%>
<script src="/resources/js/find_id.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<div class="login-container">
	<div class="login-container2">
    <form action="/potato/do_find_id" method="post" id="find_form">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required placeholder="이름을 입력해주세요" data-error="이름을 입력해주세요.">
	    <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" required placeholder="전화번호를 입력해주세요" data-error="전화번호를 입력해주세요.">
 
        <button type="submit">아이디 찾기</button>
    </form>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
