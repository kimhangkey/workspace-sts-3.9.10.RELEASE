<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bjqs 플러그인 스타일-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bjqs/bjqs.css">

<%-- <link rel="stylesheet" href="${contextPath}/resources/css/main.css"> --%>

</head>
<body>
	<div id="ad_main_banner">
		<%-- <ul class="bjqs">	 	
		  <li><img width="100%" height="446" src="${contextPath}/resources/image/main_banner01.jpg"></li>
			<li><img width="100%" height="446" src="${contextPath}/resources/image/main_banner02.jpg"></li>
			<li><img width="100%" height="446" src="${contextPath}/resources/image/main_banner03.jpg"></li> 
		</ul> --%>
		<img id="slideshow-img" width="100%" height="446" src="${contextPath}/resources/image/main_banner01.jpg">
	</div>
	
<%-- 	<div class="main_book">
	   <c:set  var="goods_count" value="0" />
		<h3>베스트셀러</h3>
		<c:forEach var="item" items="${goodsMap.bestseller }">
		   <c:set  var="goods_count" value="${goods_count+1 }" />
			<div class="book">
				<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
				<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
				</a> 
					<img width="121" height="154" 
					     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
	
				<div class="title">${item.goods_title }</div>
				<div class="price">
			  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			          ${goods_price}원
				</div>
			</div>
		   <c:if test="${goods_count==15   }">
	         <div class="book">
	           <font size=20> <a href="#">more</a></font>
	         </div>
	     </c:if>
	  </c:forEach>
	</div>
	<div class="clear"></div>
	<div id="ad_sub_banner">
		<img width="770" height="117" src="${contextPath}/resources/image/sub_banner01.jpg">
	</div>
	<div class="main_book" >
	<c:set  var="goods_count" value="0" />
		<h3>새로 출판된 책</h3>
		<c:forEach var="item" items="${goodsMap.newbook }" >
		   <c:set  var="goods_count" value="${goods_count+1 }" />
			<div class="book">
			  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
		       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
		      </a>
			 <img width="121" height="154" 
					src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			<div class="title">${item.goods_title }</div>
			<div class="price">
			    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			       ${goods_price}원
			  </div>
		</div>
		 <c:if test="${goods_count==15   }">
	     <div class="book">
	       <font size=20> <a href="#">more</a></font>
	     </div>
	   </c:if>
		</c:forEach>
	</div>
	
	<div class="clear"></div>
	<div id="ad_sub_banner">
		<img width="770" height="117" src="${contextPath}/resources/image/sub_banner02.jpg">
	</div>
	
	
	<div class="main_book" >
	<c:set  var="goods_count" value="0" />
		<h3>스테디셀러</h3>
		<c:forEach var="item" items="${goodsMap.steadyseller }" >
		   <c:set  var="goods_count" value="${goods_count+1 }" />
			<div class="book">
			  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
		       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
		      </a>
			 <img width="121" height="154" 
					src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
			<div class="title">${item.goods_title }</div>
			<div class="price">
			    <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			       ${goods_price}원
			  </div>
		</div>
		 <c:if test="${goods_count==15   }">
	     <div class="book">
	       <font size=20> <a href="#">more</a></font>
	     </div>
	   </c:if>
		</c:forEach>
	</div> --%>


<!-- jQuery 라이브러리 -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

<!-- Bjqs 스크립트 파일 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bjqs/bjqs-1.3.min.js"></script> -->

<!-- 슬라이드 쇼 스크립트 -->
<!-- <script>
  $(document).ready(function () {
    // 슬라이드 쇼의 각 설정 값들을 지정합니다.
    $('#ad_main_banner .bjqs').cycle({
      fx: 'fade', // 페이드 효과 사용
      timeout: 2000, // 슬라이드 간격 (2초)
      speed: 800, // 슬라이드 애니메이션 속도
      pause: true, // 마우스 호버 시 슬라이드 정지
      pager: false // 페이지 표시기 사용 안함
    });
  });
</script> -->

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
  <script>
    $(document).ready(function () {
      // 이미지 파일 경로들 배열로 저장
      var imageUrls = [
        "${contextPath}/resources/image/main_banner01.jpg",
        "${contextPath}/resources/image/main_banner02.jpg",
        "${contextPath}/resources/image/main_banner03.jpg"
      ];

      var currentImageIndex = 0;
      var slideshowImg = document.getElementById('slideshow-img');

      // 이미지 변경 함수
      function changeImage() {
        currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
        slideshowImg.src = imageUrls[currentImageIndex];
      }

      // 2초마다 이미지 변경
      setInterval(changeImage, 2000);
    });
  </script>


</body>
</html>