<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>JSONTest</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#checkJson").click(function() {
			
			var member = {
				id : "son",
				name : "손흥민",
				pwd : "1313",
				email : "son@test.com"
			};
			
			$.ajax({
				type : "post",
				url : "${contextPath}/test/info1",
				contentType : "application/json",
				data : JSON.stringify(member), // 회원정보를 json 문자열로 변환
				success : function(data, textStatus) {
					alert(data);
					// url 경로 대상 info1()메서드의 반환값을 data 변수로 받아 alert 출력.
				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다.");
				},
				complete : function(data, textStatus) {
				}
			}); //end ajax	
			// Ajax를 통해 데이터를 전송할 때는 HTTP 요청의 본문(body)에 데이터를 포함시킴.
			// Ajax : 적은 양의 데이터(주로 json)를 비동기식으로 전송.

		});
	});
</script>
</head>
<body>
	<input type="button" id="checkJson" value="회원 정보 보내기" />
	<br>
	<br>
	<div id="output"></div>
</body>
</html>