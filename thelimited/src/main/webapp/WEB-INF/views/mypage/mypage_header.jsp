<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">

</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>

<div class="super_container">
	<!-- Header -->
	<header class="header">
		<!-- Top Bar -->
		<div class="top_bar">
			<div class="container">
				<div class="row">
					<div class="col d-flex flex-row">
						<div class="top_bar_contact_item">
							<div class="top_bar_icon">
								<img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918577/phone.png" alt="">
							</div>
							<span class="top_bar_text">02-1234-1234</span>
						</div>
						<div class="top_bar_contact_item">
							<div class="top_bar_icon">
								<img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918597/mail.png" alt="">
							</div>
							<span class="top_bar_text">thelimited@thelimited.com</span>
						</div>
						<div class="top_bar_content ml-auto">
							<div class="top_bar_menu">
								<ul class="standard_dropdown top_bar_dropdown">
								 <li>
										<a href="#">한국어<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">English</a></li>
											<li><a href="#">Spanish</a></li>
											<li><a href="#">Japanese</a></li>
										</ul>
									</li>
									 <li>
										<a href="#">KOR WON<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="#">US Dollar</a></li>
											<li><a href="#">EUR Euro</a></li>
											<li><a href="#">JPY Japanese Yen</a></li>
										</ul>
									</li>
								</ul>
							</div>
							
							<c:choose>
							<c:when test="${isLogOn==true and not empty memberInfo}">
							
								<c:choose>
								
								<c:when test="${isLogOn==true and memberInfo.member_id =='admin'}">
								
									<div class="top_bar_user">
										<div class="user_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918647/user.svg" alt=""></div>
										<div><a href="${contextPath}/admin/goods/adminGoods.do">관리자</a></div>
										<div><a href="${contextPath}/member/logout.do">로그아웃</a></div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="top_bar_user">
										<div class="user_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918647/user.svg" alt=""></div>
										<div><a href="${contextPath}/mypage/listMyOrderHistory.do">${memberInfo.member_name}</a></div>
										<div><a href="${contextPath}/member/logout.do">로그아웃</a></div>
									</div>
								</c:otherwise>
								
								</c:choose>
							</c:when>
							
							<c:otherwise>		
									<div class="top_bar_user">
										<div class="user_icon"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918647/user.svg" alt=""></div>
										<div><a href="${contextPath}/member/memberForm.do">회원가입</a></div>
										<div><a href="${contextPath}/member/loginForm.do">로그인</a></div>
									</div>
							</c:otherwise>
							</c:choose>		
									
						</div>
					</div>
				</div>
			</div>		
		</div>

		<!-- Header Main -->

		<div class="header_main">
			<div class="container">
				<div class="row">

					<!-- Logo -->
					<div class="col-lg-2 col-sm-3 col-3 order-1">
						<div class="logo_container">
							<div class="logo"><a href="${contextPath}/main/main.do">THE LIMITED</a></div>
						</div>
					</div>

					<!-- Search -->
					<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
						<div class="header_search">
							<div class="header_search_content">
								<div class="header_search_form_container">
									<form action="${contextPath}/goods/searchGoods.do" class="header_search_form clearfix">
										<input type="search" required="required" class="header_search_input" name="searchWord" placeholder="원하는 상품을 검색해 보세요.">
										<div class="custom_dropdown" style="display: block;">
											<div class="custom_dropdown_list">
												<span id="dropdownSelected" class="custom_dropdown_placeholder clc">전체</span>
												<i class="fas fa-chevron-down"></i>
												<ul class="custom_list clc">
													<li><a class="clc" href="#">전체</a></li>
													<li><a class="clc" href="#">의류</a></li>
													<li><a class="clc" href="#">가방</a></li>
													<li><a class="clc" href="#">패션잡화</a></li>
													<li><a class="clc" href="#">토이&#47;완구</a></li>
												</ul>
											</div>
										</div>
										<button type="submit" class="header_search_button trans_300" value="Submit"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918770/search.png" alt=""></button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Wishlist -->
					<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
						<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
							<div class="wishlist d-flex flex-row align-items-center justify-content-end">
								<div class="wishlist_icon"><a href="#"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918681/heart.png" alt=""></a></div>
								<div class="wishlist_content">
 									<div class="wishlist_text"><a href="#" class="wishlist_text">찜목록</a></div>
									<!-- <div class="wishlist_count">10</div> -->
								</div>
							</div>

							<!-- Cart -->
							<div class="cart">
								<div class="cart_container d-flex flex-row align-items-center justify-content-end">
									<div class="cart_icon">
										<a href="${contextPath}/cart/shoppingCart.do">
											<img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560918704/cart.png" alt="">
											<span class="cart_count"><span>${cartCount}</span></span>
										</a>
									</div>
									<div class="cart_content">
										<div class="cart_text"><a href="${contextPath}/cart/shoppingCart.do" class="cart_text">쇼핑카트</a></div>
										<!-- <div class="cart_price">39,000원</div> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		
		<!-- Main Navigation -->

		<nav class="main_nav">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="main_nav_content d-flex flex-row">

							<!-- Categories Menu -->

							

							<!-- Main Nav Menu -->

							<div class="main_nav_menu">
								<ul class="standard_dropdown main_nav_dropdown">
									<li class="menu_home"><span>마이 페이지</span></li>
									<li class="menu_line"><span>&nbsp;&#124;</span></li>
									<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문목록<i class="fas fa-chevron-down"></i></a></li>
									<li><a href="${contextPath}/cart/shoppingCart.do">쇼핑카트<i class="fas fa-chevron-down"></i></a></li>
									<li><a href="${contextPath}/mypage/myDetailInfo.do">내정보<i class="fas fa-chevron-down"></i></a></li>
								</ul>
							</div>

							<!-- Menu Trigger -->

							<!-- <div class="menu_trigger_container ml-auto">
								<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
									<div class="menu_burger">
										<div class="menu_trigger_text">menu</div>
										<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
									</div>
								</div>
							</div> -->

						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<!-- mobile Menu -->

		<!-- <div class="page_menu">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="page_menu_content">
							
							<div class="page_menu_search">
								<form action="#">
									<input type="search" required="required" class="page_menu_search_input" placeholder="원하는 상품을 검색하세요.">
								</form>
							</div>
							<ul class="page_menu_nav">
								<li class="page_menu_item has-children">
									<a href="#">Language<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">한국어<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">English<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Spanish<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Japanese<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Currency<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">KOR WON<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">EUR Euro<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">JPY Japanese Yen<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item">
									<a href="#">Home<i class="fa fa-angle-down"></i></a>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Super Deals<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Super Deals<i class="fa fa-angle-down"></i></a></li>
										<li class="page_menu_item has-children">
											<a href="#">Menu Item<i class="fa fa-angle-down"></i></a>
											<ul class="page_menu_selection">
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
												<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
											</ul>
										</li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Featured Brands<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Featured Brands<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item has-children">
									<a href="#">Trending Styles<i class="fa fa-angle-down"></i></a>
									<ul class="page_menu_selection">
										<li><a href="#">Trending Styles<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
										<li><a href="#">Menu Item<i class="fa fa-angle-down"></i></a></li>
									</ul>
								</li>
								<li class="page_menu_item"><a href="blog.html">blog<i class="fa fa-angle-down"></i></a></li>
								<li class="page_menu_item"><a href="contact.html">contact<i class="fa fa-angle-down"></i></a></li>
							</ul>
							
							<div class="menu_contact">
								<div class="menu_contact_item"><div class="menu_contact_icon"></div>02-1234-1234</div>
								<div class="menu_contact_item"><div class="menu_contact_icon"></div><a href="mailto:fastsales@gmail.com">thelimited@thelimited.com</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->

	</header>
	
<!-- 	<div style="height: 700px">
		

	</div> -->

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="${contextPath}/resources/js/header.js"></script>

<!-- 검색 -->
<script>
    const dropdownSelected = document.getElementById('dropdownSelected');
    const submitButton = document.querySelector('.header_search_button');


	submitButton.addEventListener('click', function(event) {

		const selectedValue = dropdownSelected.textContent;
		let inputValue = null;

		switch (selectedValue) {
		case "의류":
			inputValue = 'clothes';
			break;
		case '가방':
			inputValue = 'bags';
			break;
		case '패션잡화':
			inputValue = 'accessories';
			break;
		case '토이/완구':
			inputValue = 'toys';
			break;
		default:
			inputValue = 'all';
			break;
		}

		const hiddenInput = document.createElement('input');
		hiddenInput.type = 'hidden';
		hiddenInput.name = 'goods_sort';
		hiddenInput.value = inputValue;
		const form = document.querySelector('.header_search_form');
		form.appendChild(hiddenInput);
	});
</script>

</body>
</html>