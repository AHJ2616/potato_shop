package com.potato.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.MemberVO;
import com.potato.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/potato/api")
@AllArgsConstructor
public class RestAdminController {
	
	 private AdminService service;

	    
	    @GetMapping("/updateMemberStatus")
	    public ResponseEntity<MemberVO> update(@RequestParam("id") String id) {
	        try {
	            MemberVO member = service.getMemberList(id);
	            if (member != null) {
	                return ResponseEntity.ok(member);  // 회원 정보가 있을 경우 200 OK 응답
	            } else {
	                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);  // 회원이 없을 경우 404 NOT FOUND 응답
	            }
	        } catch (Exception e) {
	            log.error("회원 상세 정보 조회 중 오류 발생", e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);  // 오류 발생 시 500 INTERNAL SERVER ERROR 응답
	        }
	    }

}
