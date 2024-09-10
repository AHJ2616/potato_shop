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
	 
<br><br>
<h1 align="center">판매자의 정보</h1>
<div class='row'>
   <div class="col-lg-12">
      <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> 댓글 목록
                <button id='addReplyBtn' class='btn-primary btn-xs pull-right'>댓글 달기</button>
            </div>
            <div class="panel-body">
               <ul class="chat"></ul>
            </div>
            <div class="panel-footer"></div>
      </div>
   </div>
</div>

<!-- Modal -->
<div class="modal fade2" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">후기를 남겨주세요</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                   <label>후기</label>
                   <input class="form-control" name='content' placeholder="댓글은 최대 1000자까지 입력가능합니다.">
                </div>
                <div class="form-group">
                   <label>작성자</label>
                   <input class="form-control" name='writer'>
                </div>
                <div class="form-group">
                   <label>작성일</label>
                   <input class="form-control" name='regidate' readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function(){
   var idValue = 'kwh';
   var replyUL = $(".chat");
   
   showList(1);
   
   function showList(page){
      replyService.getList({id:idValue, page:page||1}, function(replyCnt, list){
         if(page == -1){
            pageNum = Math.ceil(replyCnt/10.0);
            showList(pageNum);
            return;
         } 
         
         var str = "";
         if(list == null || list.length == 0){
            return;
         }
         for (var i = 0, len = list.length || 0; i < len; i++){
            str +="<li class='left clearfix' data-reply_number='"+list[i].reply_number+"'>";
            str +="   <div><div class='header'><strong class='primary-font'>"+list[i].writer+"</strong>";
            str +="      <small class='pull-right text-muted'>"+replyService.displayTime(list[i].regidate)+"</small></div>";
            str +="      <p>"+list[i].content+"</p></div></li>";
         }
         replyUL.html(str);
         showReplyPage(replyCnt);
      });
   }
   
   var pageNum = 1;
   var replyPageFooter = $(".panel-footer");
   
   function showReplyPage(replyCnt){
      var endNum = Math.ceil(pageNum / 10.0) * 10;
      var startNum = endNum - 9;
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
         endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
         next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      if(prev){
         str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
         var active = pageNum == i? "active":"";
         str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
         str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul>";
      replyPageFooter.html(str);
   }
   
   replyPageFooter.on("click", "li a", function(e){
      e.preventDefault();
      var targetPageNum = $(this).attr("href");
      pageNum = targetPageNum;
      showList(pageNum);
   });
   
 
   var modalInputContent = modal.find("input[name='content']");
   var modalInputWriter = modal.find("input[name='writer']");
   var modalInputRegidate = modal.find("input[name='regidate']");
   
   $("#addReplyBtn").on("click", function(e){
      modal.find("input").val("");
      modalInputRegidate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      modalRegisterBtn.show();
      $(".modal.fade2").modal("show"); // fade2 클래스만 가진 모달 실행
   });
   
   modalRegisterBtn.on("click",function(e){
      var reply = {
         content : modalInputContent.val(),
         writer : modalInputWriter.val(),
         id : idValue
      };
      replyService.add(reply, function(result){
         alert(result);
         modal.find("input").val("");
         modal.modal("hide");
         showList(1);
      });
   });
   
   $(".chat").on("click", "li", function(e){
      var reply_number = $(this).data("reply_number");
      replyService.get(reply_number, function(reply){ 
         modalInputContent.val(reply.content);
         modalInputWriter.val(reply.writer);
         modalInputRegidate.val(replyService.displayTime(reply.regidate)).attr("readonly", "readonly");
         modal.data("reply_number", reply.reply_number);
         modal.find("button[id != 'modalCloseBtn']").hide();
         modalModBtn.show();
         modalRemoveBtn.show();
         $(".modal").modal("show");
      });
   });
   
   modalModBtn.on("click", function(e){
      var reply = {reply_number:modal.data("reply_number"), content:modalInputContent.val()};
      replyService.update(reply, function(result){
         alert(result);
         modal.modal("hide");
         showList(pageNum);
      });
   });
   
   modalRemoveBtn.on("click", function(e){
      var reply_number = modal.data("reply_number");
      replyService.remove(reply_number, function(result){
         alert(result);
         modal.modal("hide");
         showList(pageNum);
      });
   });
});
</script>