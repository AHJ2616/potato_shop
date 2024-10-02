package com.potato.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.potato.domain.ComentsVO;
import com.potato.domain.ReportVO;
import com.potato.domain.MemberVO;
import com.potato.domain.NotificationVO;
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
		if (member_number.equals("admin")) {
	        // 신고 내역 최신 5개
	        List<ReportVO> reportList = service.readReport();
	        if (reportList.size() > 5) {
	            reportList = reportList.subList(0, 5);
	        }
	        model.addAttribute("reportList", reportList);
	        
	        // 블랙리스트 최신 5개
	        List<MemberVO> blacklist = service.viewBlack();
	        if (blacklist.size() > 5) {
	            blacklist = blacklist.subList(0, 5);
	        }
	        model.addAttribute("black", blacklist);
	        
	        // 고객의 편지 최신 5개
	        List<ComentsVO> coments = etc_service.get_coments();
	        if (coments.size() > 5) {
	            coments = coments.subList(0, 5);
	        }
	        model.addAttribute("coments", coments);
	        
	        // 관리자 공지 최신 5개
	        List<NotificationVO> notifications = service.notification();
	        if (notifications.size() > 5) {
	            notifications = notifications.subList(0, 5);
	        }
	        model.addAttribute("noti", notifications);
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

	// 관리자 공지 글쓰기 페이지
	@GetMapping("/notiWrite")
	public String notiWrite(@RequestParam("member_number") String member_number, HttpSession session,Model model) {
		session.setAttribute("member_number", member_number);
		return "admin/notiWrite"; // notiWrite.jsp로 이동
	}

	// 글쓰기
	@PostMapping("/notiWrite/registration")
	public String registration(@ModelAttribute NotificationVO noti, HttpSession session) {
	    String member_number = (String) session.getAttribute("member_number");
	    noti.setWriter(member_number); // writer에 세션에서 가져온 값을 설정
	    
	    service.insertBoard(noti);
	    return "redirect:/admin/notiView?member_number=" + member_number;
	}
	
	// 관리자 공지 글보기 페이지
	@GetMapping("/notiView")
	public String notiView(@RequestParam("member_number") String member_number, Model model, HttpSession session) {
		session.setAttribute("member_number", member_number);
	    List<NotificationVO> notice = service.notification(); // 서비스에서 리스트를 반환하도록 해야 함
	    model.addAttribute("notice", notice);	
		 
		return "admin/notiView"; // notiWrite.jsp로 이동
	}
	
	// 관리자 공지 글보기 상세페이지
		@GetMapping("/notice")
		public String notice(@RequestParam("notice_number") int notice_number, Model model) {
			    
			    // 필요한 작업 수행
	     NotificationVO notice = service.notice(notice_number); // 서비스에서 리스트를 반환하도록 해야 함
	     model.addAttribute("notice", notice);

			 
			return "admin/notice"; // notiWrite.jsp로 이동
		}

		// 공지 글 삭제
		@PostMapping("/deleteNotice")
		public String deleteNotice(@ModelAttribute  NotificationVO notice,HttpSession session) {
			String member_number = session.getAttribute("member_number").toString();
			int notice_number = notice.getNotice_number();
			service.deleteReport(notice_number);
			return "redirect:/admin/notiView?member_number=" + member_number; 
		}
}
