package com.kimhangkey.thelimited.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimhangkey.thelimited.order.vo.OrderVO;

public interface OrderController {

	// 개별주문
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 다중주문
	public ModelAndView orderAllCartGoods(@RequestParam String[] cart_goods_qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 결제하기
	public ModelAndView payToOrderGoods(@RequestParam Map<String, String> orderMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 결제실패
	public ModelAndView payFail(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
