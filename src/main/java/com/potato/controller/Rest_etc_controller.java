package com.potato.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.ComentsVO;
import com.potato.service.EtcService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/rest/*")
@AllArgsConstructor
public class Rest_etc_controller {
	
	EtcService service;
	
	@PostMapping(value="/coments", consumes=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> coments(@RequestBody ComentsVO coments,HttpServletRequest request) {
		String ip_address = request.getHeader("X-Forwarded-For");
		if (ip_address == null) {
			ip_address = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip_address == null) {
	    	ip_address = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip_address == null) {
	    	ip_address = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip_address == null) {
	    	ip_address = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip_address == null) {
	    	ip_address = request.getRemoteAddr();
	    }
	        coments.setIp_address(ip_address);
		int result = service.send_coments(coments);
		switch(result) {
		case 1 :
			return ResponseEntity.ok("소중한 의견 감사합니다");
		case 0 :
			 Map<String, String> response = new HashMap<>();
		        response.put("message", "오류가 발생하였습니다.");
		        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
		}
		return ResponseEntity.ok("소중한 의견 감사합니다");
	}

}//class end
