package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.ComentsVO;
import com.potato.domain.QnaVO;

@Mapper
public interface Etc_mapper {
	
	//1. 고객편지 쓰기
	public int send_coments(ComentsVO coments);
	
	//2. 고객편지 보기
	public List<ComentsVO> get_coments();
	
	//3. QnA 게시글 작성
	public int add_qna(QnaVO qna);
	
	//4. QnA 게시판 불러오기
	public List<QnaVO> read_qna();
	
	//5. QnA 게시글 수정
	public int modify_qna(QnaVO qna);
	
	//6. QnA 게시글 삭제
	public int delete_qna(QnaVO qna);
	
}
