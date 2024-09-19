<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- jstl 코어 태그용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- jstl 포메팅 태그용 -->

<%@ include file="../common/header.jsp" %>

<div class="formbold-main-wrapper"> <!-- 스타일을 외부로 분리 -->
    <div class="formbold-form-wrapper" > <!-- 스타일을 외부로 분리 -->
        <div class="formbold-form-title">
            <h2>상품등록</h2>
        </div>
        <form id="uploadForm" action="/shop/register" method="POST" enctype="multipart/form-data">
        <div class="file-input-wrapper">
		    <label for="InputFile">파일 선택</label>
		    <input type="multiple" accept="image/*" name="upload_file" id="upload_file">
		    <img id="image-preview" class="image-preview" src="" alt="미리보기 이미지">
		</div>
		</form>
        <div class="formbold-mb-3">
            <div>
                <label for="writer" class="formbold-form-label">판매자</label>
                <input class="formbold-form-input" name="writer" value="${sessionScope.nickName}" readonly="readonly" />
            </div>
        </div>
        <div class="formbold-mb-3">
            <div>
                <label for="writer_number" class="formbold-form-label">판매자코드</label>
                <input class="formbold-form-input" name="writer_number" value="${sessionScope.member_number}"  readonly="readonly" />
            </div>
        </div>
        <div class="formbold-mb-3">
            <div>
                <label for="board_address" class="formbold-form-label">판매자 주소</label>
                <input class="formbold-form-input" name="board_address" value="수원시" readonly="readonly" />
            </div>
        </div>
        <div class="formbold-mb-3">
            <div>
                <label for="title" class="formbold-form-label">제목</label>
                <input type="text" name="title" id="title" class="formbold-form-input" required />
            </div>
        </div>
        <div class="formbold-mb-3">
            <div>
                <label for="price" class="formbold-form-label">가격</label>
                <input type="text" name="price" id="price" class="formbold-form-input" required />
            </div>
        </div>
        <div class="formbold-mb-3">
            <label for="content" class="formbold-form-label">내용</label>
            <input type="text" name="content" id="content" class="formbold-form-input" required />
        </div>
        <div class="formbold-input-flex">
            <div>
                <select name="types" class="types" required>
                    <option value="" disabled selected>카테고리</option>
                    <option value="전자기기">전자기기</option>
                    <option value="옷">옷</option>
                    <option value="생활용품">생활용품</option>
                    <option value="스포츠용품">스포츠용품</option>
                </select>
            </div>
        </div>
        <div class="formbold-checkbox-wrapper">
            <label for="supportCheckbox" class="formbold-checkbox-label">
                <div class="formbold-relative">
                    <input type="checkbox" id="supportCheckbox" class="formbold-input-checkbox" required />
                    <div class="formbold-checkbox-inner">
                        <span class="formbold-opacity-0">
                            <svg width="11" height="8" viewBox="0 0 11 8" fill="none" class="formbold-stroke-current">
                                <path d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z" stroke-width="0.4"></path>
                            </svg>
                        </span>
                    </div>
                </div>
                정의된 이용약관 및 정책에 동의합니다.
            </label>
        </div>
        <button type="submit" class="formbold-btn" id="regBtn">등록하기</button>
    </form>
     <div id="successMessage" class="success-message" style="display: none;">
            <p>등록이 성공적으로 완료되었습니다!</p>
     </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>