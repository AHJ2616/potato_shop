<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl 코어 태그용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl 포메팅 태그용 -->

<%@ include file="../common/header.jsp"%>
<div class="formbold-main-wrapper">
	<!-- 스타일을 외부로 분리 -->
	<div class="formbold-form-wrapper">
		<!-- 스타일을 외부로 분리 -->
		<div class="formbold-form-title">
			<h2>상품등록</h2>
		</div>
		<form id="uploadForm" action="/shop/register" method="POST" enctype="multipart/form-data">
			<div class="file-input-wrapper">
				<input type="file" accept="image/*" name="fileUpload" id="InputFile" multiple onchange="previewImages()" required>
				<label for="InputFile">이미지 추가</label>
				<!-- 파일 선택을 위한 레이블 -->
			</div>
			<div class="image-container">
				<button type="button" id="prevButton" class="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
					  <path d="M10 12.796V3.204L4.519 8zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753"/>
					</svg>
				</button>
				
				<div id="image-preview" class="image-preview-container"></div>
				
				<button type="button" id="nextButton" class="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
			  			<path d="M6 12.796V3.204L11.481 8zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753"/>
					</svg>
				</button>
			</div>
			<input type="hidden" id="writer" name="writer"
				value="<c:out value='${sessionScope.nickName}'/>" /> <input
				type="hidden" id="writer_number" name="writer_number"
				value="<c:out value='${sessionScope.member_number}'/>" /> <input
				type="hidden" id="board_address" name="board_address"
				value="<c:out value='${sessionScope.address}'/>" /> <input
				type="hidden" id="selectedCategoriesInput" name="selectedCategories"
				value="" />
			<div class="formbold-mb-3">
		    	<div>
			        <label for="title" class="formbold-form-label">제목</label>
			        <input type="text" name="title" id="title" class="formbold-form-input" maxlength="20" required />
			        <small id="titleCount">0/20</small> <!-- 글자 수 표시 -->
		    	</div>
			</div>
			
			<div class="formbold-mb-3">
			    <div>
			        <label for="price" class="formbold-form-label">가격</label>
			        <input type="text" name="price" id="price" class="formbold-form-input" maxlength="10" required />
			        <small id="priceCount">0/10</small> <!-- 글자 수 표시 -->
			    </div>
			</div>
			
			<div class="formbold-mb-3">
			    <label for="content" class="formbold-form-label">내용</label>
			    <textarea name="content" id="content" class="formbold-form-input" maxlength="500" required></textarea>
			    <small id="contentCount">0/500</small> <!-- 글자 수 표시 -->
			</div>
			<div class="formbold-input-flex">
				<div>
					<select name="types" class="types" required>
						<option value="" disabled selected>카테고리 선택</option>
						<option value="디지털기기">디지털기기</option>
						<option value="생활가전">생활가전</option>
						<option value="가구/인테리어">가구/인테리어</option>
						<option value="생활/주방">생활/주방</option>
						<option value="유아동">유아동</option>
						<option value="유아도서">유아도서</option>
						<option value="여성의류">여성의류</option>
						<option value="여성잡화">여성잡화</option>
						<option value="남성패션/잡화">남성패션/잡화</option>
						<option value="뷰티/미용">뷰티/미용</option>
						<option value="스포츠/레저">스포츠/레저</option>
						<option value="취미/게임/음반">취미/게임/음반</option>
						<option value="도서">도서</option>
						<option value="티켓/교환권">티켓/교환권</option>
						<option value="가공식품">가공식품</option>
						<option value="건강기능식품">건강기능식품</option>
						<option value="반려동물용품">반려동물용품</option>
						<option value="식물">식물</option>
						<option value="기타 중고물품">기타 중고물품</option>
						<option value="삽니다">삽니다</option>
					</select>
				</div>
			</div>
			<div class="formbold-checkbox-wrapper">
				<label for="supportCheckbox" class="formbold-checkbox-label">
					<div class="formbold-relative">
						<input type="checkbox" id="supportCheckbox" class="formbold-input-checkbox" required />
						&nbsp;&nbsp;정의된 이용약관 및 정책에 동의합니다.
						<div class="formbold-checkbox-inner">
							<span class="formbold-opacity-0"> <svg width="11" height="8" viewBox="0 0 11 8" fill="none" class="formbold-stroke-current">
                                <path d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 
                                4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 
                                6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z" stroke-width="0.4"></path>
                            </svg>
							</span>
						</div>
					</div>
				</label>
			</div>
			<button type="submit" class="formbold-btn">등록하기</button>
		</form>
	</div>
</div>
<script src="/resources/js/board_register.js"></script>
<%@include file="../common/footer.jsp"%>