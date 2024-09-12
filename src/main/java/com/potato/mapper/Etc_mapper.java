package com.potato.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.potato.domain.ComentsVO;

@Mapper
public interface Etc_mapper {
	
	public int send_coments(ComentsVO coments);

}
