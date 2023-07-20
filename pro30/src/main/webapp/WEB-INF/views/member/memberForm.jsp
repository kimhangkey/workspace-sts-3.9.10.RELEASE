<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
<style>
.text_center {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
	function pwd_check() {
		var pwd = document.getElementById("pwd").value;
	    var pwd2 = document.getElementById("pwd2").value;
	    var pwdComment = document.getElementById("pwd_comment");
	    var subComment = document.getElementById("submit_comment");
	    var submit = document.getElementById("submit");
	    

	    if (pwd === "" || pwd2 === "") {
	    	pwdComment.textContent = "";
	    } else if(pwd === pwd2) {
	    	pwdComment.style.color = "blue";
	        pwdComment.textContent = "비밀번호가 일치합니다.";
	        subComment.textContent = "";
	        submit.disabled = "";
	    
	    } else if(pwd2 == "skek") {
	    	pwdComment.style.color = "green";
	    	pwdComment.textContent = "환영합니다. 대장.";
	    
	        
	    } else {
	        pwdComment.style.color = "red";
	        pwdComment.textContent = "비밀번호 불일치. 재입력 바람";
	        submit.disabled = "disabled";
	        subComment.textContent = "비밀번호 확인 후 다시 시도하세요.";
	    }
	}

</script>
<body>
	<form method="post" action="${contextPath}/member/addMember.do">
		<h1 class="text_center">회원 가입창</h1>
		<table align="center">
			<tr>
				<td width="200"><p align="right">아이디</td>
				<td width="400" align="left"><input type="text" name="id"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호</td>
				<td width="400" align="left">
					<input type="password" name="pwd" id="pwd" oninput="pwd_check()" ></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호확인</p></td>
				<td width="400" align="left">
					<input type="password" id="pwd2" oninput="pwd_check()" >
					<span id="pwd_comment"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이름</td>
				<td width="400" align="left">
						<input type="text" name="name"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이메일</td>
				<td width="400" align="left">
						<input type="text" name="email"></td>
			</tr>
			<tr>
				<td width="200"><p>&nbsp;</p></td>
				<td width="400" align="left">
					<input type="submit" value="가입하기" id="submit">
					<input type="reset" value="다시입력">
					<span id="submit_comment"></td>
				</td>
			</tr>
		</table>
	</form>
</body>