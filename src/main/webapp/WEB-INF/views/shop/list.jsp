<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<script src="/resources/js/board_list.js"></script>
  <!-- shop section -->

  
<section class="shop_section layout_padding">
	<div class="container">
		<div class="heading_container heading_center">
		<c:choose>
			<c:when test="${empty sessionScope.id}">
				<h2>🥔 인기매물</h2>
			</c:when>
			<c:otherwise>
				<h2>🥔 인기매물</h2>
				<button id="regBtn2" type="button" class="btn btn-outline-warning">내 물건 등록</button>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div class="row">
		<c:forEach items="${ list }" var="boardlist">
			<div class="col-sm-6 col-md-4 col-lg-3">
				<div class="box">
					<a href="/shop/get?board_number=<c:out value="${boardlist.board_number}"/>">
						<div class="img-box">
							<img src="${pageContext.request.contextPath}/resources/images/${boardlist.photo_name}" alt="">
						</div>
						<div class="detail-box" align="center">
							<h6>
								<c:out value="${ boardlist.title}" />
							</h6>
						</div>
						<div class="card_preice">
							<span><c:out value="${ boardlist.price}" />&nbsp;원</span>
						</div>
						<div class="card_adress">
							<c:out value="${boardlist.board_address}" />	
						</div>
						<div class="card_status">
							<c:out value="${ boardlist.status}" />
						</div>
						<div class="card_count">
							<span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16" style="margin-right: 10px;">
				  				  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
								  </svg><c:out value="${ boardlist.likes}" /></span>
							<span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16" style="margin-right: 10px;">
								  <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9z"/>
								  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zm3.915 10L3.102 4h10.796l-1.313 7zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
								  </svg><c:out value="${ boardlist.interest}" /></span>
							<span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16" style="margin-right: 10px;">
						  		  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
						  		  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
								  </svg><c:out value="${ boardlist.views}" /></span>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
</section>
<%@ include file="../common/footer.jsp" %>