package com.potato.domain;

import lombok.Data;

@Data
public class Chat_roomVO {
	
	private String chat_number;	   //채팅 번호 (ULID)
	private String person_a;	   //보내는 사람 (member_number)
	private String person_b;       //받는 사람 (member_number)

}
