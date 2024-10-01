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

    // 파일 선택 시 미리보기 실행
    $('#InputFile').on('change', previewImages);
});