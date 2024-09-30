<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/chat_list.css"> <!-- CSS 링크를 헤더 아래로 이동 -->
<div id="chat-list">
<title>채팅 목록</title>
  <h2>나의 채팅목록</h2>
  <ul>
    <c:forEach var="member" items="${memberVO}">
      <li>
        <div class="chat-item">
          <div class="profile-image">
            <img src="${pageContext.request.contextPath}/resources/upload/${member.profile_image}" alt="프로필 사진">
          </div>
          <div class="chat-info">
            <div class="nickname">${member.nickName}</div>
            <div class="id">
              <a href="/potato/mylist?number=${member.member_number}&id=${member.id}">${member.id}</a>
            </div>
          </div>
          <div class="chat-actions">
            <a href="/potato/chat?reciever=${member.member_number}&board_number=${member.board_number}" class="chat-button">채팅하기</a>
            <a href="/shop/get?board_number=${member.board_number}" class="view-post-button">게시글보기</a>
          </div>
        </div>
      </li>
    </c:forEach>
  </ul>
</div>
<%@ include file="../common/footer.jsp"%>