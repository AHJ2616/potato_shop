package com.potato.domain;

import lombok.Data;

@Data
public class MannerVO {
	
	private int manner_number;	// 매너칭찬 번호
    private String description;	// 항목들
    private int mcount;		// 선택 카운트
    private String member_number;	// 해당 회원번호
}
