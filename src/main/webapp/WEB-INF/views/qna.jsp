<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ include file="./common/header.jsp"%>
<link href="/resources/css/qna.css" rel="stylesheet" />
<title>Q&A</title>
<div class="qna-container">
    <h1>자주 묻는 질문</h1>
    <div id="qna-list">
        <c:forEach var="qnaVO" items="${qna}">
            <div class="qna-item">
                <div class="question">
                    <span>Q:</span> <c:out value="${qnaVO.question}"/>
                </div>
                <div class="answer">
                    <span>A:</span> <c:out value="${qnaVO.answer}"/>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="/resources/js/qna.js"></script>
<%@ include file="./common/footer.jsp"%>