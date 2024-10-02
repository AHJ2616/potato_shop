$(document).ready(function() {
    let currentIndex = 0; // 현재 이미지 인덱스
    let files = [];

    function previewImages() {
        const previewContainer = $('#image-preview');
        previewContainer.empty(); // 기존 미리보기 초기화
        files = $('#InputFile')[0].files; // 파일 리스트 저장

        if (files.length > 0) {
            currentIndex = 0; // 이미지 선택 시 인덱스 초기화
            showImage(currentIndex); // 첫 번째 이미지 보여주기
        }
    }

    function showImage(index) {
        const previewContainer = $('#image-preview');
        previewContainer.empty(); // 기존 미리보기 초기화
        const file = files[index];

        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = $('<img>').attr('src', e.target.result).addClass('image-preview');
                previewContainer.append(img);
            }
            reader.readAsDataURL(file);
        }
    }

    $('#prevButton').on('click', function() {
        if (currentIndex > 0) {
            currentIndex--; // 이전 이미지로 이동
            showImage(currentIndex);
        }
    });

    $('#nextButton').on('click', function() {
        if (currentIndex < files.length - 1) {
            currentIndex++; // 다음 이미지로 이동
            showImage(currentIndex);
        }
    });
	
	const titleInput = document.getElementById('title');
    const titleCount = document.getElementById('titleCount');
    const contentInput = document.getElementById('content');
    const contentCount = document.getElementById('contentCount');
    const priceInput = document.getElementById('price');
    const validNumber = /^[0-9]*$/;
    
    // 제목 글자수 제한
    titleInput.addEventListener('input', function () {
        titleCount.textContent = `${this.value.length}/20`;
        validateText(this);
    });
    
    // 내용 글자수 제한
    contentInput.addEventListener('input', function () {
        contentCount.textContent = `${this.value.length}/500`;
        validateText(this);
    });
    
    // 가격 글자 수 제한
    document.getElementById('price').addEventListener('input', function () {
        const priceLength = this.value.length;
        document.getElementById('priceCount').textContent = `${priceLength}/10`;
    });
    
    // 가격은 숫자만 입력되도록
    priceInput.addEventListener('input', function () {
       // 음수 또는 숫자가 아닌 값이 입력된 경우 처리
    if (!validNumber.test(this.value)) {
        alert('가격은 숫자만 입력할 수 있습니다.');
        this.value = ''; // 잘못된 값이 입력되면 입력값을 비움
    } else if (this.value < 0) {
        alert('가격은 0 이상이어야 합니다.');
        this.value = ''; // 음수 입력 시 값을 비움
    	}
    });

    // 파일 선택 시 미리보기 실행
    $('#InputFile').on('change', previewImages);
});