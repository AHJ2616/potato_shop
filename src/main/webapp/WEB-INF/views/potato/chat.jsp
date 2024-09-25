<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/chat.css">
<script src="/resources/js/chat.js"></script>

<div id="chat-box">
<span> <c:out value="${memberVO.nickName}" />님과의 대화</span> 
<input type="hidden" id="buyer_number" value="${chatVO.buyer_number}" />
<input type="hidden" id="celler_number" value="${chatVO.celler_number}" />
<input type="hidden" id="board_number" value="${chatVO.board_number}" />
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
    <form method="post" action="/potato/report">
<input type="hidden" name="defendant_id" value="${memberVO.id}"/>
<input type="hidden" name="defendant" value="${memberVO.member_number}"/>
<button id="reportBtn" type="submit" class="btn btn-danger">신고하기</button>
<c:choose>
    <c:when test="${chatVO.buyer_number==sessionScope.member_number && chatVO.status==0}">
    <input type="hidden" id="set_status" value="1" />
    	<button id="buyBtn" type="button" class="btn btn-danger">예약신청</button>
    </c:when>
    <c:when test="${chatVO.buyer_number==sessionScope.member_number && (chatVO.status==1||chatVO.status==2)}">
    	<a>예약 신청완료</a>
    </c:when>
    <c:when test="${chatVO.buyer_number==sessionScope.member_number && chatVO.status==3}">
    	<button id="buyBtn2" type="button" class="btn btn-danger">구매 확정</button>
    	<input type="hidden" id="set_status" value="4" />
    </c:when>
    <c:when test="${chatVO.buyer_number==sessionScope.member_number && chatVO.status==4}">
    	<a>구매 완료됨</a>
    </c:when>
    <c:when test="${chatVO.celler_number==sessionScope.member_number && (chatVO.status==0||chatVO.status==1)}">
    	<button id="cellBtn" type="button" class="btn btn-danger">판매 예약</button>
    	<input type="hidden" id="set_status" value="2" />
    </c:when>
    <c:when test="${chatVO.celler_number==sessionScope.member_number && chatVO.status==2}">
    	<button id="cellBtn2" type="button" class="btn btn-danger">판매 확정</button>
    	<input type="hidden" id="set_status" value="3" />
    </c:when>
    <c:when test="${chatVO.celler_number==sessionScope.member_number && (chatVO.status==3||chatVO.status==4)}">
    	<a>판매 완료됨</a>
    </c:when>
</c:choose>
</form>
	  </div>
<%@ include file="../common/footer.jsp"%>
