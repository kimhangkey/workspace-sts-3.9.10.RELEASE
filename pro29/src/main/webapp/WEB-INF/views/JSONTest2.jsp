<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<title>JSONTest2</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>  
<script>

	$(function() {
		$("#checkJson").click(function() {
			
			var article = {
				articleNO : "154",
				writer : "박지성",
				title : "안녕하세요",
				content : "상품 소개 글입니다."
			};
			
			var artNO = article.articleNO;

			$.ajax({
				type:"POST",
				url:"${contextPath}/boards",
				//type : "PUT",
				//url : "${contextPath}/boards/"+artNO,
				//type : "DELETE",
				//url : "${contextPath}/boards/114",
				contentType : "application/json",
				data : JSON.stringify(article),
				success : function(data, textStatus) {
					alert(data);
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다.");
					
				},
				complete : function(data, textStatus) {
				}
			}); //end ajax	
			
			// Ajax 요청은 HTTP 요청의 본문(body)에 데이터를 담아 서버로 전송하지만,
			// GET 방식으로 요청을 보내면  데이터를 본문에 담아 보내는 것이 아니라 URL의 파라미터로 전달함.
			// 따라서 Ajax에서 get방식은 사용하지 않음.

		});
	});
</script>
</head>
<body>
  <input type="button" id="checkJson" value="새글 쓰기"/><br><br>
  <div id="output"></div>
</body>
</html>