package com.potato.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.service.BoardService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/tests/*")
@Controller
@Log4j2
@AllArgsConstructor		
public class Test_contorller {

	@GetMapping("/t_header")
	public void t_header() {
		
	}
}
