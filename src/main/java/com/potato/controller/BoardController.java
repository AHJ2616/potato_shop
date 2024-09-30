package com.potato.controller;

import java.io.File;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;
import com.potato.domain.MemberVO;
import com.potato.service.BoardService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RequestMapping("/shop/*")
@Controller
@Log4j2
@AllArgsConstructor		// 모든 필드값으로 생성자 만듬
public class BoardController {

	// 필드
	private BoardService service;
	private MemberService m_service;
	
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList(1,13)); //초기 페이지
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("board_number") String board_number, Model model,HttpSession session) {
		service.updateViews(board_number);
		BoardVO board = service.get(board_number);
		model.addAttribute("board",board);
		MemberVO member = new MemberVO();
		CartVO cart = new CartVO();
		member.setMember_number(board.getWriter_number());
		cart.setLikes_board_number(board_number);
		model.addAttribute("member",m_service.profile(member)); //판매자의 넘버,id,닉네임,프사
		model.addAttribute("user",m_service.mypage2(member)); //판매자의 온도
		
		try {
			cart.setLikes_member_number(session.getAttribute("member_number").toString());
			if(cart!=null) {
			model.addAttribute("cart",service.get_cart(cart)); //카트 정보 가져오기
			}
		} catch (Exception e) {
			//
			e.printStackTrace();
		}
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("board_number") String board_number, Model model) {
		BoardVO board = service.get(board_number);
		model.addAttribute("board",board);
		MemberVO member = new MemberVO();
		member.setMember_number(board.getWriter_number());
		model.addAttribute("member",m_service.profile(member)); //넘버,id,닉네임,프사
		model.addAttribute("user",m_service.mypage2(member)); //온도
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute("board") BoardVO board, HttpServletRequest request) throws Exception {
		String fileName = null;
		MultipartFile file = board.getFileUpload();
		
		if(!file.isEmpty()) {
			String photo_name = file.getOriginalFilename();
			Ulid ulid = UlidCreator.getUlid();
			
			fileName = ulid+"_"+photo_name.substring(0, photo_name.lastIndexOf('.'))+".png";
			
			//파일 저장 경로
			String uploadPath = request.getServletContext().getRealPath("/resources/upload/");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
			file.transferTo(new File(uploadPath + fileName));
			
			board.setPhoto_name(fileName);
		}
		
		service.register(board);
		return "redirect:/shop/list";
	}
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute("board") BoardVO board, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
		String fileName = null;
		MultipartFile file = board.getFileUpload();
		if(!file.isEmpty()) {
			String photo_name = file.getOriginalFilename();
			Ulid ulid = UlidCreator.getUlid();
			
			fileName = ulid+"_"+photo_name.substring(0, photo_name.lastIndexOf('.'))+".png";
			String uploadPath = request.getServletContext().getRealPath("/resources/upload/");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
			file.transferTo(new File(uploadPath + fileName));
			
			board.setPhoto_name(fileName);
		}
		
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
	
	@GetMapping("/search")
	public void search(@RequestParam("title") String title, Model model) {
		model.addAttribute("search", service.search(title));
	}
}
