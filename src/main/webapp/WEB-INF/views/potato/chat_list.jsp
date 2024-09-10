<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/chat_list.css">
<div id="chat-list">
  <h2>나의 채팅목록</h2>
  <ul>
    <c:forEach var="chatRoom" items="${model.chat_roomVO}">
      <li>
        <div class="chat-room-info">
          <img src="${pageContext.request.contextPath}/resources/images/${memberVO.profile_image}" alt="">
          <span>${memberVO.nickName}</span>
          <span>${memberVO.id}</span>
          <a href="/potato/chat?reciever='${memberVO.member_number}'">채팅하기</a>
        </div>
      </li>
    </c:forEach>
  </ul>
</div>
<%@ include file="../common/footer.jsp"%>