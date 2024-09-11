<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<script src="/resources/js/modify_mypage.js"></script>
<link rel="stylesheet" href="/resources/css/modify_mypage.css">
    <div class="member-info">
    <form id="memberForm" method="post" action="/potato/modify_mypage">
        <table class="member-table">
            <tr>
                <td>
                    <strong>아이디</strong>
                </td>
                <td>
                    <input type="text" name="id" id="id"  value="${sessionScope.id}" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>비밀번호</strong>
                </td>
                <td>
                <div class="form-group">
                    <input type="password" id="pass" name="pass" value="${memberVO.pass}" required data-error="비밀번호를 입력해주세요.">
                    <div id="alert-pass" class="custom-alert"></div>
                </div>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>이름</strong>
                </td>
                <td>
                    <input type="text" id="name" name="name" value="${sessionScope.name}" readonly>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>닉네임</strong>
                </td>
                <td>
                <div class="form-group">
                    <input type="text" id="nickName" name="nickName" value="${sessionScope.nickName}" required data-error="닉네임을 입력해주세요.">
                    <div id="alert-nickName" class="custom-alert"></div>
               </div>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>전화번호</strong>
                </td>
                <td>
                	<div class="form-group">
                    <input type="tel" id="phone" name="phone" value="${memberVO.phone}" required
                    placeholder="숫자 11자리 입력" 
       data-error="전화번호를 입력해주세요."
       title="전화번호는 11자리 숫자만 입력할 수 있습니다.">
                    <div id="alert-phone" class="custom-alert" style="display:inline-block;"></div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>주소</strong>
                </td>
                <td>
                   <div class="form-group">
                    <input type="text" id="address" name="address" value="${memberVO.address}" required data-error="주소를 입력해주세요.">
                    <div id="alert-address" class="custom-alert"></div>
                   </div>
                </td>
            </tr>
        </table>
        <input hidden="hidden"  name="member_number" value="${sessionScope.member_number}" />
        <button>제출하기</button>
        <button type="button" class="btn btn-danger" id="delete" class="delete">탈퇴하기</button>
    </form>
    </div>
<div id="passwordModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.5); z-index:1000;">
    <div style="background:white; margin:15% auto; padding:20px; width:300px; border-radius:5px;">
        <form id="passwordForm">
            <label for="password">고객확인을 위해 비밀번호를 입력해 주세요</label>
            <input type="password" id="pass" name="pass" required>
            <input type="password" id="id" name="id" hidden="hidden" value="${sessionScope.id}">
            <button type="submit">확인</button>
            <button type="button" id="closeModal">취소</button>
        </form>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>