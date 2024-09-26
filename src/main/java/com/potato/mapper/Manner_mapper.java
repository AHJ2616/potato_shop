package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.MannerVO;

@Mapper
public interface Manner_mapper {
	
	// 회원의 매너칭찬 리스트 조회
	List<MannerVO> findAllByMember(String member_number);

	// 칭찬하기 데이터 전송
	int incrementMannerCount(int manner_number, String member_number);
}
