$(document).ready(function() {
    // 검색 버튼 클릭 이벤트 핸들러
    $("#searchBtn").on("click", function(event) {
        event.preventDefault(); // 폼 제출 방지
        var memberId = $("#searchInput").val();
        console.log("Searching for member ID:", memberId); // 콘솔 로그 추가

        $.ajax({
            url: '/potato/admin/memberList',  // 서버로 요청 보낼 URL
            method: 'GET',
            data: { id: memberId },  // 전달할 파라미터 (id)
            success: function(response) {
                console.log("AJAX 요청 성공:", response); // 콘솔 로그 추가
                // 성공적으로 데이터를 받았을 경우 페이지 이동
                window.location.href = '/potato/admin/memberList?id=' + memberId;
            },
            error: function(error) {
                console.log("AJAX 요청 실패:", error); // 콘솔 로그 추가
                alert("회원정보가 없습니다.");
            }
        });
    }); // 회원 검색
    
     $(document).ready(function() {
            $("#modifyBtn").on("click", function() {
                var memberId = $("#memberId").val();
                var memberStatus = $("#memberStatus").val();

                // AJAX 요청을 통해 회원 상태를 업데이트합니다.
                $.ajax({
                    url : "/potato/admin/updateMemberStatus",
                    type : "POST",
                    data : {
                        id : memberId,
                        status : memberStatus
                    },
                    success : function(response) {
                        alert("회원 상태가 성공적으로 업데이트되었습니다.");
                    },
                    error : function() {
                        alert("회원 상태 업데이트에 실패했습니다.");
                    }
                });
            });
        }); // 회원정보 검색 후 정보수정
   });