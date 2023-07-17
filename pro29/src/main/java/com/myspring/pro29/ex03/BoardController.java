package com.myspring.pro29.ex03;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/boards")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 글 정보 조회(GET)
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ResponseEntity<List<ArticleVO>> listArticles() {
		
		logger.info("listArticles 메서드 호출");
		
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		
		for (int i = 0; i < 10; i++) {
			ArticleVO vo = new ArticleVO();
			vo.setArticleNO(i);
			vo.setWriter("이순신" + i);
			vo.setTitle("안녕하세요" + i);
			vo.setContent("새 상품을 소개합니다." + i);
			list.add(vo);
		}

		return new ResponseEntity(list, HttpStatus.OK);
	}
	
	
	// 해당 번호의 글 조회(GET)
	@RequestMapping(value = "/{articleNO}", method = RequestMethod.GET)
	public ResponseEntity<ArticleVO> findArticle (@PathVariable("articleNO") Integer articleNO) {
		logger.info("findArticle 메서드 호출");
		ArticleVO vo = new ArticleVO();
		vo.setArticleNO(articleNO);
		vo.setWriter("홍길동1");
		vo.setTitle("안녕하세요12");
		vo.setContent("홍길동1 글입니다");
		return new ResponseEntity(vo,HttpStatus.OK);
	}	
	
	
	// 새 글 추가(POST)
	@RequestMapping(value = "", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	public ResponseEntity<String> addArticle (@RequestBody ArticleVO vo) {
		ResponseEntity<String>  resEntity = null;
		try {
			logger.info("addArticle 메서드 호출");
			logger.info(vo.toString());
			resEntity =new ResponseEntity(vo+"새 글 추가(POST)",HttpStatus.OK);
			// vo객체와 문자열의 + 연산으로 vo객체가 문자열로 형변환(toString())
		}catch(Exception e) {
			resEntity = new ResponseEntity(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}	
	// ajax의 url 속성에 url:"${contextPath}/boards" 이렇게 컨트롤러로 접근만 해줘도
	// POST 방식에 대한 메서드가 하나만 정의되어 있기 때문에 addArticle 메서드 실행.
	
	
	//해당 번호의 글 수정(PUT)
	@RequestMapping(value = "/{articleNO}", method = RequestMethod.PUT, produces = "text/html; charset=utf-8")
	public ResponseEntity<String> modArticle (@PathVariable("articleNO") Integer articleNO, @RequestBody ArticleVO vo) {
		ResponseEntity<String>  resEntity = null;
		try {
			logger.info("modArticle 메서드 호출");
			logger.info(vo.toString());
			resEntity =new ResponseEntity(vo+"글 수정(PUT) 번호 : "+articleNO,HttpStatus.OK);
		}catch(Exception e) {
			resEntity = new ResponseEntity(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}
	
	
	//해당 번호의 글 삭제(DELETE)
	@RequestMapping(value = "/{articleNO}", method = RequestMethod.DELETE, produces = "text/html; charset=utf-8")
	public ResponseEntity<String> removeArticle (@PathVariable("articleNO") Integer articleNO) {
		ResponseEntity<String>  resEntity = null;
		try {
			logger.info("removeArticle 메서드 호출");
			logger.info(articleNO.toString());
			resEntity =new ResponseEntity(articleNO + " 글 삭제(DELETE)",HttpStatus.OK);
		}catch(Exception e) {
			resEntity = new ResponseEntity(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}
	
	
	

}
