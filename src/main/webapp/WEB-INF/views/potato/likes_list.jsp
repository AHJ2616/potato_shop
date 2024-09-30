<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>좋아요 & 관심</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="/resources/css/chat_list.css" rel="stylesheet" />
<%@ include file="../common/header.jsp"%>
<br>
<br>
<div class="lists-container">
	<div id="likes-list" class="list-column">
		<h2>좋아요 리스트</h2>
		<ul>
			<c:forEach var="likes_list" items="${result}">
				<c:if test="${likes_list.likes == 1}">
					<li>
						<div class="list-item">
							<div class="profile-image">
								<img src="${pageContext.request.contextPath}/resources/upload/${likes_list.profile_image}" alt="프로필 사진">
							</div>
							<div class="item-info">
								<div class="nickname">${likes_list.nickName}</div>
								<div class="id">
									<a href="/potato/mylist?number=${likes_list.likes_member_number}&id=${likes_list.id}">${likes_list.id}</a>
								</div>
							</div>
							<div class="item-actions">
								<a href="/shop/get?board_number=${likes_list.board_number}"><c:out value='${likes_list.title}'/></a>
							</div>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>

	<div id="interest-list" class="list-column">
		<h2>관심 리스트</h2>
		<ul>
			<c:forEach var="likes_list" items="${result}">
				<c:if test="${likes_list.interest == 1}">
					<li>
						<div class="list-item">
							<div class="profile-image">
								<img src="${pageContext.request.contextPath}/resources/upload/${likes_list.profile_image}" alt="프로필 사진">
							</div>
							<div class="item-info">
								<div class="nickname">${likes_list.nickName}</div>
								<div class="id">
									<a href="/potato/mylist?number=${likes_list.likes_member_number}&id=${likes_list.id}">${likes_list.id}</a>
								</div>
							</div>
							<div class="item-actions">
								<a href="/shop/get?board_number=${likes_list.board_number}"><c:out value='${likes_list.title}'/></a>
							</div>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
<br>
<br>

<%@ include file="../common/footer.jsp"%>
