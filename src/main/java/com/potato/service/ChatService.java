package com.potato.service;

import java.util.List;

import com.potato.domain.ChatVO;
import com.potato.domain.Chat_roomVO;
import com.potato.domain.MemberVO;

public interface ChatService {
	
	//1.채팅방 리스트 가져오기
		public List<Chat_roomVO> room_list(MemberVO member);
		
		//2.채팅방 번호 가져오기
		public ChatVO get_room(Chat_roomVO chat_room);
		
		//3.채팅방 만들기
		public int add_room(Chat_roomVO chat_room);
		
		//4.채팅내역 가져오기
		public List<ChatVO> list(ChatVO chat);
		
		//5.채팅 입력하기
		public int add_chat(ChatVO chat);
		
		//6.채팅 지우기
		public int delete_chat(ChatVO chat);
		
		//7.채팅방 번호로 참여자 불러오기
		public Chat_roomVO find_chat(String chat_number);
		
		//8.채팅방 번호로 status 변경하기
		public int set_status(Chat_roomVO chat_room);
}
