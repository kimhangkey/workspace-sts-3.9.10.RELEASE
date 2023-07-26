<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/login.css">

</head>
<body>
	<div class="container d-flex justify-content-center align-items-center">
		<div class="card">
			<div
				class="p-3 border-bottom d-flex align-items-center justify-content-center">
				<h5>Login to HexGig</h5>
			</div>
			<div class="p-3 px-4 py-4 border-bottom">
				<input type="text" class="form-control mb-2"
					placeholder="Email/Username" />
				<div class="form">
					<input type="text" class="form-control" placeholder="Password" />
					<a href="#">Forgot?</a>
				</div>
				<button class="btn btn-danger btn-block continue">Continue</button>
				<div
					class="d-flex justify-content-center align-items-center mt-3 mb-3">
					<span class="line"></span> <small class="px-2 line-text">OR</small>
					<span class="line"></span>
				</div>
				<button
					class="btn btn-danger btn-block continue facebook-button d-flex justify-content-start align-items-center">
					<i class="fa fa-facebook ml-2"></i> <span class="ml-5 px-4">Continue
						with facebook</span>
				</button>
				<button
					class="btn btn-danger btn-block continue google-button d-flex justify-content-start align-items-center">
					<i class="fa fa-google ml-2"></i> <span class="ml-5 px-4">Continue
						with Google</span>
				</button>
			</div>
			<div
				class="p-3 d-flex flex-row justify-content-center align-items-center member">
				<span>Not a member? </span> <a href="#"
					class="text-decoration-none ml-2">SIGNUP</a>
			</div>
		</div>
	</div>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>