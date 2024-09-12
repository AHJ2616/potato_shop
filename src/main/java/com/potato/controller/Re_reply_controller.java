package com.potato.controller;

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
import com.potato.domain.Re_replyPageDTO;
import com.potato.domain.Re_replyVO;
import com.potato.domain.Re_reply_critera;
import com.potato.service.Re_replyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController // Rest로 응답 함!!! -> view-jsp가 아닌 json, xml로 나옴
@RequestMapping("/re_replies") // http://localhost:80/re_replies/???
@Log4j2
@AllArgsConstructor // new Re_replyController(Re_replyService);
public class Re_reply_controller {
	// 대댓글 추가
		// http://localhost:80/re_replies/new (json으로 입력 되면 객체로 저장됨)

	private Re_replyService service;
	
	
		@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})// 입력값은 json 으로
		public ResponseEntity<String> create(@RequestBody Re_replyVO re_replyVO){
			// 리턴은 200 | 500 으로 처리 된다.
			
			Ulid ulid = UlidCreator.getUlid();
			re_replyVO.setRe_reply_number(ulid.toString());
			
			log.info("Re_replyVO 객체 입력 값 : " + re_replyVO); // 파라미터로 넘어온 값 출력 테스트
			
			int insertCount = service.register(re_replyVO); // sql 처리 후에 결과값이 1 | 0 이 나옴
			
			log.info("서비스+매퍼 처리 결과 : " + insertCount);
			
			
			return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
									: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
			// 삼항 연산자 처리
		}
		
		// 대댓글 보기
		// http://localhost:80/re_replies/2
		@GetMapping(value="/{re_reply_number}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
		public ResponseEntity<Re_replyVO> get(@PathVariable("re_reply_number") String re_reply_number){
			
			log.info("ReplyController.get()메서드 실행 / 찾을 reply_number : " + re_reply_number);
			
			return new ResponseEntity<>(service.get(re_reply_number), HttpStatus.OK); // 200 정상
		}
		
		// 대댓글 수정
		// http://localhost:80/re_replies/2
		// RequestMethod.PUT -> @PutMapping (객체 전체 필드를 수정한다)
		// RequestMethod.PATCH -> @PatchMapping (객체의 일부 필드(부분) 수정한다)
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
				value = "/{re_reply_number}",
				consumes = "application/json", 
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> modify(@RequestBody Re_replyVO re_replyVO, @PathVariable("re_reply_number") String re_reply_number){
			//								이미 폼(form)에 있는 값				수정할 번호
			
			re_replyVO.setRe_reply_number(re_reply_number); // 이미 가지고 있는 객체에 reply_number값을 넣음
			
			log.info("Re_replyController.modify()메서드 실행 / 수정할 대댓글번호 : " + re_reply_number);
			
			log.info("수정할 객체 : " + re_replyVO);
			
			return service.modify(re_replyVO) == 1 
					? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류;
		}
		
		// 대댓글 삭제
		@DeleteMapping(value="/{re_reply_number}", produces = {MediaType.TEXT_PLAIN_VALUE}) // JSON으로 나올 필요가 없음
		public ResponseEntity<String> remove(@PathVariable("re_reply_number") String re_reply_number){
			
			log.info("Re_replyController.remove()메서드 실행 / 삭제할 rno : " + re_reply_number);
			
			return service.remove(re_reply_number) == 1 
					? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
		}
		
		// 대댓글 리스트
		// http://localhost:80/re_replies/pages/댓글번호/1 -> xml
		// http://localhost:80/re_replies/pages/댓글번호/1.json -> json
		@GetMapping(value="/pages/{reply_number}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
		public ResponseEntity<Re_replyPageDTO> getList(@PathVariable("page") int page, @PathVariable("reply_number") String reply_number){
			
			log.info("Re_replyController.getList()메서드 실행");
			log.info("페이지 번호 : " + page);
			log.info("댓글 번호 : " + reply_number);
			
			Re_reply_critera re_reply_critera = new Re_reply_critera(page, 10); // 현재 페이지와 리스트 개수를 전달
			
			log.info("ReplyCritera : " + re_reply_critera);
			// {"re_replyCnt":2,"list":[{"re_reply_number":"01J72VZK158843V87WGEWGCFGE","reply_number":"01J72MS7VREZ157P5QWMR46VRB","content":"대댓글 빵야빵야","writer":"포스트맨","regidate":1725601910000},
			// {"re_reply_number":"2","reply_number":"01J72MS7VREZ157P5QWMR46VRB","content":"대댓글 빵야빵야","writer":"김우혁","regidate":1725601855000}]}
			
			return new ResponseEntity<>(service.getListPage(re_reply_critera, reply_number), HttpStatus.OK); // 200 정상
			
		}
		
		
	}
