package com.potato.service;

import java.util.List;

import com.potato.domain.Re_replyPageDTO;
import com.potato.domain.Re_reply_critera;
import com.potato.domain.Re_replyVO;

public interface Re_replyService {
	
    public List<Re_replyVO> getReRepliesByReplyNumber(String reply_number); // 대댓글 리스트
    
    public int addReReply(Re_replyVO re_replyVO); // 대댓글 작성
    
    public Re_replyVO readReReply(String re_reply_number); // 대댓글 1개 가져옴
    
    public int updateReReply(Re_replyVO re_replyVO); // 대댓글 수정
    
    public int deleteReReply(String re_reply_number); // 대댓글 삭제


}
