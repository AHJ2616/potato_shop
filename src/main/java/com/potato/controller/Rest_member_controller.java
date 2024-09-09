package com.potato.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.MemberVO;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import oracle.jdbc.proxy.annotation.Post;

@RestController
@Log4j2
@RequestMapping("/rest/*")
@AllArgsConstructor
public class Rest_member_controller {
	
	private MemberService service;

	@PostMapping(value="/login",produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> login(@RequestBody MemberVO memberVO, HttpSession session) {
	    MemberVO memberVO2 = service.login(memberVO);
	    if (memberVO2 != null&&memberVO2.getGrade()!=4) {
	        // 로그인 성공 시 세션에 사용자 정보 저장
	        session.setAttribute("id", memberVO2.getId());
	        session.setAttribute("name", memberVO2.getName());
	        session.setAttribute("nickName", memberVO2.getNickName());
	        session.setAttribute("member_number", memberVO2.getMember_number());
	        session.setAttribute("grade", memberVO2.getGrade());
	        log.info("Login successful for user: " + memberVO2.getId());
	        return ResponseEntity.ok(memberVO2);
	    } else {
	    	   log.info("Login failed for user: " + memberVO.getId());
	        Map<String, String> errorResponse = new HashMap<>();
	        errorResponse.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
	    }
	}
	
	@GetMapping(value="/logout",produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, String>> logout(HttpSession session) {
        session.invalidate();
        Map<String, String> response = new HashMap<>();
        response.put("message", "로그아웃 되었습니다");
        response.put("redirect", "/potato/home");
        return ResponseEntity.ok(response);
    }
	
	@PostMapping(value="/check_id")
	public ResponseEntity<String> check_id(@RequestBody MemberVO memberVO){
		
		 String id = service.check_id(memberVO.getId());
		 return ResponseEntity.ok(id);
	}
}
