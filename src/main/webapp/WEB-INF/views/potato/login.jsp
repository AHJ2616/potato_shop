<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="../common/header.jsp"%>
<script src="/resources/js/find_id.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<div class="login-container">
	<div class="login-container2">
    <form action="/potato/login" method="post" id="find_form">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required placeholder="아이디를 입력해주세요" data-error="아이디를 입력해주세요.">
	    <label for="pass">비밀번호:</label>
        <input type="password" id="pass" name="pass" required placeholder="비밀번호를 입력해주세요" data-error="비밀번호를 입력해주세요.">
 
        <button type="submit">로그인</button>
        <a href="/potato/find_id">아이디 찾기</a> | <a href="/potato/find_pass">비밀번호 찾기</a>
        | <a href="/potato/register">회원가입</a>
    </form>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
