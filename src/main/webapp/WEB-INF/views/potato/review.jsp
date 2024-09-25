<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/reply.js"></script>
    
<link rel="stylesheet" href="/resources/css/review.css">
<%@ include file="../common/header.jsp" %>

<section id="article-profile">
       <a id="article-profile-link">
           <div class="container">
           <h5>판매자 프로필</h5>
               <!-- 왼쪽 섹션 -->
               <div class="left-section">
                  <div class="profile_photo">
					<img id="img_thumb" src="${pageContext.request.contextPath}/resources/images/${member.profile_image}" alt="" 
					 width=100px height=100px>
					<span class="mask"></span>
				  </div>
                   <div id="article-profile-left">
                       <a>${member.nickName}</a>
                       <div id="region-name"><span>${member.address}</span></div>
                   </div>
      
               <!-- 오른쪽 섹션 -->
               <div class="right-section">
                   <dl id="temperature-wrap">
                       <dt>매너온도</dt>
                       <dd class="text-color-04">
                           <span>${user.temper}°C</span>
                       </dd>
                   </dl>
                   <div class="meters">
                       <div class="bar bar-color-04" style="width: 40%;"></div>
                   </div>
               </div>
           </div>
       </a>
   </section>
   
  
<div class='row'>
	<div class="col-lg-8">
	
		<!-- /.panel -->
		<div class="panel panel-default" style="width: 75%; margin-left: 60%;">
      		<br><br>
      		
      		<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active show" href="#reviews" data-toggle="tab">후기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#items" data-toggle="tab">판매물품(업데이트중)</a>
				</li>
			</ul>
				
			<div class="panel-heading" align="center" style="text-align: center;">
       			<p></p>
       			<button id='addReplyBtn' type="button" class="btn btn-success" style="float: right;">후기 등록</button>
      		</div>
      		
      		<!-- /.panel-heading" -->
      		<br><br><br>
      		
      		<div class="panel-body">
      			<div class="tab-content">
                    <div id="reviews" class="tab-pane active">
		      			<ul class="chat">
		      				<!-- reply(댓글) 시작 -->
		      			</ul>
      				</div>
      				<div id="items" class="tab-pane">
                        <ul class="item-list">
                            <!-- 판매물품 내용들 -->
                            <!-- <li>판매물품 1</li>
                            <li>판매물품 2</li> -->
                        </ul>
                    </div>
                 </div>
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
                <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
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

