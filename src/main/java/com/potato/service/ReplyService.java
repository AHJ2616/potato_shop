package com.potato.service;

import java.util.List;

import com.potato.domain.MemberVO;
import com.potato.domain.Re_replyVO;
import com.potato.domain.ReplyPageDTO;
import com.potato.domain.ReplyVO;
import com.potato.domain.Reply_critera;

public interface ReplyService {
	
	public int register(ReplyVO replyVO); // 댓글 등록용 int 리턴
	
	public ReplyVO get(String reply_number); // 댓글 1개 가져옴
	
	public int modify(ReplyVO replyVO); // 객체 수정 후 int로 리턴
	
	public int remove(String reply_number); // 댓글 1개 삭제
	
	public List<ReplyVO> getList(Reply_critera reCritera, String id); // 게시글의 번호를 이용해 모든 댓글을 리스트로 출력

	public ReplyPageDTO getListPage(Reply_critera reCritera, String id); // 댓글 갯수 구하기

	
	// 대댓글------------------------
	public MemberVO getMemberById(String id); // 회원 id 조회
	
    public List<ReplyVO> getRepliesByMemberId(Reply_critera reCritera, String id); // 댓글 리스트
    
    public void addReply(ReplyVO replyVO); // 댓글 작성
    
    public void updateReply(ReplyVO replyVO); // 댓글 수정
    
    public void deleteReply(String reply_number); // 댓글 삭제
    
    public List<Re_replyVO> getReRepliesByReplyNumber(String reply_number); // 대댓글 리스트
    
    public void addReReply(Re_replyVO re_replyVO); // 대댓글 작성
    
    public Re_replyVO readReReply(String re_reply_number); // 대댓글 1개 가져옴
    
    public void updateReReply(Re_replyVO re_replyVO); // 대댓글 수정
    
    public void deleteReReply(String re_reply_number); // 대댓글 삭제
}

