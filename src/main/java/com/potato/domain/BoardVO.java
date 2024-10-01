package com.potato.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	//BoardVO
			private String board_number;  //게시글번호 seq_board.nextval
			private String types; 		  // 게시판 구분 (중고거래 , 후기)
			private String title;		  // 글 제목
			private String writer;		  // 글 작성자
			private String content;		  // 글 내용
			private String writer_number; // 글 작성자의 member_number
			private String board_address; // 작성자 주소
			private String status; 		  // 상품의 상태 (일반 , 예약 , 판매 완료)
			private String photo_name;	  // 첨부사진 파일명
			private Date regidate; 		  // 글 등록(수정)일 (default sysdate)
			private Date updatedate; 
			private int likes;			  // 좋아요 수
			private int interest;		  // 관심 수
			private int price;			  // 가격
			private int views;			  // 조회수
			private String type;		  // 좋아요, 관심 버튼 타입값
			private MultipartFile[] fileUpload; // 파일 업로드 코드
}
