package com.potato.domain;

import lombok.Data;

@Data
public class AlarmsVO {
	
	private String alarm_number;
	private String member_number;
	private String target_type;
	private String target_key;
	private String contents;
	private int status;
	
}
