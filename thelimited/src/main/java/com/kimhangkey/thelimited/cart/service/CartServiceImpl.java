package com.kimhangkey.thelimited.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimhangkey.thelimited.cart.dao.CartDAO;
import com.kimhangkey.thelimited.cart.vo.CartVO;
import com.kimhangkey.thelimited.goods.vo.GoodsVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	// 장바구니
	@Override
	public Map<String, List> myCartList(CartVO cartVO) throws Exception {
		Map<String, List> cartMap = new HashMap<String, List>();

		//장바구니 정보 가져와 list에 저장
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		
		System.out.println("서비스 카트리스트 : " + myCartList);
		
		//리스트가 없는 경우 return null
		if (myCartList.size() == 0) {return null;}
		
		//장바구니 리스트에 맞는 goodList를 cartMap에 put 해 리턴. 
		List<GoodsVO> myGoodsList = cartDAO.selectGoodsList(myCartList);
		
		System.out.println("굿즈리스트 개수 : " + myGoodsList);
		
		try {
			cartMap.put("myCartList", myCartList);
			cartMap.put("myGoodsList", myGoodsList);
		} catch (Exception e) {e.printStackTrace();}

		return cartMap;
	}

	
	// 장바구니 추가, 중복여부 확인 후 추가한다.
	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);	
		}
	
	@Override
	public void addGoodsInCart(CartVO cartVO) throws Exception {
		cartDAO.insertGoodsInCart(cartVO);
		}

	
	// 장바구니 삭제
	@Override
	public void removeCartGoods(int cart_id) throws Exception {
		cartDAO.deleteCartGoods(cart_id);
		}

	
	// 장바구니 수정
	@Override
	public boolean modifyCartQty(CartVO cartVO) throws Exception {
		boolean result = true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}
}
