package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.Re_replyPageDTO;
import com.potato.domain.Re_replyVO;
import com.potato.domain.Re_reply_critera;
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

	
	@Override
	public int register(Re_replyVO Re_replyVO) {
		// 대댓글 등록
		log.info("Re_replyServiceImpl.register() 메서드 실행" + Re_replyVO);
		return mapper.insert(Re_replyVO);
	}



	@Override
	public Re_replyVO get(String re_reply_number) {
		// 대댓글 읽기
		log.info("Re_replyServiceImpl.get() 메서드 실행" + re_reply_number);
		return mapper.read(re_reply_number);
	}



	@Override
	public int modify(Re_replyVO Re_replyVO) {
		// 대댓글 수정
		log.info("Re_replyServiceImpl.modify() 메서드 실행" + Re_replyVO);
		return mapper.update(Re_replyVO);
	}



	@Override
	public int remove(String re_reply_number) {
		// 대댓글 삭제
		log.info("Re_replyServiceImpl.remove() 메서드 실행" + re_reply_number);
		return mapper.delete(re_reply_number);
	}



	@Override
	public List<Re_replyVO> getList(Re_reply_critera re_reply_critera, String reply_number) {
		// 대댓글 리스트 출력
		log.info("Re_replyServiceImpl.getList() 메서드 실행 게시물번호 : " + reply_number);
		return mapper.getListWithPaging(re_reply_critera, reply_number);
	}

	
	@Override
	public Re_replyPageDTO getListPage(Re_reply_critera re_reply_critera, String reply_number) {
		// 대댓글 갯수 구하기
		return new Re_replyPageDTO(mapper.getCountByReply(reply_number), mapper.getListWithPaging(re_reply_critera, reply_number));
	}

}
