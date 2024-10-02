package com.potato.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.PayVO;
import com.potato.service.Pay_service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/pay")
@Log4j2
@AllArgsConstructor
public class Rest_pay_controller {
	
	@Autowired
    private Pay_service pay_service;

    // 충전 요청 처리
    @PostMapping(value = "/charge", produces = "application/json")
    public ResponseEntity<Map<String, String>> charge(@RequestBody PayVO payVO) {
    	Ulid ulid = UlidCreator.getUlid();
		payVO.setId(ulid.toString());
    	
        boolean isSuccess = pay_service.chargePay(payVO); // 충전 서비스 호출

        Map<String, String> response = new HashMap<>();
        if (isSuccess) {
            response.put("message", "충전이 완료되었습니다."); // 성공 메시지
        } else {
            response.put("message", "충전 실패."); // 실패 메시지
        }
        
        return ResponseEntity.ok(response); // JSON 형태로 응답
    }
    
    // 포인트를 머니로 전환
    @PostMapping(value = "/convertPoints", produces = "application/json")
    public ResponseEntity<String> convertPoints(@RequestParam String member_number, @RequestParam long point) {
        boolean isSuccess = pay_service.convertPointsToPay(member_number, point);
        if (isSuccess) {
            return ResponseEntity.ok("포인트가 페이로 전환되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("포인트 전환 실패.");
        }
    }
    
    //채팅방의 board_number를 이용해 해당 상품 가격 가져오기
    @PostMapping(value = "/getPrice", produces = "application/json")
    public ResponseEntity<Map<String, Object>> getPrice(@RequestBody Map<String, String> params) {
        String board_number = params.get("board_number"); // board_number 추출
        int price = pay_service.getProductPrice(board_number);

        Map<String, Object> response = new HashMap<>();
        response.put("price", price);

        return ResponseEntity.ok(response);
    }
}
