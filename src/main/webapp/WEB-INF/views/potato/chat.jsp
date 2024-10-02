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
    <c:when test="${chatVO.buyer_number == sessionScope.member_number && chatVO.status == 0}">
        <input type="hidden" id="set_status" value="1" />
        <button id="buyBtn" type="button" class="btn btn-danger">예약신청</button>
    </c:when>
    <c:when test="${chatVO.buyer_number == sessionScope.member_number && chatVO.status == 1}">
        <a>예약 신청완료</a>
    </c:when>
    <c:when test="${chatVO.buyer_number == sessionScope.member_number && chatVO.status == 2}">
        <button id="buyBtn2" type="button" class="btn btn-danger" onclick="showPaymentOptions()">구매 확정</button>
        <input type="hidden" id="set_status" value="3" />
    </c:when>
    <c:when test="${chatVO.buyer_number == sessionScope.member_number && chatVO.status == 3}">
        <a>구매완료</a>
    </c:when>
    <c:when test="${chatVO.buyer_number == sessionScope.member_number && chatVO.status == 4}">
        <a>구매완료</a>
        <a href="#" onclick="openMannerModal()" style="background-color: #4CAF50; color: white; padding: 10px 15px; text-decoration: none; border-radius: 5px;">
            칭찬합시다(1,000p 적립)
        </a>
    </c:when>
    <c:when test="${chatVO.buyer_number == sessionScope.member_number && chatVO.status == 5}">
        <a>거래 및 칭찬이 모두 완료되었습니다</a>
    </c:when>
    <c:when test="${chatVO.celler_number == sessionScope.member_number && chatVO.status == 0}">
        <a>예약 신청 대기 중</a>
    </c:when>
    <c:when test="${chatVO.celler_number == sessionScope.member_number && chatVO.status == 1}">
        <button id="cellBtn" type="button" class="btn btn-danger">판매 예약</button>
        <input type="hidden" id="set_status" value="2" />
    </c:when>
    <c:when test="${chatVO.celler_number == sessionScope.member_number && chatVO.status == 2}">
        <a>판매 예약 완료</a>
    </c:when>
    <c:when test="${chatVO.celler_number == sessionScope.member_number && chatVO.status == 3}">
        <button id="cellBtn2" type="button" class="btn btn-danger">판매 확정</button>
        <input type="hidden" id="set_status" value="4" />
    </c:when>
    <c:when test="${chatVO.celler_number == sessionScope.member_number && chatVO.status == 4}">
        <a>판매 완료됨</a>
    </c:when>
    <c:when test="${chatVO.celler_number == sessionScope.member_number && chatVO.status == 5}">
        <a>거래 및 칭찬이 모두 완료되었습니다</a>
    </c:when>
</c:choose>
</form>
	  </div>
	  
<div id="mannerModal" style="display:none; position: absolute; right: 150px; top: 120px; background-color: white; border: 1px solid #ccc; padding: 20px; z-index: 1000;">
    <h2>매너 설문</h2>
    <form id="mannerSurvey">
        <div>
            <label>
                <input type="radio" name="rating" value="5"> 5점. 매우 만족한 거래였습니다.
            </label><br>
            <label>
                <input type="radio" name="rating" value="4"> 4점. 매너가 좋네요.
            </label><br>
            <label>
                <input type="radio" name="rating" value="3"> 3점. 잘 쓰겠습니다.
            </label><br>
            <label>
                <input type="radio" name="rating" value="2"> 2점. 약간 아쉬운 부분이 있었어요.
            </label><br>
            <label>
                <input type="radio" name="rating" value="1"> 1점. 최악이네요.
            </label><br>
        </div>
        <button id="finishBtn" type="button" data-value="5">제출</button>
    </form>
    
    
    <button onclick="closeMannerModal()">닫기</button>
</div>
	  
<script>
var chatStatus = ${chatVO.status}; // chatVO.status 값을 가져옴
console.log("현재 채팅 상태:", chatStatus); // 콘솔에 상태 출력

</script>
<%@ include file="../common/footer.jsp"%>
