<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=utf-8"%>


<!-- 위의 page directive에서 인코딩설정(contentType) 혹은 response를 통해 setContentType-->
<%-- <% response.setContentType("text/html;charset=utf-8"); %> --%>
<!-- res.setCon~ : 표현언어 등 자바코드 결과의 반환 타입을 utf-8로 해줌. 
	 따라서 html문서 한글까지 번역하려면 page directive에서 인코딩설정(contentType)-->
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! wow??12333
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
