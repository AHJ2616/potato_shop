<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/chat.css">
<div id="chat-box">
        <div class="chat-body">
    <div class="chat-messages">
      <div class="message-left">
        <!-- Messages from the other user will be displayed here -->
      </div>
      <div class="message-right">
        <!-- Messages from the current user will be displayed here -->
      </div>
    </div>
    <input type="text" id="message-input" name="content" placeholder="메세지를 입력해주세요">
    <input type="text" hidden="hidden" name="sender" id="sender" value="${sessionScope.member_number}" />
     <input type="text" hidden="hidden" name="chat_number" id="chat_number" value="${chatVO.chat_number}" />
    <button id="send-button">전송</button>
	 </div>
	  </div>
<%@ include file="../common/footer.jsp"%>