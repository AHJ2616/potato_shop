package com.potato.service;

import com.potato.domain.ComentsVO;

public interface EtcService {
	
	//개선사항 설문작성
	public int send_coments(ComentsVO coments);
	
}
