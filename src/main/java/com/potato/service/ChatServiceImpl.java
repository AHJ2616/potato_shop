package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.ChatVO;
import com.potato.domain.Chat_roomVO;
import com.potato.domain.MemberVO;
import com.potato.mapper.Chat_mapper;
import com.potato.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class ChatServiceImpl implements ChatService{
	
	@Setter(onMethod_ = @Autowired)
	private Chat_mapper mapper;
	
	@Override
	public List<Chat_roomVO> room_list(MemberVO member) {
		// TODO 채팅방 리스트 가져오기
		return mapper.room_list(member);
	}
	
	@Override
	public ChatVO get_room(Chat_roomVO chat_room) {
		// TODO 채팅방 번호 가져오기
		return mapper.get_room(chat_room);
	}

	@Override
	public int add_room(Chat_roomVO chat_room) {
		// TODO 채팅방 만들기
		return mapper.add_room(chat_room);
	}
	
	@Override
	public List<ChatVO> list(ChatVO chat) {
		// TODO 채팅 리스트 보기
		return mapper.list(chat);
	}

	@Override
	public int add_chat(ChatVO chat) {
		// TODO 채팅 추가
		return mapper.add_chat(chat);
	}

	@Override
	public int delete_chat(ChatVO chat) {
		// TODO 채팅 삭제
		return mapper.delete_chat(chat);
	}

	

	

}
