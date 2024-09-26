package com.potato.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.BoardVO;
import com.potato.service.Sell_list_service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/sell_list") // API URL: http://localhost:80/sell_list/???
@Log4j2
@AllArgsConstructor // 생성자 주입
public class Rest_sell_list_controller {
	
	@Autowired
    private Sell_list_service sell_list_service;

	// http://localhost:80/sell_list/member/{member_number}
    @GetMapping(value="/member/{member_number}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<BoardVO>> getBoardsByMember(@PathVariable("member_number") String member_number) {
    	
    	log.info("member_number : {}", member_number);
        
        List<BoardVO> sell_lists = sell_list_service.getBoardsForMember(member_number);
        
        return new ResponseEntity<>(sell_lists, HttpStatus.OK);
    }
}
