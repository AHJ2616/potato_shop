package com.potato.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	

	// 회원정보 검색
	@GetMapping("/memberList")
	public String getMemberList(@RequestParam("id") String id, Model model, RedirectAttributes redirectAttributes) {
		MemberVO member = service.getMemberList(id);

		if (member == null) {
			log.info("회원아이디 : " + id);
			redirectAttributes.addFlashAttribute("message", "회원이 없습니다.");
			return "redirect:/admin/home";
		}

		log.info("검색된 회원 ID: " + id);
		model.addAttribute("member", member);
		return "admin/memberList";
	}
	
	

	// 블랙리스트 해제
	@PostMapping("/blacklist")
	public String updateBlack(MemberVO member) {
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
		member.setGrade(report.getStatus()); // 2 : 경고회원 4: 블랙리스트
		service.updateBlack(member);
		return "redirect:/admin/home";
	}


	// String -> Date 변환 처리
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}


	// 관리자 공지 글쓰기
	@GetMapping("/notiWrite")
	public String notiWrite(Model model) {
		return "admin/notiWrite"; // notiWrite.jsp로 이동
	}

	// 관리자 공지 글쓰기
	@GetMapping("/notiView")
	public String notiView(Model model) {
		return "admin/notiView"; // notiWrite.jsp로 이동
	}


}
