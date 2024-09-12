<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../common/header.jsp" %> 
  <link rel="stylesheet" href="/resources/css/memberList.css">
  <div class="dashboard">
        <header class="dashboard-header">
            <h1 class="dashboard-title">회원관리</h1>
        </header>

        <div class="container">
            <h1>회원 상세 정보</h1>
            <form action="/updateMember" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberId">회원 ID</label>
                        <input type="text" id="memberId" name="memberId" class="form-control" value="${member.id}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberName">회원 이름</label>
                        <input type="text" id="memberName" name="memberName" class="form-control" value="${member.name}" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberNickName">닉네임</label>
                        <input type="text" id="memberNickName" name="memberNickName" class="form-control" value="${member.nickName}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberPhone">전화번호</label>
                        <input type="text" id="memberPhone" name="memberPhone" class="form-control" value="${member.phone}" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberAddress">주소</label>
                        <input type="text" id="memberAddress" name="memberAddress" class="form-control" value="${member.address}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberRegidate">회원가입일</label>
                         <input type="text" id="memberRegidate" name="memberRegidate" class="form-control"
           value="<fmt:formatDate value='${member.regidate}' pattern='yyyy-MM-dd' />" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberUpdate">회원수정일</label>
                         <input type="text" id="memberUpdate" name="memberUpdate" class="form-control"
           value="<fmt:formatDate value='${member.update_date}' pattern='yyyy-MM-dd' />" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberStatus">회원등급</label>
                        <select id="memberStatus" name="memberStatus" class="form-control">
                            <option value="4" ${member.grade == 4 ? 'selected' : ''}>블랙리스트</option>
                            <option value="0" ${member.grade == 0 ? 'selected' : ''}>일반회원</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn" id="modifyBtn">수정</button>
                    <button type="button" class="btn" onclick="window.history.back();">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
  
  <%@ include file="../common/footer.jsp" %>