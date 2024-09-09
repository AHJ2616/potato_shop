package com.potato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
	//ReportsVO
		private String report_number;//신고번호 sys_guid()
		private String writer_id;	  //신고자 아이디
		private String defendant;     //신고당한 사람의 member_number
		private String status;		  //신고 처리상태 1= 처리됨 / 0= 처리안됨
		private Date regidate;        //신고일 (default sysdate)
		private Date done_date; 	  //처리 완료일 (default sysdate)
}
