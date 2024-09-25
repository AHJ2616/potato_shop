<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap.css" />
<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/header.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/board.css">

<!-- responsive style -->
<link href="/resources/css/responsive.css" rel="stylesheet" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Popper.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.png"
	type="image/x-icon">


<style>
.modal-dialog {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: calc(100% - 1rem);
}
</style>
<!-- slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="/resources/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="/resources/css/responsive.css" rel="stylesheet" />
</head>

<body>
	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<nav class="navbar navbar-expand-lg custom_nav-container ">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/home"> <span>
						🥔 감자마켓 </span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class=""></span>
				</button>

				<div class="collapse navbar-collapse innerpage_navbar"
					id="navbarSupportedContent">
					<ul class="navbar-nav  ">
						<li class="nav-item "><a class="nav-link" href="/home">홈
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="/shop/list"> 중고거래 </a></li>
					</ul>
					<div class="user_option">
						<c:choose>
							<c:when test="${empty sessionScope.id}">
								<a href="#login" data-toggle="modal" data-target="#loginModal">
									<i class="fa fa-user" aria-hidden="true"></i> <span>로그인/회원가입</span>
								</a>
							</c:when>
							<c:otherwise>
								<a
									href="/potato/mypage?member_number=<c:out value='${sessionScope.member_number}'/>">
									<i class="fa fa-user" aria-hidden="true"></i> <span>${sessionScope.nickName}</span>
								</a>
								<a href="#" id="alarm_button"><svg xmlns="http://www.w3.org/2000/svg" width="16"
										height="16" fill="currentColor" class="bi bi-bell"
										viewBox="0 0 16 16">
  								<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6" />
								</svg> 알림</a>
								<div id="alarm_list" class="alarm_list" >
									<div class="alarm_header">
									  <strong>나의 알림</strong>
									  	<div class="option">
									  	<input type="hidden" id="session_number" value="${sessionScope.member_number}"/>
									  	<a role="button" href="#" id="del_all" class="del_all" aria-pressed="false">전체삭제</a>
									<div class="alarm_container">
									<ul>
									<c:forEach var="alarm" items="${sessionScope.alarms}">
										<li>
										<a href="/alarm/func" id="alarm_func">
										<input type="hidden" id="a_number" value="${alarm.alarm_number}"/>
										<input type="hidden" id="a_member_number" value="${alarm.member_number}"/>
										<input type="hidden" id="a_target_type" value="${alarm.target_type}"/>
										<input type="hidden" id="a_target_key" value="${alarm.target_key}"/>
										<input type="hidden" id="a_status" value="${alarm.status}"/>
										<c:out value="${alarm.contents}"/>
										</a>
										<a href="/alarm/delete" id="alarm_del" role="button" class="bt_item _del" aria-pressed="false">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
</svg></a>
										</li> 
									</c:forEach>
										<li><a href="#" id="hide">닫기</a></li>
									</ul>
									</div>
									</div>
									</div>
								</div>
								<input type="hidden" id="session_number" value="${sessionScope.member_number}" />
								<a href="#" id="logoutLink"> <i class="fa fa-sign-out"
									aria-hidden="true"></i> <span>로그아웃</span>
								</a>
								<a href="/potato/chat_list"><span>채팅목록</span> </a>
								<a href="/potato/likes_list"><span>관심목록</span> </a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</nav>
			<!-- 로그인 모달 -->
			<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
				aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="loginModalLabel">로그인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="loginForm">
								<div class="form-group">
									<label for="loginId">아이디</label> <input type="text"
										class="form-control" id="loginId" name="loginId" required>
								</div>
								<div class="form-group">
									<label for="loginPass">비밀번호</label> <input type="password"
										class="form-control" id="loginPass" name="loginPass" required>
								</div>
								<button type="submit" class="btn btn-primary">로그인</button>
								&nbsp;
								<button type="button" class="btn btn-primary"
									onclick="location.href='${pageContext.request.contextPath}/potato/register'">회원가입</button>
							</form>
							<div class="find-container">
								<a href="/potato/find_id">아이디 찾기</a> | <a
									href="/potato/find_pass">비밀번호 찾기</a>
							</div>
						</div>
					</div>
				</div>
			</div>


		</header>
		<!-- end header section -->

	</div>
	<!-- end hero area -->
	
	<!-- header.js참조 -->
	<script src="/resources/js/header.js"></script>