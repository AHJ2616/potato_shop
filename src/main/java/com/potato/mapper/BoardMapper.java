package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;

@Mapper
public interface BoardMapper {
	
	//완 완
	public List<BoardVO> getList();

	//완 완
	public void insert(BoardVO board);
	
	//완 완
	public BoardVO read(String board_number);

	//완 완
	public int update(BoardVO vo);

	//완 완
	public int delete(String board_number);

	// 추후 아이디당 1회성으로 코드 변경
	
	//완
	public int updateLikes(String board_number);

	//완
	public int updateInterest(String board_number);

	//완
	public int cancelLikes(String board_number);

	//완
	public int cancelInterest(String board_number);

	//완
	public int updateViews(String board_number);
	
	public int cancelViews(String board_number);
	
	// 좋아요, 관심 버튼 장바구니
	

	//완
	public int insertLike(CartVO cart);

	//완
	public int insertInterest(CartVO cart);
	
	//좋아요 , 관심 둘 다 누른경우
	public int insert_both(CartVO cart);

	//2개 다 누른경우 취소
	public int cancelLike(CartVO cart);

	//2개 다 누른경우 취소
	public int cancelInterest2(CartVO cart);
	
	// 1개 취소
	public int cancel_both(CartVO cart);
	
	//get.jsp용 리스트 가져오기
	public CartVO get_cart(CartVO cart);
}
