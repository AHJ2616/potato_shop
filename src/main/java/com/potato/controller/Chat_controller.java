package com.potato.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.ChatVO;
import com.potato.domain.Chat_roomVO;
import com.potato.domain.MemberVO;
import com.potato.service.ChatService;
import com.potato.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/potato/*") // http:localhost:80/경로/*
@AllArgsConstructor
public class Chat_controller {
	
	private ChatService service;
	private MemberService m_service;
	
	@GetMapping("/chat")
	public void list(@RequestParam("reciever")String reciever,HttpSession session,Model model) {
		Chat_roomVO chat_room = new Chat_roomVO(); //채팅방 번호 저장용
		chat_room.setPerson_a(session.getAttribute("member_number").toString());
		chat_room.setPerson_b(reciever);
		MemberVO memberVO = new MemberVO(); //상대방 데이터 저장용
		memberVO.setMember_number(reciever);
		memberVO = m_service.profile(memberVO);//상대방 데이터 저장
		Ulid ulid = UlidCreator.getUlid();
		chat_room.setChat_number(ulid.toString());
		ChatVO chatVO = new ChatVO(); 
		try {
		chatVO = service.get_room(chat_room); //채팅방 번호 유무확인
			if(chatVO == null || chatVO.getChat_number() == null) {
					service.add_room(chat_room);
					chatVO = service.get_room(chat_room);
			}
			} catch (Exception e) {
		
			} 
		model.addAttribute("chatVO",chatVO);
		model.addAttribute("memberVO",memberVO);
	}

	@GetMapping("/chat_list")
	public void chat_list(Model model,HttpSession session) {
		MemberVO member = new MemberVO(); // 세션 나의 member_number 저장용
		MemberVO member2 = new MemberVO(); // 불러올 상대방 프로필 저장용

		member.setMember_number(session.getAttribute("member_number").toString());
		List<Chat_roomVO> list1 = new ArrayList<Chat_roomVO>(); //chat리스트 불러오기
		List<MemberVO> list2 = new ArrayList<MemberVO>(); //상대방 프로필 리스트 불러오기
		list1 = service.room_list(member);
		for(Chat_roomVO each_lists : list1) {
		if(each_lists.getPerson_a().equals(member.getMember_number())) {
		member2.setMember_number(each_lists.getPerson_b());
		}
		else {member2.setMember_number(each_lists.getPerson_a());
		}
		member2 = m_service.profile(member2);
		list2.add(member2);
			}
		model.addAttribute("memberVO",list2);
	}
	
}
