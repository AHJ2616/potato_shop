package com.potato.service;

import java.util.List;

import com.potato.domain.ComentsVO;

public interface EtcService {
	
	//1. 고객편지 쓰기
	public int send_coments(ComentsVO coments);
		
	//2. 고객편지 보기
	public List<ComentsVO> get_coments();
	
}
