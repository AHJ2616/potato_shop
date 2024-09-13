package com.potato.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.potato.domain.Login_checkVO;
import com.potato.domain.MemberVO;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/rest/*")
@AllArgsConstructor
public class Rest_member_controller {
	
	private MemberService service;
	private ServletContext servletContext;
	
	@PostMapping(value="/login",produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> login(@RequestBody MemberVO memberVO, HttpSession session) {
	    MemberVO memberVO2 = service.login(memberVO);
	    if (memberVO2 != null&&memberVO2.getGrade()!=4) {
	    	Login_checkVO login_check = service.login_check2(memberVO2.getMember_number());
	    	 switch(login_check.getStatus()) {
		        case 0 : //로그 아웃인 상태일 때
	        // 로그인 성공 시 세션에 사용자 정보 저장
	        session.setAttribute("id", memberVO2.getId());
	        session.setAttribute("name", memberVO2.getName());
	        session.setAttribute("nickName", memberVO2.getNickName());
	        session.setAttribute("member_number", memberVO2.getMember_number());
	        session.setAttribute("grade", memberVO2.getGrade());
	        session.setAttribute("address", memberVO2.getAddress());
	        session.setAttribute("profile_image", memberVO2.getProfile_image());
	        service.login_check(memberVO2.getMember_number(), 1); //로그인 됨 상태
	        return ResponseEntity.ok(memberVO2);
	    	 case 1 : 
	    		 Map<String, String> errorResponse = new HashMap<>();
	 	        errorResponse.put("message", "이미 로그인 되어있습니다.");
	 	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
	    	 }
	    } else {
	    	   log.info("Login failed for user: " + memberVO.getId());
	        Map<String, String> errorResponse = new HashMap<>();
	        errorResponse.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
	    }
	    Map<String, String> errorResponse = new HashMap<>();
        errorResponse.put("message", "오류가 발생하였습니다.");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
	}
	
	@GetMapping(value="/logout",produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, String>> logout(HttpSession session) {
		service.login_check(session.getAttribute("member_number").toString(), 0); //로그아웃 됨 상태
        session.invalidate();
        Map<String, String> response = new HashMap<>();
        response.put("message", "로그아웃 되었습니다");
        response.put("redirect", "/home");
        return ResponseEntity.ok(response);
    }
	
	@PostMapping(value="/check_id")
	public ResponseEntity<String> check_id(@RequestBody MemberVO memberVO){
		
		 String id = service.check_id(memberVO.getId());
		 return ResponseEntity.ok(id);
	}
	
	@PostMapping(value="/modify_mypage", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> modify_mypage(@RequestBody MemberVO memberVO) {
	    Map<String, Object> response = new HashMap<>();
	    MemberVO memberVO2 = service.login(memberVO); // 로그인 시도

	    if (memberVO2 != null && memberVO2.getMember_number() != null) {
	        response.put("success", true);
	        response.put("member_number", memberVO2.getMember_number()); // member_number 추가
	    } else {
	        response.put("success", false);
	        response.put("error", "비밀번호가 올바르지 않습니다."); // 에러 메시지 추가
	    }
	    return ResponseEntity.ok(response);
	}
	
	@PostMapping(value="/upload")
	public ResponseEntity<String> handleFileUpload(MultipartHttpServletRequest request) {
	    MultipartFile file = request.getFile("file"); // "file"은 폼에서 지정한 name 속성
	    String member_number = request.getParameter("member_number");

	    if (file == null || file.isEmpty()) {
	        return ResponseEntity.badRequest().body("파일을 선택해 주세요.");
	    }

	    String fileName = file.getOriginalFilename(); // 파일명 저장
	    MemberVO memberVO = new MemberVO();
	    memberVO.setProfile_image(fileName); // DB에 저장할 파일명 설정
	    memberVO.setMember_number(member_number);

	    // ServletContext 초기화
	    final String UPLOAD_DIRECT = servletContext.getRealPath("/resources/upload/");

	    try {
	        // 파일 저장 경로 설정
	        Path path = Paths.get(UPLOAD_DIRECT, fileName);
	        Files.createDirectories(path.getParent()); // 디렉토리 생성
	        file.transferTo(path.toFile()); // 파일 저장
	        service.modify_profile(memberVO); // 프로필 수정 서비스 호출
	        return ResponseEntity.ok("파일 업로드 성공!");
	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패: " + e.getMessage());
	    }
	
}
	@PostMapping(value="/delete")
	public ResponseEntity<Map<String, String>> delete(@RequestBody MemberVO memberVO,HttpSession session){
		int result = service.delete(memberVO);
		if(result==1) {//삭제성공
			session.invalidate();
			Map<String, String> response = new HashMap<>();
	        response.put("message", "탈퇴시, 자동 로그아웃됩니다");
	        response.put("redirect", "/potato/home");
			 return ResponseEntity.ok(response);
		}
		else {
			 Map<String, String> errorResponse = new HashMap<>();
		        errorResponse.put("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
		        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(errorResponse);
		}
	}
}
