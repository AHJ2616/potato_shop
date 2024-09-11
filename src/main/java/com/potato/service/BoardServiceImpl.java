package com.potato.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.potato.domain.BoardVO;
import com.potato.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public void register(BoardVO board) {
		mapper.insert(board);
	}

	@Override
	public void registerCart(BoardVO board) {
		
		switch(board.getType()) {
		case "likes":
			mapper.insertLike(board);
			break;
		
		case "interest":
			mapper.insertInterest(board);
			break;
			
		default:
			throw new IllegalArgumentException("타입인식 오류");
		}
	}
	
	@Override
	public BoardVO get(String board_number) {
		return mapper.read(board_number);
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(String board_number) {
		return mapper.delete(board_number) == 1;
	}

	@Override
	public void updateValues(BoardVO board) {
		
		switch (board.getType()) {
		case "likes":
			mapper.insertLike(board);
			mapper.updateLikes(board);
			break;

		case "interest":
			mapper.insertInterest(board);
			mapper.updateInterest(board);
			break;

		case "views":
			mapper.updateViews(board);
			break;

		default:
			throw new IllegalArgumentException("타입인식 오류");
		}
	}


}
