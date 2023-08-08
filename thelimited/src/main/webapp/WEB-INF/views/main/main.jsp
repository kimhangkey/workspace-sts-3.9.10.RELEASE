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
<!-- Bjqs 플러그인 스타일 -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bjqs/bjqs.css"> -->

<%-- <link rel="stylesheet" href="${contextPath}/resources/css/main.css"> --%>

</head>
<body>
	<div id="ad_main_banner" class="container">
		<img id="slideshow-img" width="100%" height="446"
			src="${contextPath}/resources/image/main_banner01.jpg">
	</div>

	<!-- NEW 상품 목록 -->
	<div class="container main_goods">
		<div class="row">
			<div class="p-0 align-items-center gap-3 mt-5 mb-3">
				<p class="fs-6 mb-1 menu_title">NEW ITEMS</p>
				<p class="fs-3 fw-bold">새로 나온 상품들을 확인해 보세요!</p>
			</div>
		</div>


		<div class="row mt-4 justify-content-center">
			<div
				class="d-flex categoryGoodList align-items-start flex-wrap p-0 justify-content-center mainlist1"
				style="gap: 4.1rem !important; height: 300px;">
				<c:choose>

					<c:when test="${empty goodsMap.NEW}">
					해당 카테고리에 상품이 없습니다.
					</c:when>

					<c:otherwise>
						<c:forEach var="item" items="${goodsMap.NEW}">
							<div class="p-0" style="width: 250px; height: 250px">
								<a
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"
									class="text-decoration-none d-block"> <img
									src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
									style="width: 200px; height: 200px">
									<p class="mt-4 mb-0 text-truncate fw-bold fs-6">${item.goods_title}</p>
									<p>
										<span class="text-danger fw-bold fs-4 me-1"> <fmt:formatNumber
												value="${item.goods_sales_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</c:otherwise>

				</c:choose>
			</div>
			<a href="#" class="more-link1">더보기</a>
		</div>
	</div>
	<!-- NEW 상품 목록 -->

	
	<!-- POP 상품 목록 -->
	<div class="container main_goods">
		<div class="row">
			<div class="p-0 align-items-center gap-3 mt-5 mb-3">
				<p class="fs-6 mb-1 menu_title">POPULAR ITEMS</p>
				<p class="fs-3 fw-bold">인기 상품들을 지금 만나보세요!</p>
			</div>
		</div>


		<div class="row mt-4 justify-content-center">
			<div
				class="d-flex categoryGoodList align-items-start flex-wrap p-0 justify-content-center mainlist2"
				style="gap: 4.1rem !important; height: 300px;">
				<c:choose>

					<c:when test="${empty goodsMap.POP}">
					해당 카테고리에 상품이 없습니다.
					</c:when>

					<c:otherwise>
						<c:forEach var="item" items="${goodsMap.POP}">
							<div class="p-0" style="width: 250px; height: 250px">
								<a
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"
									class="text-decoration-none d-block"> <img
									src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
									style="width: 200px; height: 200px">
									<p class="mt-4 mb-0 text-truncate fw-bold fs-6">${item.goods_title}</p>
									<p>
										<span class="text-danger fw-bold fs-4 me-1"> <fmt:formatNumber
												value="${item.goods_sales_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</c:otherwise>

				</c:choose>
			</div>
			<a href="#" class="more-link2">더보기</a>
		</div>
	</div>
	<!-- POP 상품 목록 -->
	
	
	
	<!-- DISC 상품 목록 -->
	<div class="container main_goods">
		<div class="row">
			<div class="p-0 align-items-center gap-3 mt-5 mb-3">
				<p class="fs-6 mb-1 menu_title">DISCOUNTS</p>
				<p class="fs-3 fw-bold">현재 할인 중인 상품들을 알아보세요!</p>
			</div>
		</div>


		<div class="row mt-4 justify-content-center">
			<div
				class="d-flex categoryGoodList align-items-start flex-wrap p-0 justify-content-center mainlist3"
				style="gap: 4.1rem !important; height: 300px;">
				<c:choose>

					<c:when test="${empty goodsMap.DISC}">
					해당 카테고리에 상품이 없습니다.
					</c:when>

					<c:otherwise>
						<c:forEach var="item" items="${goodsMap.DISC}">
							<div class="p-0" style="width: 250px; height: 250px">
								<a
									href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"
									class="text-decoration-none d-block"> <img
									src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
									style="width: 200px; height: 200px">
									<p class="mt-4 mb-0 text-truncate fw-bold fs-6">${item.goods_title}</p>
									<p>
										<span class="text-danger fw-bold fs-4 me-1"> <fmt:formatNumber
												value="${item.goods_sales_price}" pattern="#,###" />
										</span>원
									</p>
								</a>
							</div>
						</c:forEach>
					</c:otherwise>

				</c:choose>
			</div>
			<a href="#" class="more-link3">더보기</a>
		</div>
	</div>
	<!-- DISC 상품 목록 -->
	

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
  
 <script>
	$(document).ready(function() {
	  // '더보기' 링크를 클릭했을 때
	  $('a.more-link1').on('click', function(e) {
	    e.preventDefault(); // 기본 링크 동작 방지
	    // 클래스 categoryGoodList인 div 태그에 overflow를 보이게 처리
	    $('div.mainlist1').css('height', '600px');
	  });
	  $('a.more-link2').on('click', function(e) {
	    e.preventDefault(); // 기본 링크 동작 방지
	    // 클래스 categoryGoodList인 div 태그에 overflow를 보이게 처리
	    $('div.mainlist2').css('height', '600px');
	  });
	  $('a.more-link3').on('click', function(e) {
	    e.preventDefault(); // 기본 링크 동작 방지
	    // 클래스 categoryGoodList인 div 태그에 overflow를 보이게 처리
	    $('div.mainlist3').css('height', '600px');
	  });
	});
</script>


</body>
</html>