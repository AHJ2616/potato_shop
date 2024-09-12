package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.potato.domain.BoardVO;
import com.potato.domain.MemberVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.ReportVO;

@Mapper
public interface AdminMapper {

public MemberVO getList(@Param("id") String id); // 관리자 정보확인 - 완
	
	public MemberVO getMemberList(@Param("id") String id); // 회원 정보 검색 - 완
	
	public int updateBlack(@Param("id") String id ); // 블랙리스트 - 완
	
	public int insertBoard(BoardVO boardVO); // 공지 추가 - 완
	
	public int deleteReport(BoardVO boardVO); // 게시판 삭제
	
	public int replyDelete(ReplyVO replyVO); // 댓글 삭제
	
	public List<ReportVO> readReport(); // 신고내역 확인 - 완
	
	public int updateReport(@Param("status") int status); // 신고 처리 - 완
	
	public List<MemberVO> viewBlack(); // 블랙리스트 확인
	
	public List<MemberVO> eng(); // 통계
	
}