<!-- 대댓글 모달 -->
<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
                <h4 class="modal-title" id="replyModalLabel">대댓글을 남겨주세요</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>대댓글</label>
                    <input class="form-control" name='replyContent' placeholder="대댓글은 최대 1000자까지 입력가능합니다.">
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input class="form-control" name='replyWriter' readonly>
                </div>
                <div class="form-group">
                    <label>작성일</label>
                    <input class="form-control" name='replyRegidate' readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button id='replyModalModBtn' type="button" class="btn btn-warning">수정</button>
                <button id='replyModalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                <button id='replyModalRegisterBtn' type="button" class="btn btn-success">등록</button>
                <button id='replyModalCloseBtn' type="button" class="btn btn-default">닫기</button>
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
    var idValue = ${member.member_number}; // 판매자 정보
    var replyUL = $(".chat");
    //var currentUser = 'kwh'; // 로그인한 계정
    var currentUser = ${sessionScope.member_number}; // 로그인한 계정
    
    console.log("idValue:", idValue);
    console.log("currentUser:", currentUser);

    showList(1); // 후기 리스트 출력

    // 댓글 리스트 출력
    function showList(page) {
    replyService.getList({ id: idValue, page: page || 1 }, function(replyCnt, list) {
        console.log("replyCnt:", replyCnt);
        console.log("list:", list);

        if (page == -1) {
            var pageNum = Math.ceil(replyCnt / 10.0);
            showList(pageNum);
            return;
        }

        if (list == null || list.length == 0) {
            replyUL.html("<li>등록된 후기가 없습니다.</li>");
            return;
        }

        let comments = [];
        let pendingRequests = 0;

        // 댓글 정렬
        list.sort((a, b) => new Date(b.regidate) - new Date(a.regidate)); // DESC로 변경

        for (let i = 0; i < list.length; i++) {
            let currentComment = list[i];
            let replyValue = currentComment.reply_number;

            let commentHtml = "<li class='comment' data-reply_number='" + currentComment.reply_number + "' style='padding: 10px 0;'>";
            commentHtml += "<div class='comment-header' style='display: flex; align-items: center;'>";
            commentHtml += "<div id='article-profile-image' class='review-profile-photo' style='margin-right: 10px;'>";
            commentHtml += "<img alt='이미지' src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png' style='border-radius: 50%; width: 40px; height: 40px;'></div>";
            commentHtml += "<strong class='primary-font'>" + currentComment.writer + "</strong></div>";
            commentHtml += "<div class='card' style='border: none;'><p>" + currentComment.content + "</p>";
            commentHtml += "<small class='text-muted'>" + replyService.displayTime(currentComment.regidate) + "</small></div>";
            commentHtml += "<div style='border-top: 1px solid #ddd; margin: 10px 0;'></div>";
            commentHtml += "<button class='btn btn-info add-re_reply-btn' style='float: right; padding: 5px 10px; font-size: 14px;' data-re_reply_number='" + currentComment.reply_number + "'>댓글 등록</button>";

            comments.push(commentHtml); // 기본 댓글 HTML을 배열에 추가
            pendingRequests++;

            (function(commentId, index) {
                replyService.getReList({ rn: commentId }, function(relist) {
                    let repliesHtml = "";
                    for (let j = 0; j < relist.length; j++) {
                        let reply = relist[j];
                        if (reply.reply_number === commentId) {
                        	 repliesHtml += "<li class='reply' data-re_reply_number='" + reply.re_reply_number + "' style='padding: 10px 0;'>";
                             repliesHtml += "<div style='display: flex; align-items: center; margin-bottom: 10px;'>";
                             repliesHtml += "<div id='article-profile-image' class='review-profile-photo' style='margin-right: 10px;'>";
                             repliesHtml += "<img alt='이미지' src='https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png' style='border-radius: 50%; width: 40px; height: 40px;'></div>";
                             repliesHtml += "<div class='card' style='border: none;'><strong class='primary-font'>" + reply.writer + "</strong>";
                             repliesHtml += "<p>" + reply.content + "</p>";
                             repliesHtml += "<small class='pull-right text-muted'>" + replyService.displayTime(reply.regidate) + "</small></div>";
                             repliesHtml += "</div>";
                             
                          	 // 수정 및 삭제 버튼 추가
                             if (currentUser === reply.writer) {
                                 repliesHtml += "<button class='btn btn-warning btn-sm edit-reply-btn'>수정</button>";
                                 repliesHtml += "<button class='btn btn-danger btn-sm delete-reply-btn'>삭제</button>";
                             }
                             
                             // 대댓글 아래 선 추가
                             repliesHtml += "<div style='border-top: 1px solid #ddd; margin: 10px 0;'></div>";
                             repliesHtml += "</li>"; // 대댓글 종료
                        }
                    }

                    if (repliesHtml) {
                        comments[index] += "<button class='btn btn-info show-replies-btn' style='float: right; padding: 5px 10px; font-size: 14px;'>답글</button>";
                        comments[index] += "<ul class='replies' style='display: none;'>" + repliesHtml + "</ul>";
                    }

                    pendingRequests--;
                    if (pendingRequests === 0) {
                        replyUL.html(comments.join(''));
                    }
                });
            })(replyValue, i);
        }

        if (pendingRequests === 0) {
            replyUL.html(comments.join(''));
        }

        showReplyPage(replyCnt);
    });
} // function showList 종료


