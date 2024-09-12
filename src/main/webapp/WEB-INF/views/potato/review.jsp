<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<style>
div {
  /* 글 왼쪽 정렬하기 */
  text-align: left;
}
</style>

<br><br>
<h1 align="center">판매자의 정보</h1>
<div class='row'>
	<div class="col-lg-8">
	
		<!-- /.panel -->
		<div class="panel panel-default" style="width: 100%; margin-left: 25%;">
			<!-- <div class="panel-heading">
       			<i class="fa fa-comments fa-fw"></i> 댓글 목록
      		</div> -->
      		<br><br>
      		
      		<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active show" href="#tab1" data-toggle="tab">후기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab2" data-toggle="tab">판매물품(업데이트중)</a>
				</li>
			</ul>
				
			<div class="panel-heading" align="center" style="text-align: center;">
       			<p></p>
       			<button id='addReplyBtn' type="button" class="btn btn-success" style="float: right;">후기 달기</button>
      		</div>
      		
      		<!-- /.panel-heading" -->
      		<br><br><br>
      		<div class="panel-body">
      			<ul class="chat">
      				<!-- reply(댓글) 시작 -->
      				
      			</ul>
      		</div>
      		<!-- /.panel-body -->
      		<div class="panel-footer">
      		
      		</div>
      		<!-- /.panel-footer -->
		</div>
		<!-- /.panel panel-default -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<!-- Modal -->
