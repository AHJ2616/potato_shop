package com.potato.controller;


import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.AlarmsVO;
import com.potato.domain.BoardVO;
import com.potato.domain.Login_checkVO;
import com.potato.domain.MemberVO;
import com.potato.domain.ReportVO;
import com.potato.service.AlarmService;
import com.potato.service.BoardService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
@RequestMapping("/potato/*") // http:localhost:80/경로/*
@AllArgsConstructor
public class Member_controller {
	
	private MemberService service;
	private AlarmService a_service;
	
	//get으로 들어온 경우, form작성할 수 있게 jsp파일 띄우기
	@GetMapping({"/register","/find_id","/find_pass","/login"})
	public void empty_form() {
	}
	
	//회원가입 form에 작성된 데이터 DB에 저장후 메인페이지로 넘기기
	@PostMapping("/register")
	public String register(MemberVO memberVO,RedirectAttributes rttr) {
		Ulid ulid = UlidCreator.getUlid();
		String member_number =ulid.toString();
		memberVO.setMember_number(member_number);
		int result = service.register(memberVO);
		service.register2(memberVO);
		service.register3(memberVO);
		if(result==1) {
		rttr.addFlashAttribute("message", memberVO.getNickName()+"님 회원가입을 축하드립니다");
		return "redirect:/home";}
		if(result==0) {
		rttr.addFlashAttribute("errorMessage", "회원가입에 실패했습니다. 다시 시도해주세요.");
	    return "redirect:/register";
		}
		return "redirect:/home";
	}
	
	//회원정보 보기
	//톰캣 세션영역에 저장된 member_number를 이용하여 userVO 조회하여 model에 저장
	//부적절한 방식으로 들어온 경우 home으로 보내기!
	@GetMapping({"/mypage","/modify_mypage"})
	public void mypage(Model model,HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_number((String)session.getAttribute("member_number"));
		model.addAttribute("memberVO",service.mypage(memberVO));
		model.addAttribute("userVO",service.mypage2(memberVO));
	}
	
	//회원정보 수정
	//수정되면 자동 로그아웃 및 홈으로 돌아가기
	@PostMapping("/modify_mypage")
	public String modify_mypage(MemberVO memverVO,HttpSession session,RedirectAttributes rttr) {
		int result = service.modify_mypage(memverVO);
		if(result==1) {
			session.invalidate();//세션 삭제
			rttr.addFlashAttribute("success", "정보수정이 되었습니다. 자동으로 로그아웃 됩니다.");
			return "redirect:/home";
		}
		else {
			rttr.addFlashAttribute("errorMessage", "정보수정에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/potato/modify_mypage";
	}
	}
	
	//나의 활동내역 보기
	//톰캣 세션영역에 저장된 member_number,id를 이용하여 자료조회 후 model에 저장
	@GetMapping("/mylist")
	public void mylist(@RequestParam("number")String member_number,@RequestParam("id")String id,Model model,HttpSession session) {
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setMember_number(member_number);
		model.addAttribute("check",id);
		
		
		model.addAttribute("replyVO", service.mylist1(memberVO));
		model.addAttribute("re_replyVO", service.mylist2(memberVO));
		model.addAttribute("boardVO", service.mylist3(memberVO));
		model.addAttribute("reportVO", service.mylist4(memberVO));
		
	}
	
	
	//좋아요 관심 리스트 보기
	//톰캣 세션영역에 저장된 member_number로 자료 조회
	@GetMapping("/likes_list")
	public void likes_list(Model model,HttpSession session) {
		String member_number = session.getAttribute("member_number").toString();
		model.addAttribute("result",service.get_likes_list(member_number));
	}
	
	@PostMapping("/report")
	public void report(ReportVO report2,Model model) {
		model.addAttribute("report",report2);
	}
	
	@PostMapping("/do_report")
	public String do_report(ReportVO report) {
	Ulid ulid = UlidCreator.getUlid();
	String repot_number = ulid.toString();
	report.setReport_number(repot_number);
	service.report(report);
	return "redirect:/shop/list";
	}
	
	@GetMapping("/review")
    public void review(@RequestParam("member_number") String member_number, Model model) {
        if (member_number != null) {
        	MemberVO member2 = new MemberVO();
        	member2.setMember_number(member_number);
            MemberVO member = service.profile(member2);
            model.addAttribute("member", member);
    		model.addAttribute("user",service.mypage2(member)); //판매자의 온도
        }
        
    }
	
	@PostMapping("/login")
	public String do_login(MemberVO member,HttpSession session) {
		MemberVO member2 = service.login(member);
		if(member2 !=null && member2.getGrade()!=4) {
			Login_checkVO login_check = service.login_check2(member2.getMember_number());
			switch(login_check.getStatus()) {
			case 0 : 
				session.setAttribute("id", member2.getId());
		        session.setAttribute("name", member2.getName());
		        session.setAttribute("nickName", member2.getNickName());
		        session.setAttribute("member_number", member2.getMember_number());
		        session.setAttribute("grade", member2.getGrade());
		        session.setAttribute("address", member2.getAddress());
		        session.setAttribute("profile_image", member2.getProfile_image());
		        service.login_check(member2.getMember_number(), 1); //로그인 됨 상태
		        AlarmsVO alarms = new AlarmsVO();
		        alarms.setMember_number(member2.getMember_number());
		        session.setAttribute("alarms", a_service.get_alarms(alarms));
		        return "/home";
			case 1 :
				return "/potato/login";
			}
		}
		return "/potato/login";
	}
	
	@PostMapping("/do_find_id")
	public void find_id(MemberVO member,Model model) {
		MemberVO member2 = new MemberVO();
		
		try {
			member2 = service.find_id(member);
			model.addAttribute("result",member2);
		} catch (Exception e) {
		}
	}
	
	@PostMapping("/do_find_pass")
	public void find_pass(MemberVO member,Model model) {
		Ulid ulid = UlidCreator.getUlid();
		String new_pass = ulid.toString().substring(0,6);
		member.setPass(new_pass);
		int result = service.find_pass(member);
		switch(result) {
		case 1 : model.addAttribute("result",new_pass);
		break;
		case 0 : model.addAttribute("result","오류");
		break;
		}
	}
	
}//class end
