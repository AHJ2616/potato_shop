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
		log.info("보드서비스IMPL getList 메서드 실행");
		return mapper.getList();
	}

	@Override
	public void register(BoardVO board) {
		log.info("보드서비스IMPL register 메서드 실행");
		mapper.insert(board);
	}

	@Override
	public BoardVO get(Long board_number) {
		log.info("보드서비스IMPL get 메서드 실행");
		return mapper.read(board_number);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("보드서비스IMPL modify 메서드 실행");
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long board_number) {
		log.info("보드서비스IMPL remove 메서드 실행");
		return mapper.delete(board_number) == 1;
	}
	
	@Override
	public void modifyLikes(Long board_number) {
        mapper.updateLikes(board_number);
    }
	
	@Override
	public void modifyInterest(Long board_number) {
        mapper.updateInterest(board_number);
    }


}
