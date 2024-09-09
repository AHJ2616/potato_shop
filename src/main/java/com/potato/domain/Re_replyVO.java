package com.potato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Re_replyVO {

	//Re_replyVO
		private String re_reply_number;//대댓글 번호
		private String reply_number;   //댓글 번호
		private String content;	       //대댓글 내용
		private String writer;         //작성자
		private Date regidate;		   //댓글 등록일 (default sysdate)
}
