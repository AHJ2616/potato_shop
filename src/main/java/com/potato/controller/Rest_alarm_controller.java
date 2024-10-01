package com.potato.controller;





import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.potato.domain.AlarmsVO;
import com.potato.domain.Chat_roomVO;
import com.potato.service.AlarmService;
import com.potato.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/alarm/*")
@AllArgsConstructor
public class Rest_alarm_controller {
	
	private AlarmService service;
	private ChatService c_service;
	
	
	@PostMapping(value="/delete")
	public void alarm_delete(@RequestBody AlarmsVO alarm,HttpSession session) {
		service.delete_alarm(alarm);
		session.setAttribute("alarms",service.get_alarms(alarm));
	}
	
	@PostMapping(value="/delete_all")
	public void alarm_delete_all(@RequestBody AlarmsVO alarm,HttpSession session) {
		service.delete_alarm2(alarm);
		session.setAttribute("alarms",service.get_alarms(alarm));
	}

	@PostMapping(value="/func")
	public String alaram_func(@RequestBody AlarmsVO alarm,HttpSession session) {
		System.out.println("리퀘스트바디 확인 : "+alarm);
		int x = service.status_alarm(alarm);
		session.setAttribute("alarms",service.get_alarms(alarm));
		switch(alarm.getTarget_type()) {
		case "chat" :
			String chat_number = alarm.getTarget_key();
			Chat_roomVO chat_room = c_service.find_chat(chat_number);
			String reciever=chat_room.getCeller_number();
			String board_number=chat_room.getBoard_number();
			String chat_url = "/potato/chat?reciever="+reciever+"&board_number="+board_number;
			 return chat_url;
		case "review" :	
			String review_url = "/potato/review?member_number="+alarm.getTarget_key();
			 return review_url;
		}
		 return null;
	}
	
}
