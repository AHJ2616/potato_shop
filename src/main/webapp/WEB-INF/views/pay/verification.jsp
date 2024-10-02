<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/pay.css">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인증번호 입력</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        button {
            margin-top: 10px;
        }
        .info-message {
            color: #555;
            margin-top: 10px; /* 위쪽 간격 */
        	margin-bottom: 20px; /* 아래쪽 간격 추가 */
        }
    </style>
</head>
<body>
    <h2>인증번호 입력</h2>
    <form id="verificationForm">
        <div class="info-message">
            고객님의 개인정보에 등록된 연락처로 인증번호를 발송했습니다.
        </div>
        <div class="form-group">
            <label for="verificationCode">인증번호:</label>
            <input type="text" id="verificationCode" name="verificationCode" required placeholder="인증번호를 입력하세요.">
        </div>
        
        <button type="button" onclick="submitVerification()">확인</button>
        <button type="button" onclick="window.close()">취소</button>
    </form>
    <script src="/resources/js/pay_charge.js"></script>
</body>
</html>
