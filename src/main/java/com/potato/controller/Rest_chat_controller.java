package com.potato.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.AlarmsVO;
import com.potato.domain.BoardVO;
import com.potato.domain.ChatVO;
import com.potato.domain.Chat_roomVO;
import com.potato.service.AlarmService;
import com.potato.service.BoardService;
import com.potato.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/chat/*")
@AllArgsConstructor
public class Rest_chat_controller {

	private ChatService service;
	private AlarmService a_service;
	private BoardService b_service;
	
	// 채팅 전송
    @PostMapping(value="/send")
    public void sendMessage(@RequestBody ChatVO chatVO,HttpSession session) {
    	service.add_chat(chatVO);
    	String chat_number = chatVO.getChat_number();
    	Chat_roomVO chat_room = service.find_chat(chat_number);
    	//알람용
    	AlarmsVO alarm = new AlarmsVO();
    	Ulid ulid = UlidCreator.getUlid();
    	String alarm_number = ulid.toString();
    	alarm.setAlarm_number(alarm_number);
    	String sender_id= session.getAttribute("id").toString();
  
    	if(chatVO.getSender().equals(chat_room.getBuyer_number())
        ) {
    		alarm.setMember_number(chat_room.getCeller_number());
    	}
    	if(chatVO.getSender().equals(chat_room.getCeller_number())
    	) {
    	    alarm.setMember_number(chat_room.getBuyer_number());
    	}
    	alarm.setContents(sender_id+"님으로 부터 새로운 채팅이 도착하였습니다");
    	alarm.setTarget_type("chat");
    	alarm.setTarget_key(chat_room.getChat_number());
    	a_service.add_alarm(alarm);
    }

    // 채팅내역 불러오기
    @PostMapping(value="/messages",produces = "application/json")
    public List<ChatVO> getMessages(@RequestBody ChatVO chatVO) {
        return service.list(chatVO);
    }

    // Delete a chat message by its number
    @DeleteMapping(value="/delete")
    public void deleteMessage(@RequestBody ChatVO chatVO) {
    	service.delete_chat(chatVO);
    }
    
    @PostMapping(value="/status")
    public void set_status(@RequestBody Chat_roomVO chat_room,HttpSession session) {
    	//채팅방 상태 변화
    	service.set_status(chat_room);
    	
    	//알람설정용
    	AlarmsVO alarm = new AlarmsVO();
    	Ulid ulid = UlidCreator.getUlid();
    	String alarm_number = ulid.toString();
    	alarm.setAlarm_number(alarm_number);
    	alarm.setTarget_type("chat"); //알림 타입
    	alarm.setTarget_key(chat_room.getChat_number()); //채팅방 번호
    	String sender_id= session.getAttribute("id").toString();
    	
    	
    	switch(chat_room.getStatus()) {
    	//구매자가 구매예약 요청
    	//판매자에게 알림을 보낸다
    	case 1 : 
    	alarm.setContents(sender_id+"님이 구매요청을 했습니다"); //알림내용
    	alarm.setMember_number(chat_room.getCeller_number()); //알림타겟 번호
    	a_service.add_alarm(alarm); // 알림 보내기
    	
    	//deal 테이블을 생성한다.
    	
    	break;
    	
    	//판매자의 판매예약 요청
    	//구매자에게 알림을 보낸다 , 게시물을 예약중으로 바꾼다
    	case 2 : 
    	alarm.setContents(sender_id+"님이 판매 예약을 하였습니다");//알림내용
    	alarm.setMember_number(chat_room.getBuyer_number());//알림타겟 번호
    	a_service.add_alarm(alarm); // 알림 보내기
    	
    	//게시글을 예약중으로 바꾸는 로직
    	String board_number = chat_room.getBoard_number();
    	String writer_number = chat_room.getCeller_number();
    	BoardVO board = new BoardVO();
    	board.setBoard_number(board_number);
    	board.setWriter_number(writer_number);
    	board.setStatus("예약중");
    	b_service.set_status(board); // 예약중으로 상태 변경
    	break;
    	
    	//판매자가 판매완료를 누른다.
    	//구매자가 구매완료를 누를 수 있게 한다. 구매자에게 알림을 보낸다.
    	case 3 :
    	alarm.setContents(sender_id+"님과의 거래가 완료되었다면, 구매완료버튼을 눌러주세요");	
    	alarm.setMember_number(chat_room.getBuyer_number());
    	a_service.add_alarm(alarm); // 알림 보내기
    	
    	//게시글을 판매완료로 바꾸는 로직
    	String board_number2 = chat_room.getBoard_number();
    	String writer_number2 = chat_room.getCeller_number();
    	BoardVO board2 = new BoardVO();
    	board2.setBoard_number(board_number2);
    	board2.setWriter_number(writer_number2);
    	board2.setStatus("판매완료");
    	b_service.set_status(board2); // 판매완료로 상태 변경
    	break;
    	
    	case 4 :
    	alarm.setContents("거래는 어떠셨나요? 후기를 알려주세요");
    	alarm.setTarget_type("review"); //알림 타입
    	alarm.setTarget_key(chat_room.getCeller_number()); //판매자 번호
        alarm.setMember_number(chat_room.getBuyer_number());
        a_service.add_alarm(alarm); // 알림 보내기
    	
    	}
    }
	
}
