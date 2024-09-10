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
import com.potato.domain.ReplyVO;
import com.potato.domain.Reply_critera;
import com.potato.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController // Rest로 응답 함!!! -> view-jsp가 아닌 json, xml로 나옴
@RequestMapping("/replies") // http://localhost:80/replies/???
@Log4j2
@AllArgsConstructor // new ReplyController(ReplyService);
public class Reply_controller {

	private ReplyService service;
	
	
	// 댓글 추가
	// http://localhost:80/replies/new (json으로 입력 되면 객체로 저장됨)
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})// 입력값은 json 으로
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO){
		// 리턴은 200 | 500 으로 처리 된다.
		
		Ulid ulid = UlidCreator.getUlid();
		replyVO.setReply_number(ulid.toString());
		
		log.info("ReplyVO 객체 입력 값 : " + replyVO); // 파라미터로 넘어온 값 출력 테스트
		
		int insertCount = service.register(replyVO); // sql 처리 후에 결과값이 1 | 0 이 나옴
		
		log.info("서비스+매퍼 처리 결과 : " + insertCount);
		
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
								: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
		// 삼항 연산자 처리
	}
	
	// 댓글 보기
	// http://localhost:80/replies/4
	@GetMapping(value="/{reply_number}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("reply_number") String reply_number){
		
		log.info("ReplyController.get()메서드 실행 / 찾을 reply_number : " + reply_number);
		
		return new ResponseEntity<>(service.get(reply_number), HttpStatus.OK); // 200 정상
	}
	
	// 댓글 수정
	// http://localhost:80/replies/3
	// RequestMethod.PUT -> @PutMapping (객체 전체 필드를 수정한다)
	// RequestMethod.PATCH -> @PatchMapping (객체의 일부 필드(부분) 수정한다)
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value = "/{reply_number}",
			consumes = "application/json", 
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO replyVO, @PathVariable("reply_number") String reply_number){
		//								이미 폼(form)에 있는 값				수정할 번호
		
		replyVO.setReply_number(reply_number); // 이미 가지고 있는 객체에 reply_number값을 넣음
		
		log.info("ReplyController.modify()메서드 실행 / 수정할 rno : " + reply_number);
		
		log.info("수정할 객체 : " + replyVO);
		
		return service.modify(replyVO) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류;
	}
	
	// 댓글 삭제
	@DeleteMapping(value="/{reply_number}", produces = {MediaType.TEXT_PLAIN_VALUE}) // JSON으로 나올 필요가 없음
	public ResponseEntity<String> remove(@PathVariable("reply_number") String reply_number){
		
		log.info("ReplyController.remove()메서드 실행 / 삭제할 rno : " + reply_number);
		
		return service.remove(reply_number) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK) // 200 정상
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 500 서버 오류
	}
	
	// http://localhost:80/replies/pages/11/1 -> xml
	// http://localhost:80/replies/pages/11/1.json -> json
	@GetMapping(value="/pages/{id}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("id") String id){
		
		log.info("ReplyController.getList()메서드 실행");
		log.info("페이지 번호 : " + page);
		log.info("판매자 번호 : " + id);
		
		Reply_critera reCritera = new Reply_critera(page, 10); // 현재 페이지와 리스트 개수를 전달
		
		log.info("ReplyCritera : " + reCritera);
		// [{"reply_number":"1","id":"kwh","content":"댓글 수정합니다.","writer":"김우혁","regidate":1725419078000},
		// {"reply_number":"01J6XFYHD2DEB4QH046S85TWNW","id":"kwh","content":"컨트롤러 댓글 테스트1","writer":"김우혁","regidate":1725419177000}]
		
		return new ResponseEntity<>(service.getList(reCritera, id), HttpStatus.OK); // 200 정상
		
	}
}
