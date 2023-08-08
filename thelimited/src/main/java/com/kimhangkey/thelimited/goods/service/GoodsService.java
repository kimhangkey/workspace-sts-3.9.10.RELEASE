package com.kimhangkey.thelimited.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kimhangkey.thelimited.goods.vo.GoodsVO;

public interface GoodsService {

	// 메인페이지 - 지정 status별
	public Map<String, List<GoodsVO>> listGoods() throws Exception;

	// header 카테고리별
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception;

	// 추천키워드
	public List<String> keywordSearch(String keyword) throws Exception;

	// 검색
	public List<GoodsVO> searchGoods(HashMap<String, String> searchMap) throws Exception;

	// 상품상세
	public Map goodsDetail(String _goods_id) throws Exception;
}