<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">후기를 남겨주세요</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                	<label>후기</label>
                	<input class="form-control" name='content' value='New Reply!!!' placeholder="댓글은 최대 1000자까지 입력가능합니다.">
                </div>
                <div class="form-group">
                	<label>작성자</label>
                	<input class="form-control" name='writer' value='replyer'>
                </div>
                <div class="form-group">
                	<label>작성일</label>
                	<input class="form-control" name='regidate' value=''>
                </div>
            </div>
            <div class="modal-footer">
                <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
                <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                <button id='modalRegisterBtn' type="button" class="btn btn-success">등록</button>
                <button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function() {
    var idValue = 'kwh'; // 임시 아이디 설정
    var replyUL = $(".chat");
    var currentUser = "currentUser"; // 임시 로그인한 계정 (서버에서 세션으로 로그인 계정 불러와야함)

    showList(1);

    // 댓글 리스트 출력
    function showList(page) {
        replyService.getList({id: idValue, page: page || 1}, function(replyCnt, list) {
            console.log("replyCnt:", replyCnt);
            console.log("list:", list);

            if (page == -1) { // 페이지 번호가 -1로 전달되면 마지막페이지를 호출
                var pageNum = Math.ceil(replyCnt / 10.0); // 댓글 개수를 10으로 나눠서 올림을 함
                showList(pageNum);
                return;
            }

            if (list == null || list.length == 0) {
                replyUL.html(""); // 댓글이 없는 경우 리스트를 비웁니다.
                return;
            }

            let str = "";
            let pendingRequests = 0; // 비동기 요청을 추적하는 변수

            // 댓글 목록을 비우고 나중에 대댓글을 추가합니다.
            let comments = [];

            for (let i = 0, len = list.length || 0; i < len; i++) {
                let currentComment = list[i];
                let replyValue = currentComment.reply_number;

                let commentHtml = "<li class='comment' data-reply_number='" + currentComment.reply_number + "'>";
                commentHtml += "  <div class='card'><div class='header' align='center'><strong class='primary-font'>" + currentComment.writer + "</strong>";
                commentHtml += "    <small class='pull-right text-muted'>" + replyService.displayTime(currentComment.regidate) + "</small></div>";
                commentHtml += "    <p>" + currentComment.content + "</p></div>";

                // 대댓글 리스트를 비동기적으로 가져옵니다.
                pendingRequests++;
                (function(commentId, commentHtml) {
                    replyService.getReList({rn: commentId}, function(relist) {
                        console.log("replyValue값 : " + commentId);
                        console.log("relist:", relist);

                        let repliesHtml = "";
                        for (let j = 0, replyLen = relist.length || 0; j < replyLen; j++) {
                            let reply = relist[j];

                            // 대댓글의 부모 댓글 번호와 현재 댓글의 번호가 같은지 확인
                            if (reply.reply_number === commentId) {
                                repliesHtml += "<li data-re_reply_number='" + reply.re_reply_number + "' class='reply'>";
                                repliesHtml += "  <div class='card'><div class='header' align='center'><strong class='primary-font'>" + reply.writer + "</strong>";
                                repliesHtml += "    <small class='pull-right text-muted'>" + replyService.displayTime(reply.regidate) + "</small></div>";
                                repliesHtml += "    <p>" + reply.content + "</p></div></li>";
                                repliesHtml += "    <button class='btn btn-warning btn-sm edit-reply-btn'>수정</button>";
                                repliesHtml += "    <button class='btn btn-danger btn-sm delete-reply-btn'>삭제</button></div></li>";
                            }
                        }

                     	// 대댓글이 있을 경우, '더보기' 버튼을 추가합니다.
                        if (repliesHtml) {
                            commentHtml += "<button class='btn btn-info show-replies-btn'>댓글 더보기</button>";
                            commentHtml += "<ul class='replies' style='display: none;'>" + repliesHtml + "</ul>"; // 대댓글을 포함하는 리스트를 추가
                        }
                    
                        

                        commentHtml += "</li><br>"; // 댓글과 대댓글 리스트 종료

                        // 댓글을 댓글 목록에 추가
                        comments.push(commentHtml);

                        pendingRequests--;

                        if (pendingRequests === 0) {
                            // 모든 비동기 호출이 완료된 후 HTML을 업데이트
                            replyUL.html(comments.join(''));
                        } // if 종료
                    }); // replyService.getReList 대댓글 js종료
                })(replyValue, commentHtml);
            } // 댓글 for 종료

            // 비동기 요청이 없는 경우 바로 HTML을 업데이트합니다.
            if (pendingRequests === 0) {
                replyUL.html(comments.join(''));
            }

            showReplyPage(replyCnt);
        });
    } // function showList 종료
		
		
		// 댓글 페이지번호 출력
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt){
				next = true;
			}
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev){
				str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			}
			
			for(var i = startNum ; i <= endNum; i++){
				
				var active = pageNum == i? "active":"";
				
				str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next){
				str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			replyPageFooter.html(str);
		}
		
		// 하단 페이지 변경
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		// 로그인 상태가 아닐 시 리뷰 작성 불가(업데이트중)
		
		
		
		// 모달
		var modal = $(".modal");
		var modalInputContent = modal.find("input[name='content']");
		var modalInputWriter = modal.find("input[name='writer']");
		var modalInputRegidate = modal.find("input[name='regidate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalCloseBtn = $("#modalCloseBtn");
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modalInputRegidate.closest("div").hide(); // 모달창에서 날짜입력부분 지우기
			modal.find("button[id !='modalCloseBtn']").hide(); // 모달창에서 수정, 삭제, 등록 버튼 지우기 (button[id !='modalCloseBtn -> 닫기버튼이 아닌것)
			
			modalRegisterBtn.show(); // 등록버튼만 다시 보여주기 (결과적으로 등록, 닫기 버튼 2개만 나옴)
			
			$(".modal").modal("show"); // 모달창 실행
			$('#loginModal').hide();
			modal.modal("hide");
			showList(pageNum);
		});
		
		$('#modalCloseBtn').click(function(e) {
		    $('#reviewModal').hide();
		    modal.modal("hide");
			showList(pageNum);
		  });
		
		// 댓글 추가 기능
		modalRegisterBtn.on("click",function(e){
			
			$('.black-bg').fadeIn('noshow');
			
			var reply = {
					content : modalInputContent.val(),
					writer : modalInputWriter.val(),
					id : idValue
			};
			replyService.add(reply, function(result){
				
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				//showList(1);
				$('#loginModal').hide();
				showList(-1); // 새로운 댓글 추가시 상단의 전체 댓글 숫자 파악 코드 호출하여 마지막 페이지 이동
			});
		});
		
		
	//댓글 조회 클릭 이벤트 처리 (댓글 클릭시 수정, 삭제할 수 있게 모달창 띄움)
	$(document).ready(function() {
		
		$(".chat").on("click", "li.comment", function(e){
			
			// 대댓글 더보기 버튼 클릭 이벤트와 충돌하지 않도록 조건을 확인
			if ($(e.target).hasClass("show-replies-btn") || $(e.target).hasClass("edit-reply-btn") || $(e.target).hasClass("delete-reply-btn") || $(e.target).closest('.reply').length) {
                // 대댓글 더보기 버튼 클릭 시에는 아무 작업도 하지 않음
                return;
            }
			
			var reply_number = $(this).data("reply_number"); // 해당 댓글의 댓글번호를 변수에 지정
			
			
			replyService.get(reply_number, function(reply){ 
				
				modalInputContent.val(reply.content);
				modalInputWriter.val(reply.writer)
				.attr("readonly", "readonly");
				modalInputRegidate.val(replyService.displayTime(reply.regidate))
				.attr("readonly", "readonly");
				modal.data("reply_number", reply.reply_number); // 댓글 번호에 해당하는 객체를 가져옴 (날짜는 읽기전용으로 수정불가 readonly)
				
				// 현재 사용자가 작성한 댓글인지 확인
	            if (reply.writer === currentUser) {
					modal.find("button[id != 'modalCloseBtn']").hide(); // 닫기 버튼 제외 숨김 
					modalModBtn.show(); // 수정버튼 보여줌
					modalRemoveBtn.show(); // 삭제버튼 보여줌 (결론적으로는 등록버튼만 숨김)
	            }else{
	            	modal.find("button[id != 'modalCloseBtn']").hide();
	            }
				
				$(".modal").modal("show");
				$('#loginModal').hide();
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		// 대댓글 더보기 버튼 클릭 이벤트 처리
	    $(".chat").on("click", ".show-replies-btn", function(e) {
	        e.preventDefault();
	        var $button = $(this);
	        var $replies = $button.siblings(".replies");
	
	        if ($replies.is(":visible")) {
	            $replies.slideUp();
	            $button.text("댓글 더보기");
	        } else {
	            $replies.slideDown();
	            $button.text("댓글 숨기기");
	        }
	    });
		
		// 댓글 수정 기능
		modalModBtn.on("click", function(e){
			
			var reply = {reply_number:modal.data("reply_number"), content:modalInputContent.val()}; // 댓글번호, 수정하는 댓글 내용
			
			replyService.update(reply, function(result){ // replyService.update로 전달하여 객체 수정 후 저장
				
				alert(result); // 결과 success alert창으로 보여줌
				modal.modal("hide");
				showList(pageNum); // 처리 후 페이지 갱신
			});
		});
		
		// 댓글 삭제 기능
		modalRemoveBtn.on("click", function(e){
			
			var reply_number = modal.data("reply_number"); // 댓글번호
			
			replyService.remove(reply_number, function(result){ // replyService.remove로 전달하여 객체 삭제
				
				alert(result); // 결과 success alert창으로 보여줌
				modal.modal("hide");
				showList(pageNum);
			});
		});
	});
		
});
</script>
<%@ include file="../common/footer.jsp" %>
