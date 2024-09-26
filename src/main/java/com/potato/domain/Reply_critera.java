package com.potato.domain;

import lombok.Data;

@Data
public class Reply_critera {
	private int pageNum;
	private int amount;
	
	public Reply_critera() {
	  this(1, 10);
	}
	
	public Reply_critera(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
	}
}
