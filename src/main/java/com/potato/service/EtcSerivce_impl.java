package com.potato.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.ComentsVO;
import com.potato.domain.QnaVO;
import com.potato.mapper.Etc_mapper;
import com.potato.mapper.Member_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class EtcSerivce_impl implements EtcService{
	
	Etc_mapper mapper;

	@Override
	public int send_coments(ComentsVO coments) {
		// TODO 1. 고객편지 쓰기
		return mapper.send_coments(coments);
	}

	@Override
	public List<ComentsVO> get_coments() {
		// TODO 2. 고객편지 보기
		return mapper.get_coments();
	}

	@Override
	public int add_qna(QnaVO qna) {
		// TODO 3. QnA 게시글 작성
		Ulid ulid = UlidCreator.getUlid();
		String qna_number = ulid.toString();
		qna.setQna_number(qna_number);
		return mapper.add_qna(qna);
	}

	@Override
	public List<QnaVO> read_qna() {
		// TODO 4. QnA 게시판 불러오기
		return mapper.read_qna();
	}

	@Override
	public int modify_qna(QnaVO qna) {
		// TODO 5. QnA 게시글 수정
		return mapper.modify_qna(qna);
	}

	@Override
	public int delete_qna(QnaVO qna) {
		// TODO 5. QnA 게시글 삭제
		return mapper.delete_qna(qna);
	}

}
