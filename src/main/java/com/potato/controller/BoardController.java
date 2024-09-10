package com.potato.controller;

import org.springframework.http.ResponseEntity;
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
		
		log.info("컨트롤러 리스트 메서드 실행");
		model.addAttribute("list", service.getList());
		
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("board_number") Long board_number, Model model) {
		log.info("컨트롤러 get메서드 실행");
		model.addAttribute("board", service.get(board_number));
	}
	
	
	@GetMapping("/register")
	public void register() {
		log.info("컨트롤러 레지스터 겟 메서드 실행");
	}
	
	@PostMapping("/register") //  http://localhost:80/shop/register
	public String register(BoardVO board, RedirectAttributes rttr) {
		// RedirectAttributes rttr -> 1회성을 같는 값을 제공 -> addFlashAttribute("이름","값");
		
		log.info("BoardController.register post메서드 실행");
		service.register(board); // 프론트에서 form 값이 객체로 넘어옴
		
		rttr.addFlashAttribute("result", board.getBoard_number()); // 객체에 있는 bno값을 1회성으로 가지고 있음(model영역)
		
		return "redirect:/shop/list"; // response.sendRedirect()
		// 등록후에는 list페이지로 보냄
		
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		
		log.info("보드컨트롤러 modify 메서드 실행");
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/shop/list";
	}
	
	@PostMapping("/remove") 	// 번호를 받아 delete 쿼리를 실행
	public String remove(@RequestParam("board_number") Long board_number, RedirectAttributes rttr){
		
		log.info("BoardController.remove메서드 실행");
		if (service.remove(board_number)) { // service.remove의 리턴 타입이 boolean
			rttr.addFlashAttribute("result", "success"); // 수정 성공시 success 메시지를 보냄
		}
		
		return "redirect:/shop/list";  // 결론 http://localhost:80/shop/list
	}
	
	@PostMapping("/like")
    public ResponseEntity<?> likes(@RequestParam Long boardNumber) {
        service.modifyLikes(boardNumber);
        return ResponseEntity.ok().build();
    }
	
	@PostMapping("/interest")
    public ResponseEntity<?> Interest(@RequestParam Long boardNumber) {
        service.modifyInterest(boardNumber);
        return ResponseEntity.ok().build();
    }
}
