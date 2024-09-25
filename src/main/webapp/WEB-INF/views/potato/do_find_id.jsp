<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<div class="login-container">
	<div class="login-container2">
	<c:choose>
    <c:when test="${result == ''|| result==null}">
        <span>결과가 존재하지 않습니다</span>
        <br><a href="/potato/find_id">다시하기</a> | <a href="/potato/find_pass">비밀번호 찾기</a>
    </c:when>
    <c:otherwise>
        <span>당신의 아이디는 <span style="color: green; font-size: 20px;">
        <c:out value="${result.id}">
        </c:out> </span>
         입니다.</span>
         <br><a href="/potato/login">로그인</a> | <a href="/potato/find_pass">비밀번호 찾기</a>
    </c:otherwise>
</c:choose>
    	
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
