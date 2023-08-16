package com.kimhangkey.thelimited.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.kimhangkey.thelimited.order.vo.OrderVO;

public interface OrderDAO {

	// 주문하기
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;

	// 주문완료시 쇼핑카트에서 상품 제거
	public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException;
}
