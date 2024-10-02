package com.potato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NotificationVO {
	
	private int notice_number; //공지사항 번호
	private String writer; // 작성자
	private String title; // 글 제목
	private String content; // 글 내용
	private Date regidate; // 등록일
	private int important; // 중요도
	private int views; // 조회수

}
