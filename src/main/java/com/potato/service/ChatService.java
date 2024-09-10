package com.potato.service;

import java.util.List;

import com.potato.domain.ChatVO;
import com.potato.domain.Chat_roomVO;
import com.potato.domain.MemberVO;

public interface ChatService {
	
		//채팅방 리스트 가져오기
		public List<Chat_roomVO> room_list(MemberVO member);
		
		//채팅방 번호 가져오기
		public ChatVO get_room(Chat_roomVO chat_room);
		
		//채팅방 만들기
		public int add_room(Chat_roomVO chat_room);
		
		//채팅내역 가져오기
		public List<ChatVO> list(ChatVO chat);
		
		//채팅 입력하기
		public int add_chat(ChatVO chat);
		
		//채팅 지우기
		public int delete_chat(ChatVO chat);

}
