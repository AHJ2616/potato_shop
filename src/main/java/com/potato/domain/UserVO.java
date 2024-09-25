package com.potato.domain;

import lombok.Data;

@Data
public class UserVO {
	
	//UserVO
		private String user_number;	  //유저번호(=회원번호) sys_guid()
		private int reports;		  //신고당한 수
		private Long temper;			  //온도
		private int trades;			  //거래완료 수

}
