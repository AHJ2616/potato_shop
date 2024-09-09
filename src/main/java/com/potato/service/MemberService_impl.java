package com.potato.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;
import com.potato.domain.BoardVO;
import com.potato.domain.MemberVO;
import com.potato.domain.MylistVO;
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
		// TODO 회원가입
		Ulid ulid = UlidCreator.getUlid();
		member.setMember_number(ulid.toString());
		return mapper.register(member);
	} //성공 : 1 , 실패 : 0

	@Override
	public MemberVO login(MemberVO member) {
		// TODO 로그인
		return mapper.login(member);
	}

	@Override
	public int delete(MemberVO member) {
		// TODO 회원탈퇴
		
		return mapper.delete(member);
	}

	@Override
	public UserVO mypage(MemberVO member) {
		// TODO 마이페이지 보기
		return mapper.mypage(member);
	}

	@Override
	public int modify_mypage(MemberVO member) {
		// TODO 마이페이지 수정
		return mapper.modify_mypage(member);
	}

	@Override
	public List<ReplyVO> mylist1(MemberVO member) {
		// TODO 나의 활동내역 확인1(댓글 불러오기)
		return mapper.mylist1(member);
	}

	@Override
	public List<Re_replyVO> mylist2(MemberVO member) {
		// TODO 나의 활동내역 확인2(답글 불러오기)
		return mapper.mylist2(member);
	}

	@Override
	public List<BoardVO> mylist3(MemberVO member) {
		// TODO 나의 활동내역 확인3(게시글 불러오기)
		return mapper.mylist3(member);
	}

	@Override
	public List<ReportVO> mylist4(MemberVO member) {
		// TODO 나의 활동내역 확인4(신고내용 불러오기)
		return mapper.mylist4(member);
	}

	@Override
	public String check_id(String id) {
		// TODO 아이디 중복확인
		
		return mapper.check_id(id);
	}

	
			

}
