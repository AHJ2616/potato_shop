package com.potato.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.potato.domain.BoardVO;
import com.potato.domain.MemberVO;
import com.potato.domain.UserVO;
import com.potato.mapper.Member_mapper;
import com.potato.domain.Chat_roomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)  // 메서드별 테스트용 JUnit4
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 참고할 파일
@Log4j2
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired) // 생성자 자동 주입
	private Member_mapper mapper;
	private Chat_mapper cmapper;
	
	@Test
	public void test() {
		MemberVO member = new MemberVO();
		member.setAddress("트리거1번");
		member.setId("qqq");
		member.setPass("트리거1번");
		member.setName("트리거1이름");
		member.setNickName("테스트1닉넴");
		member.setPhone("01011111111");
		int x = mapper.register(member);
	    if(x==1) {System.out.println("등록완료");}
	    if(x==0) {System.out.println("등록실패");}
	}

	@Test
	public void tessst() {
		System.out.println("실행");
	}
	
	@Test
	public void room_list() {
		MemberVO member = new MemberVO();
		member.setMember_number("01J72QVJ83E3YEVWK8JRCKXAZE");
		cmapper.room_list(member);
	}
	
	@Test
	public void get_room() {
	}
	

	@Test
	public void login() {
		MemberVO member = new MemberVO();
		member.setId("sql1");
		member.setPass("sql1");
		mapper.login(member);
	}
	
	
	
	@Test
	public void delete() {
		MemberVO member = new MemberVO();
		member.setId("sql2");
		member.setPass("sql1");
		mapper.delete(member);
	}
	
	@Test
	public void mypage() {
		UserVO user = new UserVO();
		MemberVO member = new MemberVO();
		member.setMember_number("01J6TP08EPYFFXJYAAMJ9KV2QW");
		member = mapper.mypage(member);
	}
	
	@Test
	public void modify_mypage() {
		MemberVO member = new MemberVO();
		member.setPass("1535");
		member.setNickName("마라탕");
		member.setPhone("01012341234");
		member.setProfile_image(" .../resources/images/default_profile_2.jpg");
		member.setMember_number("01J6TP08EPYFFXJYAAMJ9KV2QW");
	}
	
	@Test
	public void check_id() {
		String id = "qwr";
		mapper.check_id(id);
	}
	
}
