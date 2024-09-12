package com.potato.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.BoardVO;
import com.potato.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/shop/*")
@Log4j2
@AllArgsConstructor
public class Rest_BoardController {

	private BoardService service;

	@PostMapping(value ="/update",consumes="application/json", produces = {MediaType.APPLICATION_JSON_VALUE,
																		   MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<Void>updateValue(@RequestBody BoardVO board) { 
		
		 try {
			 service.updateValues(board);
			 return ResponseEntity.ok().build();
		 
		 } catch (Exception e) {
			 return ResponseEntity.status(500).build();
		 }

	}
	
}
