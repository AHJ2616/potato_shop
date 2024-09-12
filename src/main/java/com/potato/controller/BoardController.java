package com.potato.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.potato.domain.BoardVO;
import com.potato.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/shop/*")
@Controller
@Log4j2
@AllArgsConstructor		// 모든 필드값으로 생성자 만듬
public class BoardController {

	// 필드
	private BoardService service;
	
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("board_number") String board_number, Model model) {
		model.addAttribute("board", service.get(board_number));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		service.register(board);
		rttr.addFlashAttribute("result", board.getBoard_number()); // 객체에 있는 bno값을 1회성으로 가지고 있음(model영역)
		return "redirect:/shop/list";
		// 등록후에는 list페이지로 보냄
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/shop/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("board_number") String board_number, RedirectAttributes rttr){
		if (service.remove(board_number)) {
			rttr.addFlashAttribute("result", "success"); // 수정 성공시 success 메시지를 보냄
		}
		return "redirect:/shop/list";
	}
}
