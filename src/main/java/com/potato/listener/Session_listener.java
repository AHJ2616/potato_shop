package com.potato.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import com.potato.service.MemberService;

import lombok.extern.log4j.Log4j2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Log4j2
@Component
public class Session_listener implements HttpSessionListener {
	
	@Autowired
	private MemberService service;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO 세션 생성시 호출되는 메서드
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO 세션 종료시 호출되는 메서드
		 HttpSession session = se.getSession();
	     String member_number = (String) session.getAttribute("member_number");
	     int status = 0;
	     service.login_check(member_number, status);
	     System.out.println("세션종료");
	     System.out.println(member_number);
	     }
	     
	

}
