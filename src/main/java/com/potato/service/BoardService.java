package com.potato.service;

import java.util.List;

import com.potato.domain.BoardVO;

public interface BoardService {
	
public List<BoardVO> getList();
	
	public void register(BoardVO board);
	
	public void registerCart(BoardVO board);
	
	public BoardVO get(String board_number);				
	
	public boolean modify(BoardVO board);		
	
	public boolean remove(String board_number);	
	
	public void updateValues(BoardVO board);
	
}
