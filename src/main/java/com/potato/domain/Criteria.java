package com.potato.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; // 페이지 번호
	private int amount; // 데이터 개수
	
	private String type; // 검색 타입
	private String keyword; // 검색어 키워드
	
	public Criteria() {
		this(1, 18); // 페이지번호 기본값 1페이지, 한 페이지당 10개씩 데이터 출력
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getListLink() { 
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount());
		
		return builder.toUriString();
	}
}
