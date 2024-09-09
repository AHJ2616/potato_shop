package com.potato.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.potato.domain.MemberVO;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/potato/*") // http:localhost:80/경로/*
@AllArgsConstructor
public class Member_controller {
	
	private MemberService service;
	
	//get으로 들어온 경우, form작성할 수 있게 jsp파일 띄우기
	@GetMapping({"/login","/home","/register"})
	public void get_form() {
	}
	
	/*
	 * //로그인 form에 작성된 데이터 DB에서 조회후 세션에 저장하여 메인페이지로 넘기기
	 * 
	 * @PostMapping("/login") public String login(MemberVO memberVO,HttpSession
	 * session,RedirectAttributes rttr) { MemberVO memberVO2 = new MemberVO();
	 * memberVO2 = service.login(memberVO); if(memberVO2.getMember_number()!=null) {
	 * session.setAttribute("id", memberVO2.getId());
	 * session.setAttribute("member_number", memberVO2.getMember_number());
	 * session.setAttribute("name", memberVO2.getName());
	 * session.setAttribute("nickName", memberVO2.getNickName()); return
	 * "redirect:/home"; } else { rttr.addFlashAttribute("errorMessage",
	 * "로그인에 실패했습니다. 다시 시도해주세요."); return "redirect:/login"; } }
	 */
	
	//회원가입 form에 작성된 데이터 DB에 저장후 메인페이지로 넘기기
	@PostMapping("/register")
	public String register(MemberVO memberVO,RedirectAttributes rttr) {
		int result = service.register(memberVO);
		if(result==1) {
		return "redirect:/potato/home";}
		if(result==0) {
		rttr.addFlashAttribute("errorMessage", "회원가입에 실패했습니다. 다시 시도해주세요.");
	    return "redirect:/register";
		}
		return "redirect:/potato/home";
	}
	
	//회원정보 보기
	//톰캣 세션영역에 저장된 member_number를 이용하여 userVO 조회하여 model에 저장
	@GetMapping({"/mypage","/modify_mypage"})
	public void mypage(Model model,HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_number((String)session.getAttribute("member_number"));
		model.addAttribute("userVO",service.mypage(memberVO));
	}
	
	//회원정보 수정
	//수정되면 자동 로그아웃 및 홈으로 돌아가기
	@PostMapping("/modify_mypage")
	public String modify_mypage(MemberVO memverVO,HttpSession session,RedirectAttributes rttr) {
		int result = service.modify_mypage(memverVO);
		if(result==1) {
			session.invalidate();//세션 삭제
			rttr.addFlashAttribute("success", "정보수정이 되었습니다. 자동으로 로그아웃 됩니다.");
			return "/home";
		}
		else {
			rttr.addFlashAttribute("errorMessage", "정보수정에 실패했습니다. 다시 시도해주세요.");
		return "redirect:/modify_mypage";}
	}
	
	//나의 활동내역 보기
	//톰캣 세션영역에 저장된 member_number,id를 이용하여 자료조회 후 model에 저장
	@GetMapping("/mylist")
	public void mylist(Model model,HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setId((String) session.getAttribute("id"));
		memberVO.setMember_number((String)session.getAttribute("member_number"));
		
		model.addAttribute("replyVO", service.mylist1(memberVO));
		model.addAttribute("re_replyVO", service.mylist2(memberVO));
		model.addAttribute("boardVO", service.mylist3(memberVO));
		model.addAttribute("reportVO", service.mylist4(memberVO));
		
	}
}
