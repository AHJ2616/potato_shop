package com.potato.service;

import com.potato.domain.PayVO;

public interface Pay_service {
	
	// 충전 기능
    boolean chargePay(PayVO payVO);
    
    // 포인트를 머니로 전환
    boolean convertPointsToPay(String member_number, long point);
    
    //채팅방의 board_number를 이용해 해당 상품 가격 가져오기
    int getProductPrice(String board_number);
}
