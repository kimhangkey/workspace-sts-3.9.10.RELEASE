package com.kimhangkey.thelimited.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.kimhangkey.thelimited.goods.vo.GoodsVO;

public interface AdminGoodsService {
	
	// 상품관리
	public List<GoodsVO> listNewGoods(Map condMap) throws Exception;

	// 상품추가
	public int addNewGoods(Map newGoodsMap) throws Exception;
	
	// 이미지 데이터 추가
	public void addNewGoodsImage(List imageFileList) throws Exception;

	// 상품삭제
	public void deleteGoods(String goods_id) throws Exception;
	
	// 상품수정
	public void modifyGoods(String goods_id, Map newGoodsMap) throws Exception;
}
