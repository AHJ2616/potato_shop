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
import com.potato.domain.Chat_profileVO;
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
	public void list(@RequestParam("reciever")String reciever,@RequestParam("board_number")String board_number,HttpSession session,Model model) {
		String buyer_number=session.getAttribute("member_number").toString();
		if(!buyer_number.equals(reciever)) {
		Chat_roomVO chat_room = new Chat_roomVO(); //채팅방 번호 저장용
		chat_room.setBuyer_number(buyer_number);
		chat_room.setCeller_number(reciever);
		chat_room.setBoard_number(board_number);
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
		String chat_number = chatVO.getChat_number();
		model.addAttribute("chatVO",service.find_chat(chat_number));
		model.addAttribute("memberVO",memberVO);
		}
	}

	@GetMapping("/chat_list")
	public void chat_list(Model model,HttpSession session) {
		MemberVO member = new MemberVO(); // 세션 나의 member_number 저장용
		
		member.setMember_number(session.getAttribute("member_number").toString());
		//member = 로그인한 사용자
		
		List<Chat_roomVO> list1 = new ArrayList<Chat_roomVO>(); //chat리스트 불러오기
		List<Chat_profileVO> list2 = new ArrayList<Chat_profileVO>(); //상대방 프로필 리스트 불러오기
		list1 = service.room_list(member);
		//채팅 리스트 불러와서 list1에 저장
		
		for(Chat_roomVO each_lists : list1) { //each_list마다 프로필을 다르게 불러온다.
			
		MemberVO member2 = new MemberVO(); 
		//member2 = 채팅상대
		Chat_profileVO chat_pro = new Chat_profileVO();
		//chat_pro = 채팅상대의 프로필데이터
		
		if(each_lists.getCeller_number().equals(member.getMember_number())) {
			//판매자 = 본인이면 , 구매자가 상대방이다.
		member2.setMember_number(each_lists.getBuyer_number());
		}
		else if(each_lists.getBuyer_number().equals(member.getMember_number())) {
			//구매자 = 본인이면 , 판매자가 상대방이다.
		member2.setMember_number(each_lists.getCeller_number());
		}
		member2 = m_service.profile(member2);
		chat_pro.setAddress(member2.getAddress());
		chat_pro.setBoard_number(each_lists.getBoard_number());
		chat_pro.setId(member2.getId());
		chat_pro.setMember_number(member2.getMember_number());
		chat_pro.setNickName(member2.getNickName());
		chat_pro.setProfile_image(member2.getProfile_image());
		list2.add(chat_pro);
			}
		model.addAttribute("memberVO",list2);
	}
	
}