//본인이 등록한 판매물품 리스트 출력
/* function showItems() {
    itemService.getItemsBySeller(idValue, function(items) {
        if (!items || items.length === 0) {
            itemListUL.html("<li>등록된 판매물품이 없습니다.</li>");
            return;
        }

        let itemHtml = items.map(item => "<li><strong>${item.title}</strong><p>가격: ${item.price} 원</p><p>${item.description}</p><button class='btn btn-danger delete-item-btn' data-item_id='${item.id}'>삭제</button></li>").join('');

        itemListUL.html(itemHtml);
    });
} */
		
		
		// 탭 클릭 이벤트
		$('.nav-link').on('click', function() {
		    var target = $(this).attr('href');
		    $('.tab-pane').removeClass('active show');
		    $(target).addClass('active show');
		});
		
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
		
		
		
		// 모달
		var modal = $(".modal");
		var modalInputContent = modal.find("input[name='content']");
		var modalInputWriter = modal.find("input[name='writer']");
		var modalInputRegidate = modal.find("input[name='regidate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalCloseBtn = $("#modalCloseBtn");
		
		// 후기 추가 버튼 클릭시 이벤트 처리
		$("#addReplyBtn").on("click", function(e){
			
			if (!currentUser) {
		        alert("로그인 후 후기를 작성할 수 있습니다.");
		        return; // 로그인하지 않은 경우 함수 종료
		    }
			
			$('#replyModal').modal('hide');
			
			modal.find("input").val("");
			modalInputRegidate.closest("div").hide(); // 모달창에서 날짜입력부분 지우기
			modal.find("button[id !='modalCloseBtn']").hide(); // 모달창에서 수정, 삭제, 등록 버튼 지우기 (button[id !='modalCloseBtn -> 닫기버튼이 아닌것)
			
			modalRegisterBtn.show(); // 등록버튼만 다시 보여주기 (결과적으로 등록, 닫기 버튼 2개만 나옴)
			
			// 로그인한 계정 ID로 작성자 칸을 설정
		    modalInputWriter.val(currentUser).attr("readonly", "readonly"); // 작성자 칸에 로그인한 계정 ID 입력
			
			$("#reviewModal").modal("show"); // 모달창 실행
			$('#loginModal').hide();
			modal.modal("hide");
			showList(pageNum);
		});
		
		// 댓글 모달 닫기 버튼 클릭 이벤트 처리
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
			if ($(e.target).hasClass("show-replies-btn") || $(e.target).hasClass("edit-reply-btn") || $(e.target).hasClass("add-re_reply-btn") || $(e.target).hasClass("delete-reply-btn") || $(e.target).closest('.reply').length) {
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
				
				// 본인이 쓴 댓글인지 확인
		        if (currentUser === reply.writer) {
		            modalModBtn.show(); // 수정 버튼 보이기
		            modalRemoveBtn.show(); // 삭제 버튼 보이기
		            modalRegisterBtn.hide(); // 등록 버튼 숨기기
		        } else {
		            modalModBtn.hide(); // 수정 버튼 숨기기
		            modalRemoveBtn.hide(); // 삭제 버튼 숨기기
		            modalRegisterBtn.hide(); // 등록 버튼 숨기기
		        }
				
	            $('#reviewModal').modal("show");
				$('#loginModal').hide();
				$('#replyModal').modal("hide");
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		// 대댓글 더보기 버튼 클릭 이벤트 처리
	    $(document).on("click", ".show-replies-btn", function(e) {
	        e.preventDefault();
	        var $button = $(this);
	        var $replies = $button.siblings(".replies");
		
	        if ($replies.is(":visible")) {
	            $replies.slideUp();
	            $button.text("답글");
	        } else {
	        	$(".chat .replies").not($replies).slideUp(); // 이전 대댓글을 숨김
	            $(".chat .show-replies-btn").not($button).text("답글"); // 다른 버튼의 텍스트를 복원
	            $replies.slideDown();
	            $button.text("숨기기");
	        }
	    });
	 	
	 	// 대댓글 추가 버튼 클릭 이벤트 처리
	    $(".chat").on("click", ".add-re_reply-btn", function(e) {
	    	if (!currentUser) {
		        alert("로그인 후 댓글을 작성할 수 있습니다.");
		        return; // 로그인하지 않은 경우 함수 종료
		    }
	    	
		    e.preventDefault();
		
		    var replyModal = $("#replyModal");
		    var reviewModal = $("#reviewModal");
		    
		 	// 현재 댓글의 reply_number를 가져와서 대댓글 모달에 설정
		    var parentReplyNumber = $(this).closest(".comment").data("reply_number");
		    console.log("부모댓글 번호:", parentReplyNumber); // 디버깅용 콘솔 출력
		    
		 	// 부모 댓글 번호를 모달에 데이터로 저장
		    replyModal.data("parent_reply_number", parentReplyNumber);
		
		    // 대댓글 모달에 데이터 설정
		    replyModal.find("input[name='replyContent']").val(""); // 대댓글 내용 초기화
		    replyModal.find("input[name='replyWriter']").val(currentUser); // 현재 사용자로 설정
		    replyModal.find("input[name='replyRegidate']").closest("div").hide(); // 날짜 입력 부분 숨기기
		
		    // 모달의 버튼 상태 설정
		    replyModal.find("button[id != 'replyModalCloseBtn']").hide(); // 닫기 버튼을 제외한 버튼 숨기기
		    replyModal.find("#replyModalRegisterBtn").show(); // 등록 버튼 표시
		    replyModal.find("#replyModalCloseBtn").show(); // 닫기 버튼 표시
		
		    // reviewModal 숨기기 및 replyModal 보이기
		    $("#replyModal").modal("show"); // 모달창 실행
			
		
		    showList(pageNum);
		});
	 	
	 	// 대댓글 등록 버튼 클릭 시 대댓글 추가
	    $("#replyModalRegisterBtn").on("click", function(e){
	    	e.preventDefault(); // 기본 동작 방지
	    	
	    	
	        var modal = $("#replyModal");
	        var reply = {
	            content : modal.find("input[name='replyContent']").val(),
	            writer : modal.find("input[name='replyWriter']").val(),
	            reply_number: modal.data("parent_reply_number") // 부모 댓글 번호
	        };
	        console.log(reply); // 객체 값 확인
	        
	        replyService.addReply(reply, function(result){
	            alert(result);
	            
	            modal.find("input").val("");
				modal.modal("hide");
	            
	            showList(pageNum); // 대댓글 추가 시 댓글 리스트를 갱신합니다.
	        });
	    });
	 	
	 	// 대댓글 모달 닫기 버튼 클릭 이벤트 처리
		$('#replyModalCloseBtn').click(function(e) {
		    $('#replyModal').hide();
		    modal.modal("hide");
			showList(pageNum);
		  });
	 	
	 	// 대댓글 수정 버튼 클릭시 객체 가져와 모달창 띄움
		$(".chat").on("click", ".edit-reply-btn, .delete-reply-btn", function(e) {
		    e.preventDefault();
		    
		 	// 클릭한 버튼이 포함된 li 요소를 찾습니다
	        // var replyElement = $(this).parents(".comment");
		 	var replyElement = $(this).closest(".reply"); // 가장 가까운 .reply 요소를 찾습니다
	        var re_reply_number = replyElement.data("re_reply_number");
	        console.log("대댓글 번호:", re_reply_number); // 디버깅용 콘솔 출력

	        if (!re_reply_number) {
	            console.error("대댓글 번호를 가져오는 데 실패했습니다.");
	            return;
	        }
		    
		    replyService.getReReply(re_reply_number, function(reply) {
		        $("#replyModal").find("input[name='replyContent']").val(reply.content);
		        $("#replyModal").find("input[name='replyWriter']").val(reply.writer);
		        $("#replyModal").find("input[name='replyRegidate']").val(replyService.displayTime(reply.regidate));
		        $("#replyModal").data("re_reply_number", reply.re_reply_number);
		        
		        $("#replyModal").find("button[id='replyModalRegisterBtn']").hide();
		        $("#replyModal").find("button[id='replyModalRemoveBtn']").show();
		        $("#replyModal").find("button[id='replyModalModBtn']").show();
		        $("#replyModal").find("button[id='replyModalCloseBtn']").show();
		        $("#replyModal").modal("show");
		    });
		});
	 	
	 	// 대댓글 수정버튼 클릭 시 대댓글 수정
		$("#replyModalModBtn").on("click", function(e) {
		    e.preventDefault();
		    
		    var re_reply = {
		        re_reply_number: $("#replyModal").data("re_reply_number"),
		        content: $("#replyModal").find("input[name='replyContent']").val()
		    };
		    console.log("대댓글 객체:", re_reply); // 디버깅용 콘솔 출력
		    
		    replyService.updateReReply(re_reply, function(result) {
		        alert(result);
		        $("#replyModal").modal("hide");
		        showList(pageNum);
		    });
		});
	 	
	 	// 대댓글 삭제 버튼 클릭 시 대댓글 삭제
	    $("#replyModalRemoveBtn").on("click", function(e){
	        var re_reply_number = $("#replyModal").data("re_reply_number");
	        replyService.removeReReply(re_reply_number, function(result){
	            alert(result);
	            $("#replyModal").modal("hide");
	            showList(pageNum);
	        });
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
