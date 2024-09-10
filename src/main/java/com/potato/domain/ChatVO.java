package com.potato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {

	//ChatVO
		private String chat_number;	   //채팅 번호
		private String sender;		   //보내는 사람 (member_number)
		private String content;        //내용
		private Date time_stamp;       //보낸 시간 (default sysdate)

}
