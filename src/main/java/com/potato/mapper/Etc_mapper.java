package com.potato.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.ComentsVO;

@Mapper
public interface Etc_mapper {
	
	//1. 고객편지 쓰기
	public int send_coments(ComentsVO coments);
	
	//2. 고객편지 보기
	public List<ComentsVO> get_coments();
	
}
