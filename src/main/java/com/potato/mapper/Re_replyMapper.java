package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.potato.domain.Re_reply_critera;
import com.potato.domain.Re_replyVO;


@Mapper
public interface Re_replyMapper {
	// xml와 연동해서 sql 처리
			// 추상메서드가 필요하다.
			
			// 추상메서드
			// 대댓글----------------------------
			
			// 대댓글 조회
			public Re_replyVO readReReply(String re_reply_Number);
			
			// 대댓글 리스트 조회
			public List<Re_replyVO> getReRepliesByReplyNumber(String reply_number);
			
			// 대댓글 작성
			public int insertReReply(Re_replyVO re_replyVO);
			
			// 대댓글 수정
			public int updateReReply(Re_replyVO re_replyVO);
			
			// 대댓글 삭제
			public int deleteReReply(String re_reply_Number);
			

}

