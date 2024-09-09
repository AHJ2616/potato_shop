<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<div class="mypage-container">
    <h2>마이페이지</h2>
    <div class="user-info">
        <p><strong>회원번호:</strong> ${userVO.member_number}</p>
        <p><strong>아이디:</strong> ${userVO.id}</p>
        <p><strong>이름:</strong> ${userVO.name}</p>
        <p><strong>닉네임:</strong> ${userVO.nickName}</p>
        <p><strong>전화번호:</strong> ${userVO.phone}</p>
        <p><strong>주소:</strong> ${userVO.address}</p>
        <p><strong>가입일:</strong> ${userVO.regidate}</p>
        <p><strong>정보 수정일:</strong> ${userVO.update_date}</p>
    </div>
    <a href="/potato/modify_mypage" class="btn btn-primary">정보 수정</a>
</div>

<%@ include file="../common/footer.jsp" %>