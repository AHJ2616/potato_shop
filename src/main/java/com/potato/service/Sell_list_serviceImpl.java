package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.BoardVO;
import com.potato.mapper.Sell_list_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Service
@Log4j2
@AllArgsConstructor
public class Sell_list_serviceImpl implements Sell_list_service {
	
	@Autowired
    private Sell_list_mapper sell_list_mapper;
	
	
	@Override
	public List<BoardVO> getBoardsForMember(String member_number) {
		// 특정 회원의 판매물품 리스트 가져오기
		return sell_list_mapper.getBoardsByMemberNumber(member_number);
	}

}
