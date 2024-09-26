package com.potato.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.MannerVO;
import com.potato.service.Manner_service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/manner") // API URL: http://localhost:80/manner/???
@Log4j2
@AllArgsConstructor // 생성자 주입
public class Manner_controller {
	
	@Autowired
    private Manner_service manner_service;
    
	// http://localhost:80/manner/items/{member_number}
	@GetMapping(value = "/items/{member_number}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<MannerVO>> getMannerItems(@PathVariable("member_number") String memberNumber) {
	    List<MannerVO> mannerList = manner_service.getAllMannerItems(memberNumber);
	    if (mannerList == null || mannerList.isEmpty()) {
	        return ResponseEntity.noContent().build();
	    }
	    return ResponseEntity.ok(mannerList);
	}
    
    // 칭찬하기 데이터 전송
	@PostMapping("/submit")
    public ResponseEntity<String> submitManner(@RequestParam int manner_number, @RequestParam String member_number) {
        boolean isSuccess = manner_service.incrementMannerCount(manner_number, member_number);
        
        if (isSuccess) {
            System.out.println("칭찬이 등록되었습니다: " + manner_number + ", " + member_number);
            return ResponseEntity.ok("칭찬이 등록되었습니다.");
        } else {
            System.err.println("칭찬 등록 실패: " + manner_number + ", " + member_number);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("칭찬 등록에 실패했습니다.");
        }
    }
}
