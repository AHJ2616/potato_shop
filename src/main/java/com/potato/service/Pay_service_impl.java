package com.potato.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.potato.domain.PayVO;
import com.potato.mapper.Pay_mapper;

@Service
public class Pay_service_impl implements Pay_service {
	
	@Autowired
    private Pay_mapper pay_mapper;
	
	// 머니 충전
    @Override
    public boolean chargePay(PayVO payVO) {
        try {
            // 충전 정보 저장
        	pay_mapper.chargePay(payVO);
            // 송금하는 회원의 가상머니 증가
        	pay_mapper.incrementPay(payVO.getFrom_member_number(), payVO.getPay_amount());
            return true; // 성공
        } catch (Exception e) {
            // 예외 발생 시 로깅 등 처리
            return false; // 실패
        }
    }
    
    // 포인트를 머니로 전환
    @Override
    public boolean convertPointsToPay(String member_number, long point) {
        // 필요한 로직 추가
        int rowsAffected = pay_mapper.convertPointsToPay(member_number, point);
        return rowsAffected > 0; // 성공적으로 업데이트되었는지 여부 반환
    }
    
    //채팅방의 board_number를 이용해 해당 상품 가격 가져오기
    @Override
    public int getProductPrice(String board_number) {
        return pay_mapper.findPriceByBoardNumber(board_number);
    }
}
