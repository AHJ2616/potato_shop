package com.potato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ComentsVO {
	private String message;
	private String id;
	private Date regidate;
	private String ip_address;
	
}
