package com.potato.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import com.potato.mapper.Member_mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Session_listener implements HttpSessionListener {
	
	@Autowired
	private Member_mapper mapper;

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO 세션 생성시 호출되는 메서드
		 HttpSession session = se.getSession();
	     String member_number = (String) session.getAttribute("member_number");
	     int status = 1;
	     mapper.login_check(member_number, status);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO 세션 종료시 호출되는 메서드
		 HttpSession session = se.getSession();
	     String member_number = (String) session.getAttribute("member_number");
	     if(member_number != null) {
	     int status = 0;
	     mapper.login_check(member_number, status);
	}
	     }
	     
	

}
