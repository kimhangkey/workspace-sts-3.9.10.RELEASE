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

<script>

//id중복체크
function fn_overlapped(){
	//member_id 값을 가져와 overlapped를 실행함.
    var _id=$("#member_id").val();
    if(_id==''){return;}
    
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
    	  //가능한 id일 경우 input값은 _id로 유지되며 외의경우 아무런이벤트 없음 
    	  //각 상황에 따른 피드백 및 스타일을 add or remove
          if(data=='false'){
        	$('.input1').prop("disabled", false);
       	    $('#member_id').addClass("is-valid");
       		$('#member_id').removeClass("is-invalid");
       	 	$('.member_id-feedback.valid-feedback').removeClass("d-none");
       	    $('#member_id').val(_id);
          }else{
        	  $('.input1').prop("disabled", true);
        	  $('#member_id').removeClass("is-valid");
        	  $('#member_id').addClass("is-invalid");
        	  $('.member_id-feedback.invalid-feedback').removeClass("d-none");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");
       },
       complete:function(data,textStatus){}
    });
 }
 

</script>



</head>
<body>
	<div class="container d-flex justify-content-center align-items-center">
		<div class="card">
			<div
				class="p-3 border-bottom d-flex align-items-center justify-content-center">
				<a href="${contextPath}/main/main.do" class="login_to_home"><h5 class="login_logo">THE LIMITED</h5></a>
			</div>
			<div class="p-3 px-4 py-4 border-bottom">
			
				<form action="${contextPath}/member/addMember.do" method="post"
					id="joinForm">
					
					<!-- id check -->
					<input type="text" class="form-control mb-0" id="member_id" onblur="fn_overlapped()"
						name="member_id" placeholder="아이디/이메일" required />
					<div class="member_id-feedback valid-feedback text-start fs-07 d-none">
						사용가능한 아이디 입니다.</div>
					<div class="member_id-feedback invalid-feedback text-start fs-07 d-none" >
						이미 사용중인 아이디 입니다. 다른 아이디를 입력해 주세요.</div>
					<div class="mb-4"></div>
						
					<!-- password check -->
					<div class="form">
						<input type="password" name="member_pw" class="form-control mb-4 member_pwWrite input1" 
							placeholder="비밀번호" onblur="member_pwChecking()" required />
						<input type="password" class="form-control member_pwCheck input1" 
							placeholder="비밀번호 확인" onblur="member_pwChecking()" required />
							
						<div class="member_pw-feedback valid-feedback text-start fs-07 d-none">
							비밀번호가 일치합니다.</div>
						<div class="member_pw-feedback invalid-feedback text-start fs-07 d-none">
							비밀번호가 일치하지않습니다.</div>
					</div>
					
					
					
					<input type="text" name="member_name" class="form-control mb-4 input1 nameAndH1"
						placeholder="이름" required oninput="etcInptut()" />
					<input type="text" name="hp1" class="form-control mb-4 input1 nameAndH1"
						placeholder="휴대폰 번호" required oninput="etcInptut()" />
					<button type="button" onClick="addMember()" class="btn btn-dark btn-block continue join" >가입하기</button>
					
					<div class="allRequiredInputCheck invalid-feedback text-start fs-07 mb-3 d-none">
						모든 정보를 입력해주세요.</div>
				</form>
				
				
				
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
	
	
	<script>
	
	//비밀번호 확인 값체크
	//password input에서 onblur시 member_pwChecking가 실행됨.
    function member_pwChecking(){
   	 	let member_pwWrite = document.querySelector('.member_pwWrite');
        let member_pwCheck = document.querySelector('.member_pwCheck');
        let member_pw_feedback = document.querySelector('.member_pw-feedback.invalid-feedback');
        let member_pw_feedback_valid = document.querySelector('.member_pw-feedback.valid-feedback');
        let join_button = document.querySelector('.join');
        
        //member_pwWrite와 member_pwCheck가 입력되었을 때만 안내문구와 테두리 표시.
		if(member_pwWrite.value=="" || member_pwCheck.value==""){
			
			join_button.disabled = "";
			
			member_pwWrite.classList.remove("is-invalid");
       	 	member_pwCheck.classList.remove("is-invalid");
       	 	
       		member_pwWrite.classList.remove("is-valid");
    	 	member_pwCheck.classList.remove("is-valid");
    	 	
    	 	member_pw_feedback.classList.add("d-none");
       		member_pw_feedback.classList.remove("d-block");
       		
    		member_pw_feedback_valid.classList.add("d-none");
       	 	member_pw_feedback_valid.classList.remove("d-block");
       	 
			console.log("아무것도입력되지않음");
		}else{
			//같지않을때
			if(member_pwWrite.value != member_pwCheck.value){
				
				 join_button.disabled = "disabled";
				
            	 member_pwWrite.classList.remove("is-valid");
            	 member_pwCheck.classList.remove("is-valid");
            	 
            	 member_pwWrite.classList.add("is-invalid");
            	 member_pwCheck.classList.add("is-invalid");
            	 member_pw_feedback.classList.remove("d-none");
            	 member_pw_feedback.classList.add("d-block");
            	 
            	 member_pw_feedback_valid.classList.remove("d-block");
            	 member_pw_feedback_valid.classList.add("d-none");
            	 
            	 
             }else{
            	//같을때
            	 join_button.disabled = "";
            	
            	 member_pwWrite.classList.remove("is-invalid");
            	 member_pwCheck.classList.remove("is-invalid");
            	 member_pw_feedback.classList.add("d-none");
            	 member_pw_feedback.classList.remove("d-block");
            	 
            	 member_pwWrite.classList.add("is-valid");
            	 member_pwCheck.classList.add("is-valid");
            	 
            	 member_pw_feedback_valid.classList.add("d-block");
            	 member_pw_feedback_valid.classList.remove("d-none");
             }
		}
    }
	
	
	
    const form = document.getElementById("joinForm");
    const inputs = form.querySelectorAll("input[required]");
    const nameAndH1 = form.querySelectorAll(".nameAndH1");
    var allRequiredInputCheck = document.querySelector('.allRequiredInputCheck');
    
    
    //이름, 휴대폰 input 에서 입력값이 존재할 때, 경고 삭제
    function etcInptut(){
    	if(this.value != ""){
    		nameAndH1.forEach(input => {input.classList.remove("is-invalid");});
    		allRequiredInputCheck.classList.add('d-none');
    	}
    }
	
	
  	//회원가입
    function addMember(){
        let isValid = true;
        //input들의 값을 확인하여 값이 없을경우 style을 변경한다.
        inputs.forEach(input => {
            if (!input.value) {
              isValid = false;
              input.classList.add("is-invalid");
            } else {
              input.classList.remove("is-invalid");
              allRequiredInputCheck.classList.add('d-none');
            }
          });
        
     // 모든 입력이 유효하면 폼을 제출
        if (isValid) {form.submit();} 
        else {
        	allRequiredInputCheck.classList.remove('d-none');}
    }
	
	</script>
	
</body>
</html>