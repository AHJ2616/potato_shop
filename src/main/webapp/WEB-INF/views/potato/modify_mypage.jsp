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
    </form>
    </div>

<%@ include file="../common/footer.jsp" %>