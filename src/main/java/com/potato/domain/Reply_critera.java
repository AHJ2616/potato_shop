package com.potato.domain;

import lombok.Data;

@Data
public class Reply_critera {
	private int pageNum;
	private int amount;
	
	private int offset;
	private int limit;
	
	public Reply_critera() {
	  this(1, 10);
	}
	
	
	
//	public ReplyCritera(int pageNum, int amount) {
//    this.pageNum = pageNum;
//    this.amount = amount;
//	}
	
	public Reply_critera(int offset, int limit) {
		this.offset = offset;
		this.limit = limit;
}
}
