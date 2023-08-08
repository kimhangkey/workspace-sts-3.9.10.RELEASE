package com.kimhangkey.thelimited.cart.service;

import java.util.List;
import java.util.Map;

import com.kimhangkey.thelimited.cart.vo.CartVO;

public interface CartService {
	
	// 쇼핑카트
	public Map<String, List> myCartList(CartVO cartVO) throws Exception;

	// 쇼핑카트 추가
	boolean findCartGoods(CartVO cartVO) throws Exception;

	public void addGoodsInCart(CartVO cartVO) throws Exception;

	// 쇼핑카트 삭제
	public void removeCartGoods(int cart_id) throws Exception;

	// 쇼핑카트 수정
	public boolean modifyCartQty(CartVO cartVO) throws Exception;
	
	// 쇼핑카트 수량 체크
	public String countCart(String member_id) throws Exception;
}
