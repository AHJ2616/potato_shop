<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- header.js참조 -->
    <script src="/resources/js/header.js"></script>
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
<link rel="shortcut icon" href=".../resources/images/favicon.png"
	type="image/x-icon">

<title>감자마켓</title>
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
				<a class="navbar-brand" href="../home"> <span> 🥔 감자 </span>
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
						<li class="nav-item "><a class="nav-link" href="../home">홈
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="../shop/list"> 중고거래 </a></li>
						<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
								Us</a></li>
					</ul>
					<div class="user_option">
						<c:choose>
							<c:when test="${empty sessionScope.id}">
								<a href="#login" data-toggle="modal" data-target="#loginModal">
									<i class="fa fa-user" aria-hidden="true"></i> <span>로그인</span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="/potato/mypage"> <i class="fa fa-user"
									aria-hidden="true"></i> <span>${sessionScope.nickName}</span>
								</a>
								<a href="#" id="logoutLink"> 
   								 <i class="fa fa-sign-out" aria-hidden="true"></i> 
   								 <span>로그아웃</span>
								</a>
							</c:otherwise>
						</c:choose>
						<form class="form-inline ">
							<button class="btn nav_search-btn" type="submit">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</form>
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
								<button type="submit" class="btn btn-primary">로그인</button> &nbsp;
								<button type="button" class="btn btn-primary" onclick="location.href='/potato/register'">회원가입</button>
							</form>
						</div>
					</div>
				</div>
			</div>

		
		</header>
		<!-- end header section -->

	</div>
	<!-- end hero area -->