<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">

<c:choose>
  <c:when test="${empty memberInfo || memberInfo.member_id != 'admin'}">
    <script type="text/javascript">
      window.alert('접근 권한이 없습니다.');
      // 로그인 페이지로 이동
      window.location.href = '${contextPath}/member/loginForm.do'; // 로그인 페이지 경로로 변경
    </script>
  </c:when>
</c:choose>

</head>
<body>

	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<div style="height: 300px" ></div>
	<div
		class="footer border-top mt-5 py-5 text-center small text-secondary">
		<div class="logo_container" style="height: 50px;">
			<div class="logo"><a href="${contextPath}/main/main.do">THE LIMITED</a></div>
		</div>
		<p class="mb-0">
			<tiles:insertAttribute name="footer" />
		</p>
	</div>
	
</body>
</html>