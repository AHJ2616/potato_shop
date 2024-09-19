package com.potato.service;

import java.util.List;

import com.potato.domain.BoardVO;
import com.potato.domain.CartVO;

public interface BoardService {
	
	//getList
	public List<BoardVO> getList();
	
	//insert
	public void register(BoardVO board);
	
	//read
	public BoardVO get(String board_number);				
	
	//update
	public boolean modify(BoardVO board);		
	
	//delete
	public boolean remove(String board_number);	
	
	// 추후 아이디당 1회성으로 코드 변경

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
		
	public int insertLike(CartVO cart);

	//완
	public int insertInterest(CartVO cart);
	
	//좋아요 , 관심 둘 다 누른경우
	public int insert_both(CartVO cart);

	//완
	public int cancelLike(CartVO cart);

	//완
	public int cancelInterest2(CartVO cart);
	
	// 1개 취소
	public int cancel_both(CartVO cart);
	
	//완
	public CartVO get_cart(CartVO cart);

}
