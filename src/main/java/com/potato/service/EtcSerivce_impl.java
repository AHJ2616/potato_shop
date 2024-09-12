package com.potato.service;

import org.springframework.stereotype.Service;

import com.potato.domain.ComentsVO;
import com.potato.mapper.Etc_mapper;
import com.potato.mapper.Member_mapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class EtcSerivce_impl implements EtcService{
	
	Etc_mapper mapper;

	@Override
	public int send_coments(ComentsVO coments) {
		// TODO 개선사항 설문
		return mapper.send_coments(coments);
	}

}
