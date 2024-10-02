<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/admin_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>관리자게시판 - 상세보기</title>
    <link rel="stylesheet" href="/resources/css/notiview.css">
</head>
<body>
      
        <div class="container">
            <h1>관리자 공지</h1> <a href="../admin/notiWrite?member_number=${sessionScope.member_number}">새 공지사항</a>
        <table class="member-table">
        
            <thead>
            
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- 중요 공지 출력 -->
                <c:forEach var="memberVO" items="${notice}" varStatus="status">
                    <c:if test="${memberVO.important == 1}">
                        <tr>
                            <td><span class="important">[중요]</span></td>
                            <td>
                                <a href="../admin/notice?notice_number=${memberVO.notice_number}">
                                    <c:out value="${memberVO.title}"/>
                                </a>
                            </td>
                            <td><c:out value="${memberVO.writer}"/></td>
                            <td><fmt:formatDate value="${memberVO.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
                        </tr>
                    </c:if>
                </c:forEach>

                <!-- 일반 공지 출력 -->
                <c:forEach var="memberVO" items="${notice}" varStatus="status">
                 <c:if test="${memberVO.important != 1}"> 
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>
                               <a href="../admin/notice?notice_number=${memberVO.notice_number}">
                                    <c:out value="${memberVO.title}"/>
                                </a>
                            </td>
                            <td><c:out value="${memberVO.writer}"/></td>
                            <td><fmt:formatDate value="${memberVO.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
                        </tr>
                        </c:if>
                </c:forEach>
            </tbody>
        </table>     
   </div>
</body>
</html>