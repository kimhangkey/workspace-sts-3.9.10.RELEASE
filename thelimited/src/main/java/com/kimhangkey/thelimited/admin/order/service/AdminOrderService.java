package com.kimhangkey.thelimited.admin.order.service;

import java.util.List;
import java.util.Map;

import com.kimhangkey.thelimited.order.vo.OrderVO;

public interface AdminOrderService {

	// 주문목록
	public List<OrderVO> listNewOrder(Map condMap) throws Exception;

	// 주문수정 - 배송수정
	public void modifyDeliveryState(Map deliveryMap) throws Exception;
}
