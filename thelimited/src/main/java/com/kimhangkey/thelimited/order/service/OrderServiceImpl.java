package com.kimhangkey.thelimited.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kimhangkey.thelimited.order.dao.OrderDAO;
import com.kimhangkey.thelimited.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	//주문하기
	@Override
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception{
		//주문하기
		orderDAO.insertNewOrder(myOrderList);
		
		//카트에서 주문 상품 제거한다.
		orderDAO.removeGoodsFromCart(myOrderList);
	}	
}
