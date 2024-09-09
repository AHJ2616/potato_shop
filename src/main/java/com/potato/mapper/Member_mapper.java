package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.BoardVO;
import com.potato.domain.MemberVO;
import com.potato.domain.MylistVO;
import com.potato.domain.Re_replyVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.ReportVO;
import com.potato.domain.UserVO;

@Mapper
public interface Member_mapper {

	//회원가입
	public int register(MemberVO member);
	
	//로그인
	public MemberVO login(MemberVO member);
	
	//회원탈퇴
	public int delete(MemberVO member);
	
	//마이페이지 보기 /mypage.jsp
	public UserVO mypage(MemberVO member);
	
	//마이페이지 수정
	public int modify_mypage(MemberVO member);
	
	//나의 활동내역 확인1(댓글 불러오기)
	public List<ReplyVO> mylist1(MemberVO member);
	
	//나의 활동내역 확인2(답글 불러오기)
	public List<Re_replyVO> mylist2(MemberVO member);
	
	//나의 활동내역 확인3(게시글 불러오기)
	public List<BoardVO> mylist3(MemberVO member);
	
	//나의 활동내역 확인4(신고내용 불러오기)
	public List<ReportVO> mylist4(MemberVO member);
	
	//아이디 중복확인(회원가입에서)
	public String check_id(String id);
	
	
}
