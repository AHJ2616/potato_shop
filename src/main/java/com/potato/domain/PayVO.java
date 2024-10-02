package com.potato.domain;

import lombok.Data;

@Data
public class PayVO {
	
	private String id;                     // 결제 고유 번호
    private String from_member_number;     // 송금하는 사람
    private String to_member_number;       // 받는 사람
    private long pay_amount;             // 가상머니 송금할 금액
    private long point_amount;           // 적립 포인트
    private String pay_date;               // 송금 날짜
}
