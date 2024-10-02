package com.potato.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.service.EtcService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class Home_controller {
	
	MemberService service;
	EtcService e_service;
	
	@GetMapping("/home")
	public void home() {
		
	}
	
	@GetMapping("/qna")
	public void qna(Model model) {
		model.addAttribute("qna",e_service.read_qna());
	}

}
