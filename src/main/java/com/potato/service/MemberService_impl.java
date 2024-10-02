package com.potato.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.AlarmsVO;
import com.potato.domain.BoardVO;
import com.potato.domain.Board_member_cartVO;
import com.potato.domain.Login_checkVO;
import com.potato.domain.MemberVO;
import com.potato.domain.Re_replyVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.ReportVO;
import com.potato.domain.UserVO;
import com.potato.mapper.Member_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
@Service
@Log4j2
@AllArgsConstructor
public class MemberService_impl implements MemberService {
	
	private Member_mapper mapper;

	@Override
	public int register(MemberVO member) {
		// TODO 1.회원가입
		
		return mapper.register(member);
	} //성공 : 1 , 실패 : 0

	@Override
	public MemberVO login(MemberVO member) {
		// TODO 2.로그인
		return mapper.login(member);
	}

	@Override
	public int delete(MemberVO member) {
		// TODO 3.회원탈퇴
		
		return mapper.delete(member);
	}

	@Override
	public MemberVO mypage(MemberVO member) {
		// TODO 4.마이페이지 보기1
		return mapper.mypage(member);
	}
	
	@Override
	public UserVO mypage2(MemberVO member) {
		// TODO 5.마이페이지 보기2
		return mapper.mypage2(member);
	}

	@Override
	public int modify_mypage(MemberVO member) {
		// TODO 6.마이페이지 수정
		return mapper.modify_mypage(member);
	}
	
	@Override
	public int modify_profile(MemberVO member) {
		// TODO 7.프로필사진 수정
		return mapper.modify_profile(member);
	}

	@Override
	public List<ReplyVO> mylist1(MemberVO member) {
		// TODO 8.나의 활동내역 확인1(댓글 불러오기)
		return mapper.mylist1(member);
	}

	@Override
	public List<Re_replyVO> mylist2(MemberVO member) {
		// TODO 9.나의 활동내역 확인2(답글 불러오기)
		return mapper.mylist2(member);
	}

	@Override
	public List<BoardVO> mylist3(MemberVO member) {
		// TODO 10.나의 활동내역 확인3(게시글 불러오기)
		return mapper.mylist3(member);
	}

	@Override
	public List<ReportVO> mylist4(MemberVO member) {
		// TODO 11.나의 활동내역 확인4(신고내용 불러오기)
		return mapper.mylist4(member);
	}

	@Override
	public String check_id(String id) {
		// TODO 12.아이디 중복확인
		
		return mapper.check_id(id);
	}

	@Override
	public MemberVO profile(MemberVO member) {
		// TODO 13.프로필 정보 가져오기
		return mapper.profile(member);
	}

	@Override
	public int login_check(String member_number, int status) {
		// TODO 14.로그인 됨으로 상태변경
		return mapper.login_check(member_number, status);
	}
	
	@Override
	public Login_checkVO login_check2(String member_number) {
		// TODO 15.로그인 상태 확인
		return mapper.login_check2(member_number);
	}


	@Override
	public List<Board_member_cartVO> get_likes_list(String member_number) {
		// TODO 16.세션 mno로 좋아요& 관심 목록 가져오기
		return mapper.get_likes_list(member_number);
	}

	@Override
	public int report(ReportVO report) {
		// TODO 17.신고 작성하기
		return mapper.report(report);
	}

	@Override
	public MemberVO find_id(MemberVO member) {
		// TODO 18.email, phone으로 id 찾기
		return mapper.find_id(member);
	}

	@Override
	public int find_pass(MemberVO member) {
		// TODO 19.id, email, phone으로 임시 비밀번호 저장 (1: 저장됨 / 0: form오류)
		return mapper.find_pass(member);
	}

	@Override
	public void register2(MemberVO member) {
		// TODO 20.[트리거문제] 회원가입시 user테이블도 같이 생성
		mapper.register2(member);
	}

	@Override
	public void delete2(MemberVO memberVO) {
		// TODO 21.[트리거문제] 회원탈퇴시 X_member테이블로 데이터 옮기기
		mapper.delete2(memberVO);
	}

	@Override
	public void register3(MemberVO member) {
		// TODO 22.[트리거문제] 회원가입시 login_check테이블도 같이 생성
		mapper.register3(member);
	}

	@Override
    public long getPay(String member_number) {
		// TODO 23.회원 pay 정보 조회
        return mapper.getPay(member_number);
    }

    @Override
    public long getPoint(String member_number) {
    	// TODO 24.회원 point 정보 조회
        return mapper.getPoint(member_number);
    }


}
