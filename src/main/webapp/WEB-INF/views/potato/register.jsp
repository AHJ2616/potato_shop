<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<script src="/resources/js/register.js"></script>
<link rel="stylesheet" href="/resources/css/register.css">


<div class="register-container">
<h2>회원가입</h2>
<form id="registerForm" action="/potato/register" method="post" >
    <div class="form-group">
        <label for="id">아이디</label>
        <input type="text" class="form-control" id="id" name="id" required data-error="아이디를 입력해주세요.">
        <button type="button" class="btn btn-secondary" id="idCheckBtn">중복확인</button>
        <span id="result"></span>
        <div id="alert-id" class="custom-alert"></div>
    </div>
    <div class="form-group">
        <label for="pass">비밀번호</label>
        <input type="password" class="form-control" id="pass" name="pass" required data-error="비밀번호를 입력해주세요.">
        <div id="alert-pass" class="custom-alert"></div>
    </div>
    <div class="form-group">
        <label for="name">이름</label>
        <input type="text" class="form-control" id="name" name="name" required data-error="이름을 입력해주세요.">
        <div id="alert-name" class="custom-alert"></div>
    </div>
    <div class="form-group">
        <label for="nickName">닉네임</label>
        <input type="text" class="form-control" id="nickName" name="nickName" required data-error="닉네임을 입력해주세요.">
        <div id="alert-nickName" class="custom-alert"></div>
    </div>
    <div class="form-group">
        <label for="phone">전화번호</label>
        <input type="tel" id="phone" name="phone" required
       placeholder="숫자 11자리 입력" 
       data-error="전화번호를 입력해주세요."
       title="전화번호는 11자리 숫자만 입력할 수 있습니다.">
    </div>
      <div id="alert-phone" class="custom-alert" style="display:inline-block;"></div>
    <div class="form-group">
        <label for="address">주소</label>
        <input type="text" class="form-control" id="address" name="address" required data-error="주소를 입력해주세요.">
        <div id="alert-address" class="custom-alert"></div>
    </div>
    <button type="submit" class="btn btn-primary">가입하기</button>
</form>
<div id="customAlert" class="custom-alert" style="display:none;"></div>
</div>

<!-- 기존 JavaScript 코드 유지 -->


<%@ include file="../common/footer.jsp" %>