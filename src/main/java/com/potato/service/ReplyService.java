package com.potato.service;

import com.potato.domain.ReplyPageDTO;
import com.potato.domain.ReplyVO;
import com.potato.domain.Reply_critera;

public interface ReplyService {
	
	public int register(ReplyVO replyVO); // 댓글 등록용 int 리턴
	
	public ReplyVO get(String reply_number); // 댓글 1개 가져옴
	
	public int modify(ReplyVO replyVO); // 객체 수정 후 int로 리턴
	
	public int remove(String reply_number); // 댓글 1개 삭제

	public ReplyPageDTO getListPage(Reply_critera reCritera, String member_number); // 댓글 갯수 구하기

	
	
}

