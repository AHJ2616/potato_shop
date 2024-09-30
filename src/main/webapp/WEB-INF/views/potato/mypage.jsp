<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<title>마이 페이지</title>
<link rel="stylesheet" href="/resources/css/mypage.css">
<div class="mypage-container">
	<div class="profile-image-container">
	
		<div class="profile_image">
		<div class="profile_photo">
			<img id="img_thumb" src="${pageContext.request.contextPath}/resources/upload/${sessionScope.profile_image}" alt="" width="100" height="100">
			<span class="mask"></span>
		</div>
			<form id="profileImageForm" enctype="multipart/form-data">
				<input type="file" id="profile_file" name="file" accept="image/*">
				<input type="hidden" id="member_number" name="member_number" value="${sessionScope.member_number}">
				<button type="submit">프로필 사진 변경</button>
			</form>
		</div>
		
		<div class="mypage-member">
		<a href="/potato/mylist?number=${sessionScope.member_number}&id=${sessionScope.id}" >나의 활동내역 확인하기</a>
			<h2>마이페이지</h2>
			<div class="member-info">
				<table class="member-table">
					<tr>
						<td>
							<strong>아이디</strong>
						</td>
						<td>
							${sessionScope.id}
						</td>
					</tr>
					<tr>
						<td>
							<strong>이름</strong>
						</td>
						<td>
							${sessionScope.name}
						</td>
					</tr>
					<tr>
						<td>
							<strong>닉네임</strong>
						</td>
						<td>
							${sessionScope.nickName}
						</td>
					</tr>
					<tr>
						<td>
							<strong>전화번호</strong>
						</td>
						<td>
							${memberVO.phone}
						</td>
					</tr>
					<tr>
						<td>
							<strong>주소</strong>
						</td>
						<td>
							${memberVO.address}
						</td>
					</tr>
				</table>
			</div>
			<a href="#" id="modifyLink">정보 수정</a>
			<div class="user-info">
				<table class="user-table">
					<tr>
						<td>
							<strong>신고당한 수</strong>
						</td>
						<td>
							${userVO.reports}
						</td>
					</tr>
					<tr>
						<td>
							<strong>온도</strong>
						</td>
						<td>
							${userVO.temper}
						</td>
					</tr>
					<tr>
						<td>
							<strong>나의 거래 수</strong>
						</td>
						<td>
							${userVO.trades}
						</td>
					</tr>
				</table>
			</div>
		</div>
	
	</div>
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

<script src="/resources/js/mypage.js"></script>
<%@ include file="../common/footer.jsp" %>