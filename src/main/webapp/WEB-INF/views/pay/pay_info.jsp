<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/pay.css"> <!-- CSS 링크를 헤더 아래로 이동 -->
<script src="/resources/js/pay_charge.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Potato Pay</title>
</head>
<body>
<div id="profile-container">
    <div class="profile_photo">
        <img id="img_thumb" src="${pageContext.request.contextPath}/resources/upload/${sessionScope.profile_image}" alt="" width="100px" height="100px">
        <span class="mask"></span>
    </div>
    <div id="article-profile-left">
        <span>${sessionScope.nickName}님의 감자페이입니다.</span>
        <span style="color: #aaa;">${sessionScope.id}</span> <!-- 흐릿한 글씨로 표시 -->
    </div>
</div>

<div id="info">
    <div class="info-section">
        <h2>감자 머니 (Pay)</h2>
        <p>보유 금액 : ${pay} 원</p>
        <a class="button" href="/pay/pay_charge">충전하기</a>
    </div>
    <div class="info-section">
        <h2>포인트 (Point)</h2>
        <p>전환 가능한 포인트 : ${point} 점</p>
        <a class="button" href="#" onclick="convertPoints(${point})">페이로 전환하기</a>
    </div>
</div>

<div class="footer">
    <p>감자페이를 이용해 주셔서 감사합니다!</p>
</div>
    
    <%@ include file="../common/footer.jsp"%>
</body>
</html>