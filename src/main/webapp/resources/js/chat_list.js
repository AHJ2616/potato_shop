$(document).ready(function() {
        let dropdownContent = document.getElementById('myDropdown');

        $('.dropbtn').on('click', function(event) {
            event.preventDefault();
            event.stopPropagation();

            // 드롭다운 위치 조정
            let rect = this.getBoundingClientRect();
            dropdownContent.style.top = (rect.bottom + window.scrollY) + 'px';
            dropdownContent.style.left = rect.left + 'px';

            dropdownContent.classList.toggle('show');
        });

        // 다른 곳을 클릭하면 드롭다운 닫기
        document.on('click', function(event) {
            if (!event.target.matches('.dropbtn')) {
                if (dropdownContent.classList.contains('show')) {
                    dropdownContent.classList.remove('show');
                }
            }
        });
    });