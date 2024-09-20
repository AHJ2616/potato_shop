package com.potato.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.potato.domain.BoardVO;
import com.potato.domain.ReportVO;
import com.potato.domain.MemberVO;
import com.potato.service.AdminService;
import com.potato.service.EtcService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/admin/*")
@AllArgsConstructor
public class PotatoController {
	
	private AdminService service;
	private EtcService etc_service;

	// 관리자 페이지
	@GetMapping("/home")
	public void admin(Model model,HttpSession session) {
		String member_number = session.getAttribute("member_number").toString();
		if(member_number.equals("admin")) {
		model.addAttribute("reportList", service.readReport());
		model.addAttribute("black", service.viewBlack());
		model.addAttribute("coments",etc_service.get_coments());
		}
		
	}

	/*
	 * // 회원 정보 검색
	 * 
	 * @GetMapping("/admin/memberList") public String
	 * getMemberList(@RequestParam("id") String id, Model model, RedirectAttributes
	 * redirectAttributes) { MemberVO member = service.getMemberList(id);
	 * 
	 * 
	 * if(member == null) { log.info("회원아이디 : " + id);
	 * redirectAttributes.addFlashAttribute("message", "회원이 없습니다."); return
	 * "redirect:/admin/memberList"; } log.info("검색된 회원 ID: " + id); // 로그 추가
	 * model.addAttribute("member", member); return "potato/memberList"; // JSP 파일
	 * 경로 수정 }
	 */

	// 블랙리스트 등록
	@PostMapping("/blacklist")
	public String updateBlack(@RequestBody MemberVO member) {
		service.updateBlack(member);
		return "redirect:/admin/home"; // 블랙리스트 등록 후 회원 목록으로 리다이렉트
	}

	// 공지 추가
	@PostMapping("/board")
	public String insertBoard(@ModelAttribute BoardVO board) {
		service.insertBoard(board);
		return "redirect:/admin/boardList"; // 공지 추가 후 게시판 목록으로 리다이렉트
	}



	

	// 신고 내역 확인
	@GetMapping("/report")
	public void readReport(@RequestParam("report_number") String report_number,Model model,HttpSession session) {
		String member_number = session.getAttribute("member_number").toString();
		if(member_number.equals("admin")) {
			model.addAttribute("reportVO",service.get_report(report_number));
		}
	}

	//신고 내용 처리
	@PostMapping("/report_do")
	public String report_do(@ModelAttribute ReportVO report,Model model) {
		service.updateReport(report);
		MemberVO member= new MemberVO();
		member.setMember_number(report.getDefendant());
		member.setGrade(report.getStatus()); // 0 : 일반회원 4: 블랙리스트
		service.updateBlack(member);
		return "redirect:/admin/home";
	}

	// 회원 상세 정보 조회 (AJAX)
	@GetMapping("/memberDetail")
	@ResponseBody
	public MemberVO memberDetail(@RequestParam("id") String id) {
		return service.getMemberList(id);
	}


}
