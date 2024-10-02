package com.potato.service;

import java.util.List;

import com.potato.domain.MemberVO;
import com.potato.domain.NotificationVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.ReportVO;

public interface AdminService {

	
	   // 관리자 정보 확인
 public MemberVO getList(String id);

 // 회원 정보 검색
 public MemberVO getMemberList(String id);

 // 블랙리스트 등록
 public void updateBlack(MemberVO memberVO);

 // 공지사항 추가
 public void insertBoard(NotificationVO notice);

 // 게시글 삭제
 public void deleteReport(int notice_number);

 // 댓글 삭제
 public void replyDelete(ReplyVO replyVO);

 // 신고 내역 확인
 public List<ReportVO> readReport();

 // 신고 처리
 public void updateReport(ReportVO report);
 
 // 블랙리스트 보기
 public List<MemberVO> viewBlack();
 
 public ReportVO get_report(String report_number);
 
 // 블랙리스트 해제
 public void clearBlack(String member_number);
 
 // 관리자 공지 전체확인
 public List<NotificationVO> notification();
 
 // 관리자 공지 하나 읽기
 public NotificationVO notice(int notice_number);
	
}
