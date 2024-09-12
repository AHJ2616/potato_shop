package com.potato.service;

import java.util.List;

import com.potato.domain.Re_replyPageDTO;
import com.potato.domain.Re_reply_critera;
import com.potato.domain.Re_replyVO;

public interface Re_replyService {
	
	public int register(Re_replyVO Re_replyVO); // 대댓글 등록용 int 리턴
	
	public Re_replyVO get(String re_reply_number); // 대댓글 1개 가져옴
	
	public int modify(Re_replyVO Re_replyVO); // 객체 수정 후 int로 리턴
	
	public int remove(String re_reply_number); // 대댓글 1개 삭제
	
	public List<Re_replyVO> getList(Re_reply_critera re_reply_critera, String reply_number); // 댓글의 번호를 이용해 모든 대댓글을 리스트로 출력

	public Re_replyPageDTO getListPage(Re_reply_critera re_reply_critera, String reply_number); // 대댓글 갯수 구하기

}
