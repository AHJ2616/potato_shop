package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;
import com.potato.domain.Criteria;

@Mapper
public interface BoardMapper {
	
	//1.전체 게시글 리스트 불러오기
	public List<BoardVO> getList(@Param("startRow") int startRow, @Param("endRow") int endRow);

	//2.게시글 작성
	public void insert(BoardVO board);
	
	//3.게시글 1개 보기
	public BoardVO read(String board_number);

	//4.게시글 수정
	public int update(BoardVO vo);

	//5.게시글 삭제
	public int delete(String board_number);
	
	//6.게시글 검색
	public List<BoardVO> search(String title);

	
	//7.좋아요 추가
	public int updateLikes(String board_number);

	//8.관심 추가
	public int updateInterest(String board_number);

	//9.좋아요 취소
	public int cancelLikes(String board_number);

	//10.관심 취소
	public int cancelInterest(String board_number);

	//11.조회수 1 증가
	public int updateViews(String board_number);
	
	//12.조회수 1 감소
	public int cancelViews(String board_number);


	//13.cart에 좋아요 추가
	public int insertLike(CartVO cart);

	//14.cart에 관심 추가
	public int insertInterest(CartVO cart);
	
	//15.cart에 좋아요,관심 추가 / 버튼 상태
	public int insert_both(CartVO cart);

	//16.cart에 좋아요,관심 있을때 좋아요 취소
	public int cancelLike(CartVO cart);

	//17.cart에 좋아요,관심 있을때 관심 취소
	public int cancelInterest2(CartVO cart);
	
	//18.1개 취소
	public int cancel_both(CartVO cart);
	
	//19.get.jsp용 리스트 가져오기
	public CartVO get_cart(CartVO cart);
	
	//20.판매상태만 변경하기
	public int set_status(BoardVO board);
	
	//21.페이징 처리 리스트 출력
	public List<BoardVO> getMoreList(Criteria cri);
		
	//22.게시물의 전체 개수 구함
	public int getTotalCount(Criteria cri);
	
	
	//구매확정시 -> 후기 작성기능 활성화
	
}//class end
