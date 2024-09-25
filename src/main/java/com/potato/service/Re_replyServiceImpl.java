package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.Re_replyVO;
import com.potato.mapper.Re_replyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class Re_replyServiceImpl implements Re_replyService{
	
	@Setter(onMethod_ = @Autowired)
	private Re_replyMapper mapper;

	
	// 대댓글 리스트
			@Override
			public List<Re_replyVO> getReRepliesByReplyNumber(String reply_number) {
				return mapper.getReRepliesByReplyNumber(reply_number);
			}

			// 대댓글 추가
			@Override
			public int addReReply(Re_replyVO re_replyVO) {
				return mapper.insertReReply(re_replyVO);
				
			}

			// 대댓글 수정
			@Override
			public int updateReReply(Re_replyVO re_replyVO) {
				return mapper.updateReReply(re_replyVO);
				
			}

			// 대댓글 삭제
			@Override
			public int deleteReReply(String re_reply_number) {
				return mapper.deleteReReply(re_reply_number);
				
			}

			// 대댓글 1개 읽기
			@Override
			public Re_replyVO readReReply(String re_reply_number) {
				return mapper.readReReply(re_reply_number);
			}

}
