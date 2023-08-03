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

<c:choose>
  <c:when test="${empty memberInfo}">
    <script type="text/javascript">
      window.alert('로그인 후 다시 시도해주세요.');
      // 로그인 페이지로 이동
      window.location.href = '${contextPath}/member/loginForm.do'; // 로그인 페이지 경로로 변경
    </script>
  </c:when>
</c:choose>

</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>