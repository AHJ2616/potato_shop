package com.potato.service;

import java.util.List;

import com.potato.domain.BoardVO;

public interface BoardService {
	
public List<BoardVO> getList();
	
	public void register(BoardVO board);
	
	public BoardVO get(Long board_number);				
	
	public boolean modify(BoardVO board);		
	
	public boolean remove(Long board_number);	
	
	public void modifyInterest(Long board_number);
	
	public void modifyLikes(Long board_number);
	
}
