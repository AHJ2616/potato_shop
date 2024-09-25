package com.potato.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.Re_replyVO;
import com.potato.service.Re_replyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController // Rest로 응답 함!!! -> view-jsp가 아닌 json, xml로 나옴
@RequestMapping("/replies") // http://localhost:80/re_replies/???
@Log4j2
@AllArgsConstructor // new Re_replyController(Re_replyService);
public class Re_reply_controller {
	// 대댓글 추가
		// http://localhost:80/re_replies/new (json으로 입력 되면 객체로 저장됨)

	private Re_replyService service;
	
	
	// 대댓글---------------------------------
	
			// 대댓글 보기(사용)
			// http://localhost:80/replies/reply/4
			@GetMapping(value="/reply/{re_reply_number}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
			public ResponseEntity<Re_replyVO> readReReply(@PathVariable("re_reply_number") String re_reply_number){
				
				log.info("ReplyController.get()메서드 실행 / 찾을 reply_number : " + re_reply_number);
				
				return new ResponseEntity<>(service.readReReply(re_reply_number), HttpStatus.OK); // 200 정상
			}
		    
		    // 대댓글 리스트(사용)
		    // http://localhost:80/replies/reply/12/re_replies
		    @GetMapping("/reply/{reply_number}/re_replies")
		    public List<Re_replyVO> getReReplies(@PathVariable String reply_number) {
		        return service.getReRepliesByReplyNumber(reply_number);
		    }
		    
		    // 대댓글 작성(사용)
		    // http://localhost:80/replies/re_replies
		 	@PostMapping(value = "/re_replies", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})// 입력값은 json 으로
		    public ResponseEntity<String> postReReply(@RequestBody Re_replyVO re_replyVO) {
		 		
		    	Ulid ulid = UlidCreator.getUlid();
				re_replyVO.setRe_reply_number(ulid.toString());
		    	
				int insertCount = service.addReReply(re_replyVO); // sql 처리 후에 결과값이 1 | 0 이 나옴
				
				return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
				// 삼항 연산자 처리
		    }

		    // 대댓글 수정(사용)
		    // http://localhost:80/replies/re_replies/3
		 	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
		 			value = "/re_replies/{re_reply_number}",
		 			consumes = "application/json", 
		 			produces = {MediaType.TEXT_PLAIN_VALUE})
		    public ResponseEntity<String> updateReReply(@RequestBody Re_replyVO re_replyVO, @PathVariable("re_reply_number") String re_reply_number) {
		    	
		 		re_replyVO.setReply_number(re_reply_number);
		 		
		 		return service.updateReReply(re_replyVO) == 1
		 				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
		 		 		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류;
		    }
		 	
		    // 대댓글 삭제(사용)
		    // http://localhost:80/replies/re_replies/1
		 	@DeleteMapping(value="/re_replies/{re_reply_number}", produces = {MediaType.TEXT_PLAIN_VALUE})
		    public ResponseEntity<String> deleteReReply(@PathVariable("re_reply_number") String re_reply_number) {
		    	
		    	return service.deleteReReply(re_reply_number) == 1 
		 				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
		 				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
		    }
		
		
		
	}
