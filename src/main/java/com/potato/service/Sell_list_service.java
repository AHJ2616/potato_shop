package com.potato.service;

import java.util.List;

import com.potato.domain.BoardVO;

public interface Sell_list_service {
	
	// 특정 회원의 판매물품 리스트 가져오기
	List<BoardVO> getBoardsForMember(String member_number);
}
