package com.potato.domain;

import lombok.Data;

@Data
public class Chat_roomVO {
	
	private String chat_number;	        //채팅 번호 (ULID)
	private String buyer_number;	    //보내는 사람 (member_number)
	private String celler_number;       //받는 사람 (member_number)
	private String board_number; 		//물건이 등록된 게시판
	private int status;

}
