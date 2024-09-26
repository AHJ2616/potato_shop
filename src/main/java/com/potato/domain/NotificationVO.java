package com.potato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NotificationVO {
	
	private String writer; // 작성자
	private String title; // 글 제목
	private String content; // 글 내용
	private Date regidate; // 등록일

}
