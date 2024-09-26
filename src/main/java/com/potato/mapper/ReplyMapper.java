package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.potato.domain.ReplyVO;
import com.potato.domain.Reply_critera;

@Mapper
public interface ReplyMapper {
	// xml와 연동해서 sql 처리
		// 추상메서드가 필요하다.
		
	// 추상메서드
	public int insert(ReplyVO replyVO); // 외부에서 폼으로 ReplyVO 객체가 넘어오고 리턴은 int가 됨.
	
	public ReplyVO read(String reply_number); // 댓글 번호를 가지고 댓글(객체)을 가져옴.
	
	public int update(ReplyVO replyVO); // 객체가 넘어가서 수정됨. 결과는 int 처리
	
	public int delete(String reply_number); // 댓글 번호를 가지고 레코드를 삭제.
	
	// 댓글 리스트 : 페이징처리 + board_number (pk+fk) -> 여러개의 파라미터인 경우 @Param을 사용하면 편리함
	public List<ReplyVO> getListWithPaging(@Param("reCritera") Reply_critera reCritera, @Param("member_number") String member_number);
	//																페이징처리 기준점, 게시물의 번호 pk+fk
	
	// 해당하는 댓글 갯수
	public int getCountById(String member_number);
			
			
	}
