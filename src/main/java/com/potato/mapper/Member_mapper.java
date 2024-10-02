package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.potato.domain.AlarmsVO;
import com.potato.domain.BoardVO;
import com.potato.domain.Board_member_cartVO;
import com.potato.domain.MemberVO;
import com.potato.domain.Re_replyVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.ReportVO;
import com.potato.domain.UserVO;
import com.potato.domain.Login_checkVO;

@Mapper
public interface Member_mapper {

	//1.회원가입
	public int register(MemberVO member);
	
	//2.로그인
	public MemberVO login(MemberVO member);
	
	//3.회원탈퇴
	public int delete(MemberVO member);
	
	//4.마이페이지 보기1
	public MemberVO mypage(MemberVO member);
	
	//5.마이페이지 보기2
	public UserVO mypage2(MemberVO member);
	
	//6.마이페이지 수정
	public int modify_mypage(MemberVO member);
	
	//7.프로필사진 수정
	public int modify_profile(MemberVO member);
	
	//8.나의 활동내역 확인1(댓글 불러오기)
	public List<ReplyVO> mylist1(MemberVO member);
	
	//9.나의 활동내역 확인2(답글 불러오기)
	public List<Re_replyVO> mylist2(MemberVO member);
	
	//10.나의 활동내역 확인3(게시글 불러오기)
	public List<BoardVO> mylist3(MemberVO member);
	
	//11.나의 활동내역 확인4(신고내용 불러오기)
	public List<ReportVO> mylist4(MemberVO member);
	
	//12.아이디 중복확인(회원가입에서)
	public String check_id(String id);
	
	//13.프로필 내용 가져오기
	public MemberVO profile(MemberVO member);
	
	//14.로그인 됨으로 상태변경
	public int login_check(@Param("member_number") String member_number ,@Param("status") int status);
	
	//15.로그인 상태 확인
	public Login_checkVO login_check2(@Param("member_number") String member_number);
	
	//16.세션 mno로 좋아요& 관심 목록 가져오기
	public List<Board_member_cartVO> get_likes_list(@Param("member_number") String member_number);
	
	//17.신고 작성하기
	public int report(ReportVO report);
	
	//18. name,phone으로 id 찾기
	public MemberVO find_id(MemberVO member);
	
	//19.id,name,phone으로 임시 비밀번호 저장 (1: 저장됨 / 0: form오류)
	public int find_pass(MemberVO member);
	
	//20.[트리거문제] 회원가입시 user테이블도 같이 생성
	public void register2(MemberVO memberVO);
	
	//21.[트리거문제] 회원탈퇴시 X_member테이블로 데이터 옮기기
	public void delete2(MemberVO memberVO);
	
	//22.[트리거문제] 회원가입시 login_check테이블도 같이 생성
	public void register3(MemberVO memberVO);
	
	//23.회원 pay 정보 조회
	public long getPay(String member_number);
		
	//24.회원 point 정보 조회
	public long getPoint(String member_number);

}
