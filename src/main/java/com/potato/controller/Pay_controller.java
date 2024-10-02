package com.potato.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import com.potato.service.MemberService;
import com.potato.service.Pay_service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/pay/*")
@Log4j2
@AllArgsConstructor
public class Pay_controller {
	
	
	@Autowired
    private MemberService memberService;
	
	// 회원의 페이정보
	@GetMapping("/pay_info")
    public String getPayAndPointInfo(HttpSession session, Model model) {
        // 세션에서 회원 번호 가져오기
        String member_number = (String) session.getAttribute("member_number");

        // 회원 번호가 존재한다고 가정하고 진행
        long pay = memberService.getPay(member_number);
        long point = memberService.getPoint(member_number);

        model.addAttribute("member_number", member_number);
        model.addAttribute("pay", pay);
        model.addAttribute("point", point);

        return "pay/pay_info"; // pay 폴더의 pay_info.jsp를 반환
    }
	
	// 충전 페이지
    @GetMapping("/pay_charge")
    public String showChargePage(Model model, HttpSession session) {
    	// 현재 세션에 로그인한 회원 정보 가져오기
        String member_number = (String) session.getAttribute("member_number");
        
        // 현재 회원의 pay와 point 정보를 모델에 추가
        long pay = memberService.getPay(member_number);
        long point = memberService.getPoint(member_number);
        
        model.addAttribute("member_number", member_number);
        model.addAttribute("pay", pay);
        model.addAttribute("point", point);
        
        return "pay/pay_charge"; // pay_charge.jsp를 반환
    }
    
    // 인증 페이지
    @GetMapping("/verification")
    public String showVerificationPage() {
        return "pay/verification"; // verification.jsp를 반환
    }
    
    // 결제 페이지
    @GetMapping("/payment_options")
    public String showPaymentPopup() {
        return "pay/payment_options"; // payment_options.jsp를 반환
    }
}
