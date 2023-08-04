package com.kimhangkey.thelimited.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kimhangkey.thelimited.goods.dao.GoodsDAO;
import com.kimhangkey.thelimited.goods.vo.GoodsVO;
import com.kimhangkey.thelimited.goods.vo.ImageFileVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	//메인페이지 - 지정 status별, 메뉴별
	@Override
	public Map<String, List<GoodsVO>> listGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsMap = new HashMap<String, List<GoodsVO>>();

		//신상 저장
		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("new");
		goodsMap.put("new", goodsList);

		//인기상품 저장
		goodsList = goodsDAO.selectMenusList("pop");
		goodsMap.put("pop", goodsList);

		//할인상품 저장
		goodsList = goodsDAO.selectMenusList("disc");
		goodsMap.put("disc", goodsList);

		
		//위 정보를 담은 Map return
		return goodsMap;
	}

	
	
	//header 카테고리별
	@Override
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception {
		List goodsList = goodsDAO.selectGoodsByMenuGoods(menuGoods);
		return goodsList;
	}
	
	

	//추천키워드
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list = goodsDAO.selectKeywordSearch(keyword);
		return list;
	}

	
	//검색
	@Override
	public List<GoodsVO> searchGoods(String searchWord) throws Exception {
		List goodsList = goodsDAO.selectGoodsBySearchWord(searchWord);
		return goodsList;
	}
	

	//상품상세
	@Override
	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap = new HashMap();
		//상품상세정보 추출
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_id);
		goodsMap.put("goodsVO", goodsVO);
		
		//상품 상세이미지 추출
		List<ImageFileVO> imageList = goodsDAO.selectGoodsDetailImage(_goods_id);
		goodsMap.put("imageList", imageList);
		
		//위 정보를 담은 Map return
		return goodsMap;
	}
}
