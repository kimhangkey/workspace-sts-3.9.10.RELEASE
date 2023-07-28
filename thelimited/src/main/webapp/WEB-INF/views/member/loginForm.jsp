<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/form.css">


<!-- 리턴받은 message가 있을 경우 -->
<c:if test='${not empty message }'>
	<script>
	 window.onload=function(){alert("아이디나  비밀번호가 틀립니다. 다시 입력해주세요.");}
	</script>
</c:if>

</head>
<body>

		<div class="container d-flex justify-content-center align-items-center">
			<div class="card">
				<div
					class="p-3 border-bottom d-flex align-items-center justify-content-center">
					<a href="${contextPath}/main/main.do" class="login_to_home"><h5 class="login_logo">THE LIMITED</h5></a>
				</div>
				<div class="p-3 px-4 py-4 border-bottom">
					<form action="${contextPath}/member/login.do" method="post" id="loginForm">
						<input type="text" class="form-control mb-2" name="member_id" value="${param.id}"
							placeholder="아이디/이메일" required />
						<div class="form">
							<input type="password" class="form-control" placeholder="비밀번호" name="member_pw" required />
						</div>
						
						<button type="button" onClick="loginTheLimited()" class="btn btn-dark btn-block continue">로그인</button>
						
						<!-- 정보를 입력하지않고 로그인을 요청한 경우 show -->
						<div class="allRequiredInputCheck invalid-feedback text-start fs-07 mb-3 d-none">
							모든 정보를 입력해주세요.</div>
					</form>
					<div
						class="d-flex justify-content-center align-items-center mt-3 mb-3">
						<span class="line"></span> <small class="px-2 line-text">OR</small>
						<span class="line"></span>
					</div>
					
					<button onclick="facebookLogin()"
						class="btn btn-primary btn-block continue facebook-button d-flex justify-content-start align-items-center">
						<i class="fa fa-facebook ml-2"></i> <span class="ml-5 px-4">페이스북 계정으로 로그인</span>
					</button>
					<button onclick="googleLogin()"
						class="btn btn-danger btn-block continue google-button d-flex justify-content-start align-items-center">
						<i class="fa fa-google ml-2"></i> <span class="ml-5 px-4">구글 계정으로 로그인</span>
					</button>
				</div>
				<div class="p-3 d-flex flex-row justify-content-center align-items-center member">
					<a href="${contextPath}/member/memberForm.do" class="text-decoration-none ml-2">회원가입</a>&nbsp;&nbsp;&nbsp;
					<a href="#" class="text-decoration-none ml-2">아이디/비밀번호 찾기</a>
				</div>
			</div>
		</div>
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<script>
	const form = document.getElementById("loginForm");
	const inputs = form.querySelectorAll("input[required]");
	var allRequiredInputCheck = document.querySelector('.allRequiredInputCheck');

	
	//로그인을 클릭한 경우
		function loginTheLimited(){
			
		    let isValid = true;
		    //required인 input들을 모두 foreach
		    
		    
	 	   inputs.forEach(input => {
		    	//입력값이 없을때 유효하지 않은 입력을 표시하기 위해 스타일을 변경, is-invalid class add
		        if (!input.value) {
		          isValid = false;
		          input.classList.add("is-invalid");
		        } else {//외 의 경우 초기화.
		          input.classList.remove("is-invalid");
		          allRequiredInputCheck.classList.add('d-none');
		        }
		      });
		    
		 	//모든 입력이 유효하면 폼을 제출
		    if (isValid) {form.submit();}
		    else {allRequiredInputCheck.classList.remove('d-none');}
		}
	
		// 페이스북/구글 로그인
	    function facebookLogin() {
	        window.location.href = "https://www.facebook.com/login"; // 페이스북 로그인 페이지 URL로 이동
	    }
	
	    function googleLogin() {
	        window.location.href = "https://accounts.google.com/login"; // 구글 로그인 페이지 URL로 이동
	    }
	</script>
</body>
</html>