package com.potato.domain;

import lombok.Data;

@Data
public class Board_member_cartVO {

	private String board_number;  //게시글번호 seq_board.nextval
	private String title;		  // 글 제목
	private String nickName;	  //닉네임
	private String profile_image; //프로필 사진
	private String id; 			  //아이디
	private String likes_member_number; //session의 mno
	private int likes; //좋아요
	private int interest; // 관심
	
}
