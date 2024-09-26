package com.potato.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.ReplyVO;
import com.potato.domain.ReplyPageDTO;
import com.potato.domain.Reply_critera;
import com.potato.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO replyVO) {
		// 댓글 등록
		log.info("ReplyServiceImpl.register() 메서드 실행" + replyVO);
		return mapper.insert(replyVO);
	}

	@Override
	public ReplyVO get(String reply_number) {
		// 댓글 읽기
		log.info("ReplyServiceImpl.get() 메서드 실행" + reply_number);
		return mapper.read(reply_number);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		// 댓글 수정
		log.info("ReplyServiceImpl.modify() 메서드 실행" + replyVO);
		return mapper.update(replyVO);
	}

	@Override
	public int remove(String reply_number) {
		// 댓글 삭제
		log.info("ReplyServiceImpl.remove() 메서드 실행" + reply_number);
		return mapper.delete(reply_number);
	}

	@Override
	public ReplyPageDTO getListPage(Reply_critera reCritera, String member_number) {
		// 댓글 갯수 구해서 리스트 출력
		return new ReplyPageDTO(mapper.getCountById(member_number), mapper.getListWithPaging(reCritera, member_number));
	}

}
