<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.io.*" pageEncoding="UTF-8" isELIgnored="false" %>
	
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="site.title" text="Member Info1" /></title>
</head>
<body>
	<a href="${contextPath}/test/locale.do?locale=ko" >한국어</a>
	<a href="${contextPath}/test/locale.do?locale=en" >ENGLISH</a>
	<h1>
		<spring:message code="site.title" text="Member Info1" />
	</h1>
	<p>
		<spring:message code="site.name" text="no name1" />
		:
		<spring:message code="name" text="no name1" />
	</p>
	<p>
		<spring:message code="site.job" text="no job1" />
		:
		<spring:message code="job" text="no job1" />
	</p>


	<input type=button value="<spring:message code='btn.send' text='send1' />" />
	<input type=button value="<spring:message code='btn.cancel' text='cancel1' />" />
	<input type=button value="<spring:message code='btn.finish' text='finish1' />" />

</body>
</html>