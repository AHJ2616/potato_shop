 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>좋아요 & 관심</title>
 <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="/resources/css/shop_get.css" rel="stylesheet" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%@ include file="../common/header.jsp" %>
<br><br>
 <h2 align="center">좋아요 리스트</h2>
  <div class="container mt-5">
        <table id="likes" class="table table-bordered">
            <thead>
                <tr>
                    <th>판매자 프로필</th>
                    <th>게시글 보기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="likes_list" items="${result}">
                	<c:if test="${likes_list.likes == 1}">
                    <tr>
                        <td>
                            <section id="article-profile">
         					  <h3 class="hide">프로필</h3>
          						 <div class="container">
              						 <div class="left-section">
                						 <div class="profile_photo">
									    	<img id="img_thumb" src="${pageContext.request.contextPath}/resources/images/${likes_list.profile_image}" alt="" 
												 width=100px height=100px>
											<span class="mask"></span>
				  						</div>
                  					    <div id="article-profile-left">
                      					 <a id="nickname"  href="/potato/review">${likes_list.nickName}</a>
                       						<div id="region-name"><span>${likes_list.id}</span></div>
                   							</div>
               							</div>
               					</div>
               				</section>			
                        </td>
                        <td>
                        	<a href="/shop/get?board_number=${likes_list.board_number}"><c:out value="${likes_list.title}"></c:out></a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
</div>
<br><br>
<h2 align="center">관심 리스트</h2>
  <div class="container mt-5">
        <table id="interest" class="table table-bordered">
            <thead>
                <tr>
                    <th>판매자 프로필</th>
                    <th>게시글 보기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="likes_list" items="${result}">
                	<c:if test="${likes_list.interest == 1}">
                    <tr>
                        <td>
                            <section id="article-profile">
         					  <h3 class="hide">프로필</h3>
          						 <div class="container">
              						 <div class="left-section">
                						 <div class="profile_photo">
									    	<img id="img_thumb" src="${pageContext.request.contextPath}/resources/images/${likes_list.profile_image}" alt="" 
												 width=100px height=100px>
											<span class="mask"></span>
				  						</div>
                  					    <div id="article-profile-left">
                      					 <a id="nickname"  href="/potato/review">${likes_list.nickName}</a>
                       						<div id="region-name"><span>${likes_list.id}</span></div>
                   							</div>
               							</div>
               					</div>
               				</section>			
                        </td>
                        <td>
                        	<a href="/shop/get?board_number=${likes_list.board_number}"><c:out value="${likes_list.title}"></c:out></a>
                        </td>
                    </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
  
<%@ include file="../common/footer.jsp" %>
  