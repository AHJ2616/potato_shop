<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<script src="/resources/js/chat.js"></script>
<link rel="stylesheet" href="/resources/css/chat.css">

<div id="chat-box">
<h2> ${memberVO.nickName}님과의 대화</h2>
        <div class="chat-body" data-scroll-context="ChatScroller">
    <div class="chat-messages">
      <div class="message-left">
        <!-- Messages from the other user will be displayed here -->
      </div>
      <div class="message-right">
        <!-- Messages from the current user will be displayed here -->
      </div>
    </div>
     </div>
     <div class="input_wrap">
    <textarea class="input"  id="content" name="content" placeholder="메세지를 작성해주세요" ></textarea>
    <input type="text" hidden="hidden" name="sender" id="sender" value="${sessionScope.member_number}" />
     <input type="text" hidden="hidden" name="chat_number" id="chat_number" value="${chatVO.chat_number}" />
    <button class="send-button" id="send-button">보내기</button>
    </div>
	  </div>
<%@ include file="../common/footer.jsp"%>