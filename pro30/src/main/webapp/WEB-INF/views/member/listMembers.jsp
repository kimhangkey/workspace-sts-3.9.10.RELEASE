<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>


</head>
<body>
<script>
  function updateInputName() {
    var selectElement = document.getElementById("option");
    var selectedValue = selectElement.value;
    var inputValueElement = document.getElementById("input_value");
    inputValueElement.name = selectedValue;
    console.log(selectedValue);
    console.log(inputValueElement);
  }
</script>

	<div align="center">
		<form method="post"
			action="${contextPath}/member/searchMember.do" >
			<h2>회원 검색</h2>
			<select name="option" id="option" onchange="updateInputName()">
				<option value="total" >전체</option>
				<option value="id">아이디</option>
				<option value="pwd">비밀번호</option>
				<option value="name">이름</option>
				<option value="email">이메일</option>
				<option value="id_email">아이디+이메일</option>
			</select> 
			<input type="text" name="total" id="input_value" /> 
			<input type="submit" value="검색" /> <br>
			<br>
		</form>
	</div>

	<table border="1" align="center" width="80%">
		<tr align="center" bgcolor="lightgreen">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>가입일</b></td>
			<c:if test="${member.id == 'admin' }">
				<td><b>회원 수정</b></td>
				<td><b>회원 삭제</b></td>
			</c:if>
		</tr>

		<c:forEach var="mem" items="${membersList}">
			<tr align="center">
				<td>${mem.id}</td>
				<td>${mem.pwd}</td>
				<td>${mem.name}</td>
				<td>${mem.email}</td>
				<td>${mem.joinDate}</td>
				<c:if test="${member.id == 'admin' }">
					<td><a href="${contextPath}/member/modMemberForm.do?id=${mem.id}">수정</a></td>
					<td><a href="${contextPath}/member/removeMember.do?id=${mem.id}">삭제</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<a href="${contextPath}/member/memberForm.do"><h1 style="text-align: center">회원가입</h1></a>
	<!-- WEB-INF 폴더 안에 있는 JSP 파일은 주소창에서 직접 접근할 수 없습니다. 
		 이는 보안상의 이유로 인해 설정되어 있는 기본 동작입니다.  
		 따라서 controller로 넘어가게 해서 modelandview 반환을 통해, 
		 dispatcher가 viewResolver를 이용하여 접근하도록 해야함. -->
</body>
</html>
