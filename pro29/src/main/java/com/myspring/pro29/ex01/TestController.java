package com.myspring.pro29.ex01;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


// @RestController내부 메서드의 반환 값은 ViewResolver를 거치지 않고, 
// 직접 HTTP 응답의 본문으로 전송됨.

// @RestController는 @Controller와 @ResponseBody 애노테이션을 합친 것으로, 
// 컨트롤러의 모든 메서드에 @ResponseBody가 자동으로 적용된 상태입니다. 
// @ResponseBody는 메서드의 반환값을 HTTP 응답 본문에 직접 쓰기 위해 사용되며, 
// 반환되는 객체는 JSON 형식으로 변환됩니다.


@RestController
@RequestMapping(value = "/test/*")
//@RequestMapping(value = "/test/*", produces = "text/html;charset=UTF-8")
//뷰리졸버 거치지 않고 바로 반환하기 때문에, RequestMapping의 produces 속성을 통해 한글 가능.
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping("/테스트")
	//web.xml에 인코딩 필터를 적용하면 @RequestMapping의 URL 매핑에도 한글이 가능.
	public String hello() {
		logger.info("hello 메서드 실행함");
		
		return "REST 테스트 진행";
	}
	
	
	
	  @RequestMapping("/member")
	  public MemberVO member() {
		  
	    MemberVO vo = new MemberVO();
	    
	    vo.setId("hong");
	    vo.setPwd("1234");
	    vo.setName("홍길동");
	    vo.setEmail("hong@test.com");
	    
	    logger.info(String.valueOf(vo));
	    logger.info(vo.toString());
	    
	    return vo;
	    
	  } 
	  
	  //  @RestController의 메서드에 MemberVO 객체를 반환하는 경우, 
	  // Spring MVC는 해당 객체를 JSON 형식으로 변환하여 응답으로 전송합니다. 
	  // 이는 @RestController 애노테이션이 적용된 컨트롤러에서 사용되는 특징입니다.
	  
	  
	  @RequestMapping("/membersList")
	  public List<MemberVO> listMembers () {
	    List<MemberVO> list = new ArrayList<MemberVO>();
		for (int i = 0; i < 10; i++) {
		  MemberVO vo = new MemberVO();
		  vo.setId("hong"+i);
		  vo.setPwd("123"+i);
		  vo.setName("홍길동"+i);
		  vo.setEmail("hong"+i+"@test.com");
		  list.add(vo);
		}
		logger.info(String.valueOf(list));
		
	    return list; 
	  }	
	  
	  
	  @RequestMapping("/membersMap")
	  public Map<Integer, MemberVO> membersMap() {
	    Map<Integer, MemberVO> map = new HashMap<Integer, MemberVO>();
	    for (int i = 0; i < 10; i++) {
	      MemberVO vo = new MemberVO();
	      vo.setId("hong" + i);
	      vo.setPwd("123"+i);
	      vo.setName("홍길동" + i);
	      vo.setEmail("hong"+i+"@test.com");
	      map.put(i, vo); 
	    }
	    logger.info(String.valueOf(map));
	    
	    return map; 
	  }
	  
	  
	  
	  // @RequestParam은 URL 경로 이후 '?' 쿼리 파라미터로 전달되는 값을 사용하는 것이고,
	  // @PathVariable은 URL 경로의 일부로 전달되는 값을 바인딩하는 데 사용됨.
	  
	  // @GetMapping은 @RequestMapping의 축약형으로서, GET 메서드에 대한 매핑을 간편하게 지정.
	  // @PathVariable은 주로 GET 메서드와 함께 사용. POST는 부적합.
	  @RequestMapping(value= "/notice/{str}" , method = RequestMethod.GET)
	  public String notice(@PathVariable("str") String str ) throws Exception {
		  // @PathVariable("str")에서 "str" 은 위의 매핑 값의 {str}와 일치해야하며,
		  // 매핑값의 {str}과 매개변수 String str의 변수명이 일치하면, ("str") 생략 가능.
		  
		  logger.info(str);
		  
		  return str;
	  }
	  
	  
	  // @RequestBody 어노테이션은 @RestController가 적용된 클래스에서 주로 사용.
	  // @RequestBody는 주로 HTTP 요청의 본문(body)에서 데이터를 추출하기 위해 사용.(POST)
	  // @RequestBody 어노테이션은 주로 JSON이나 XML과 같은 구조화된 데이터를 전송받을 때 사용.
	  // 즉, form 태그를 통해 전송된 데이터는 @RequestParam이나 @ModelAttribute을 사용.
	  @RequestMapping(value= "/info", method = RequestMethod.POST)
	  public void modify(@RequestBody MemberVO vo ){
	    logger.info(vo.toString());
	  }
	  // 여기서는 @RequestBody를 통해 요청 본문의 값들을 받아서 vo객체로 자동 매핑.
	  // GET 메서드는 주로 URL 파라미터를 통해 데이터를 전달하는 방식이므로,
	  // @RequestBody 어노테이션은 GET 메서드와 함께 사용할 수 없음. POST로 전달받아야함.
	  
	  
	  
	  @RequestMapping("/membersList2")
	  public  ResponseEntity<List<MemberVO>> listMembers2() {
			List<MemberVO> list = new ArrayList<MemberVO>();
			for (int i = 0; i < 10; i++) {
			  MemberVO vo = new MemberVO();
			  vo.setId("lee" + i);
			  vo.setPwd("123"+i);
			  vo.setName("이순신" + i);
		      vo.setEmail("lee"+i+"@test.com");
			  list.add(vo);
			}
			
		    return new ResponseEntity(list, HttpStatus.INTERNAL_SERVER_ERROR);
		    // (ResponseEntity(T body, HTTP 상태코드)) 여기선 오류코드 500으로 응답.
		  }
	  
	  
		//HttpEntity	헤더와 본문으로 구성된  HTTP 요청 또는 응답 엔터티를 나타냅니다.
