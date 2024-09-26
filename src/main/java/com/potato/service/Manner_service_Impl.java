package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.MannerVO;
import com.potato.mapper.Manner_mapper;

@Service
public class Manner_service_Impl implements Manner_service{
	
	@Autowired
    private Manner_mapper manner_mapper;
	
	@Override
	public List<MannerVO> getAllMannerItems(String member_number) {
		// 회원의 매너칭찬 리스트 조회
		return manner_mapper.findAllByMember(member_number);
	}

	@Override
	public boolean incrementMannerCount(int manner_number, String member_number) {
		// 칭찬하기 데이터 전송
	    return manner_mapper.incrementMannerCount(manner_number, member_number) > 0; // 업데이트된 행 수 확인
	}

}
