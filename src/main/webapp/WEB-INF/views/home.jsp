 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <title>감자마켓</title>
  <!-- shop section -->
  <%@ include file="./common/header.jsp" %>
   <c:if test="${not empty message}">
        <div id="successAlert" class="alert alert-success">${message}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div id="errorAlert" class="alert alert-danger">${errorMessage}</div>
    </c:if>
    
  <section class="shop_section layout_padding">
    <div class="container">
    <div class="heading_container heading_center">
    <div class="potato_box" style="display: flex; align-items: center; height: 400px; background-color: #fff8e1; padding: 20px; margin-left: 20px;">
    <img src="${pageContext.request.contextPath}/resources/images/potato_home.jpeg" alt="판매자 이미지" width="400" height="400">
    <ul>
    <h3 style="margin-left: 20px;" align="center">
    감자마켓에 오신것을 환영합니다
	</h3>
    <h5>🥔 인기게시물 과 검색기능을 활용해서 원하는 물건을 거래하세요</h5>
    <h5>🥔 판매자와 구매자의 1:1 대화기능을 사용하여 실시간 채팅을 하세요</h5>
	</ul>
	</div>
    </div>
    </div>
  </section>
  <c:if test="${not empty message}">
            alert("${message}");
        </c:if>
        <c:if test="${not empty errorMessage}">
            alert("${errorMessage}");
        </c:if>
  <!-- end shop section -->
  
  <script>
    // 3초 후 알림 메시지 숨기기
    setTimeout(function() {
        var successAlert = document.getElementById('successAlert');
        var errorAlert = document.getElementById('errorAlert');
        
        if (successAlert) {
            successAlert.style.display = 'none';
        }
        if (errorAlert) {
            errorAlert.style.display = 'none';
        }
    }, 3000);
</script>
  

   <%@ include file="./common/footer.jsp" %>