package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.BoardVO;

@Mapper
public interface Sell_list_mapper {
	
	
	// 특정 회원의 판매물품 리스트 가져오기
	List<BoardVO> getBoardsByMemberNumber(String member_number);
}
