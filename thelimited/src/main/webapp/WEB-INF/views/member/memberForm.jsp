<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/form.css">

</head>
<body>
	<div class="container d-flex justify-content-center align-items-center">
		<div class="card">
			<div
				class="p-3 border-bottom d-flex align-items-center justify-content-center">
				<a href="${contextPath}/main/main.do" class="login_to_home"><h5 class="login_logo">THE LIMITED</h5></a>
			</div>
			<div class="p-3 px-4 py-4 border-bottom">
				<input type="text" class="form-control mb-4"
					placeholder="아이디/이메일" />
				<div class="form">
					<input type="text" class="form-control mb-4" placeholder="비밀번호" />
					<input type="text" class="form-control" placeholder="비밀번호 확인" />
				</div>
				<input type="text" class="form-control mb-4"
					placeholder="이름" />
				<input type="text" class="form-control mb-4"
					placeholder="휴대폰 번호" />
				<button class="btn btn-dark btn-block continue">가입하기</button>
				<div
					class="d-flex justify-content-center align-items-center mt-3 mb-3">
					<span class="line"></span> <small class="px-2 line-text">OR</small>
					<span class="line"></span>
				</div>
				<button
					class="btn btn-primary btn-block continue facebook-button d-flex justify-content-start align-items-center">
					<i class="fa fa-facebook ml-2"></i> <span class="ml-5 px-4">페이스북 계정으로 가입하기</span>
				</button>
				<button
					class="btn btn-danger btn-block continue google-button d-flex justify-content-start align-items-center">
					<i class="fa fa-google ml-2"></i> <span class="ml-5 px-4">구글 계정으로 가입하기</span>
				</button>
			</div>
			<div class="p-3 d-flex flex-row justify-content-center align-items-center member">
				<span>이미 아이디가 있으신가요?</span>
				<a href="${contextPath}/member/loginForm.do" class="text-decoration-none ml-2">로그인하기</a>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>