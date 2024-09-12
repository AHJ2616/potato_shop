package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.Re_replyVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.MemberVO;
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
	public List<ReplyVO> getList(Reply_critera reCritera, String id) {
		// 댓글 리스트 출력
		log.info("ReplyServiceImpl.getList() 메서드 실행 게시물번호 : " + id);
		return mapper.getListWithPaging(reCritera, id);
	}

	@Override
	public ReplyPageDTO getListPage(Reply_critera reCritera, String id) {
		// 댓글 갯수 구하기
		return new ReplyPageDTO(mapper.getCountById(id), mapper.getListWithPaging(reCritera, id));
	}

	// ---------------대댓글
	
	@Override
	public MemberVO getMemberById(String id) {
		return mapper.getMemberById(id);
	}

	@Override
	public List<ReplyVO> getRepliesByMemberId(Reply_critera reCritera, String id) {
		 return mapper.getRepliesByMemberId(reCritera, id);
	}

	@Override
	public void addReply(ReplyVO replyVO) {
		mapper.insertReply(replyVO);
		
	}

	@Override
	public void updateReply(ReplyVO replyVO) {
		mapper.updateReply(replyVO);
		
	}

	@Override
	public void deleteReply(String reply_number) {
		mapper.deleteReply(reply_number);
		
	}

	@Override
	public List<Re_replyVO> getReRepliesByReplyNumber(String reply_number) {
		return mapper.getReRepliesByReplyNumber(reply_number);
	}

	@Override
	public void addReReply(Re_replyVO re_replyVO) {
		mapper.insertReReply(re_replyVO);
		
	}

	@Override
	public void updateReReply(Re_replyVO re_replyVO) {
		mapper.updateReReply(re_replyVO);
		
	}

	@Override
	public void deleteReReply(String re_reply_number) {
		mapper.deleteReReply(re_reply_number);
		
	}

	@Override
	public Re_replyVO readReReply(String re_reply_number) {
		return mapper.readReReply(re_reply_number);
	}

}
