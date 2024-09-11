<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<link rel="stylesheet" href="/resources/css/chat_list.css"> <!-- CSS 링크를 헤더 아래로 이동 -->
<div id="chat-list">
  <h2>나의 채팅목록</h2>
  <table>
    <tr>
      <th>프로필 사진</th> <!-- <td>를 <th>로 변경 -->
      <th>닉네임</th>
      <th>아이디</th>
      <th>채팅</th>
    </tr>
    <c:forEach var="member" items="${memberVO}">
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/images/${member.profile_image}" alt=""></td>
        <td>${member.nickName}</td>
        <td>${member.id}</td>
        <td><a href="/potato/chat?reciever=${member.member_number}">채팅하기</a></td>
      </tr>
    </c:forEach>
  </table>
</div>
<%@ include file="../common/footer.jsp"%>