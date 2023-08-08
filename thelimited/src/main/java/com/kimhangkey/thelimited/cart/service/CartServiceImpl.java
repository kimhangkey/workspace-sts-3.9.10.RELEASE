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

	// 쇼핑카트
	@Override
	public Map<String, List> myCartList(CartVO cartVO) throws Exception {
		Map<String, List> cartMap = new HashMap<String, List>();

		//쇼핑카트 정보 가져와 list에 저장
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		
		
		//리스트가 없는 경우 return null
		if (myCartList.size() == 0) {return null;}
		
		//쇼핑카트 리스트에 맞는 goodList를 cartMap에 put 해 리턴. 
		List<GoodsVO> myGoodsList = cartDAO.selectGoodsList(myCartList);
		
		
		try {
			cartMap.put("myCartList", myCartList);
			cartMap.put("myGoodsList", myGoodsList);
		} catch (Exception e) {e.printStackTrace();}

		return cartMap;
	}

	
	// 쇼핑카트 추가, 중복여부 확인 후 추가한다.
	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);	
		}
	
	@Override
	public void addGoodsInCart(CartVO cartVO) throws Exception {
		cartDAO.insertGoodsInCart(cartVO);
		}

	
	// 쇼핑카트 삭제
	@Override
	public void removeCartGoods(int cart_id) throws Exception {
		cartDAO.deleteCartGoods(cart_id);
		}

	
	// 쇼핑카트 수정
	@Override
	public boolean modifyCartQty(CartVO cartVO) throws Exception {
		boolean result = true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}
	
	// 쇼핑카트 수량(메인화면)
	@Override
	public String countCart(String member_id) throws Exception {
		return cartDAO.countCart(member_id);
	}
}