//		@RequestMapping("/hi2") //	HttpStatusCode 상태 코드를 추가하는 HttpEntity의 확장입니다. RestTemplate과 @Controller 메서드에서 사용됩니다.
//		ResponseEntity fsdfsd2(){
//			//System.out.print("여기는 RestController여");
//			HttpHeaders responseHeaders= new HttpHeaders();
//			
//			responseHeaders.add("Content-Type", "text/html;charset=utf-8");
//			
//			logger.info("여기는 RestController여2");
//			//return "nice" + "한글" ;
//			return new ResponseEntity("hihi" + "한글",responseHeaders,  HttpStatus.CREATED);  //HttpStatus.CREATED 	201 Created. 요청이 성공적이었으며 그 결과로 새로운 리소스가 생성되었다는 의미
//		}
		// produce 속성 대신 한글 적용 방법
	  
	  
	  
	  
	  	//  HttpHeaders를 사용하여 Content-Type을 "text/html; charset=utf-8"로 설정합니다. 
	  	// 이렇게 함으로써 응답의 본문을 UTF-8로 인코딩하여 전달합니다. 
	  	// 이는 ResponseEntity의 생성자에서 HttpHeaders를 구성함으로써 이루어짐.
		@RequestMapping(value = "/res3")
		public ResponseEntity res3() {
			HttpHeaders responseHeaders = new HttpHeaders();
		    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		    String message = "<script>";
			message += " alert('새 회원을 등록합니다.');";
			message += " location.href='/pro29/test/membersList2'; ";
			message += " </script>";
			
			return  new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			 // (ResponseEntity(T body, MultiValueMap<String, String> header , HTTP 상태코드))
		}
		
		
		// produces 속성을 사용하여 응답의 Content-Type을 "text/html;charset=UTF-8"로 설정. 
		// 이렇게 함으로써 해당 핸들러 메서드가 반환하는 문자열을 UTF-8로 인코딩 (메서드가 지원하는 미디어 타입을 지정)
		@RequestMapping(value = "/res4", produces = "text/html;charset=UTF-8")
		public String res4() {
		    String message = "<script>";
			message += " alert('새 회원을 등록합니다.');";
			message += " location.href='/pro29/test/membersList2'; ";
			message += " </script>";
			
			return  message;
		}
	  
		
		// JSONTest.jsp의 ajax활용.
		 @RequestMapping(value= "/info1", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
		  public String info1(@RequestBody MemberVO vo ){
		    logger.info(vo.toString());
		    
			return vo.toString();
		  }
		 
		 //  AJAX의 url 속성에 지정한 대상은 실제로 해당 메서드를 직접 호출하는 것이 아님. 
		 // AJAX 요청은 웹 브라우저에서 비동기적으로 서버에 HTTP 요청을 보내는 것이며, 
		 // 서버는 해당 요청을 처리하는 메서드를 실행한 후 응답을 반환.
		 // 즉, 대상 메서드의 반환값을 사용하려면 success 속성 등에서 data 매개변수를 활용해야함.
}
