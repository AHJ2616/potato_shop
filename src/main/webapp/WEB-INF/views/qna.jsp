<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ include file="./common/header.jsp"%>
<link href="/resources/css/qna.css" rel="stylesheet" />
<title>Q&A</title>
  <div class="qna-container">
        <h1>자주 묻는 질문</h1>
        <div id="qna-list">
            <!-- QnA 항목들은 JavaScript로 동적으로 추가됩니다 -->
        </div>
    </div>
<script src="/resources/js/qna.js"></script>
<%@ include file="./common/footer.jsp"%>