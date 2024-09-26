package com.potato.service;

import java.util.List;

import com.potato.domain.MannerVO;

public interface Manner_service {
	
	// 회원의 매너칭찬 리스트 조회
	List<MannerVO> getAllMannerItems(String member_number);
	
	// 칭찬하기 데이터 전송
    boolean incrementMannerCount(int manner_number, String member_number);
}
