<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<div class="container">
	<div class="">
		<div class="mt-5 align-items-center">
			<div class="">
				<p class="fs-5 fw-bold mb-3 subpage_title">상품관리</p>
				<div class="d-flex align-items-center gap-1 justify-content-between">
					<div>

						<!-- 검색 - 오늘 -->
						<a href="javascript:search_order_history('today')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main date_btn ">오늘</a>

						<!-- 검색 - 1개월 -->
						<a href="javascript:search_order_history('one_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main date_btn active">최근
							1개월</a>

						<!-- 검색 - 2개월 -->
						<a href="javascript:search_order_history('two_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main date_btn two_month">최근
							2개월</a>

						<!-- 검색 - 3개월 -->
						<a href="javascript:search_order_history('three_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main date_btn three_month">최근
							3개월 </a>

						<!-- 검색 - 6개월 -->
						<a href="javascript:search_order_history('six_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main date_btn six_month">최근
							6개월</a>

					</div>
					
					
					<!-- 추가하기 -->
					<div>
						<button type="button"
							class="btn btn-main rounded-0 fw-bold p-2 ms-3 flex-fill fs-08"
							style="width: 300px;" onClick="showNewGoods()">추가하기</button>
					</div>
					<!-- 추가하기 -->
					
				</div>

<!-- 상품정보 표시 영역 -->
				<div class="border-top border-main border-2 mt-2"></div>
				<div class="table-responsive mt-4">
					<table class="table border-top mb-0  fw-light border-bottom goods_table">
						<tbody>

							<!-- thead -->
							<tr>
								<td
									class="table-light p-2 align-middle fw-bold border-end text-center "
									style="width: 45px;">상품번호</td>
								<td
									class="table-light ps-4 align-middle fw-bold text-center border-end">상품정보</td>
								<td
									class="table-light ps-4 align-middle fw-bold text-center border-end">상품이미지 변경/추가</td>
								<td
									class="table-light align-middle fw-bold text-center border-end"
									style="width: 114px;">등록일</td>
								<td class="table-light text-center px-4 align-middle"
									style="width: 114px;">-</td>
							</tr>
							<!-- thead -->


							<!-- 상품추가, showNewGoods할경우 show됨. -->
							<form action="${contextPath}/admin/goods/addNewGoods.do" method="post" enctype="multipart/form-data">
								
								<tr class="d-none newGoods bg-primary-subtle">
								
									<!-- 상품번호, 표시하지않음 -->
									<td
										class="p-2 align-middle fw-bold border-end text-center "
										style="width: 45px;">-</td>
									<!-- 상품번호, 표시하지않음 -->

									<td class="border-end align-middle">

										<div class="d-flex mb-1 align-items-center">
											<span style="width: 100px;" class="">카테고리</span> 
											
											<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->
											<select
												onchange="selectValue(this, this.value)"
												class="form-select rounded-0 flex-inherit text-start  border border-end">
												<option value="clothes" selected>의류</option>
												<option value="bags">가방</option>
												<option value="accessories">패션잡화</option>
												<option value="toys">토이&#47;완구</option>
											</select> 
											<!-- 초기선택값 의류 -->
											<input type="hidden" name="goods_sort" id="goods_sort"
												value="clothes">
											<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->
											
										</div>
										
										<!-- 상품이름 -->
										<div class="d-flex mb-1 align-items-center">
											<span style="width: 100px;" class="">상품이름</span> 
											<input
												class="form-control rounded-0 add_name" type="text"
												placeholder="상품이름" value="" name="goods_title">
										</div>
										<!-- 상품이름 -->
										
										<!-- 상품가격 -->
										<div class="d-flex mb-0 align-items-center">
											<span style="width: 100px;" class="">상품가격</span> <input
												class="form-control rounded-0 add_price" name="goods_sales_price"
												type="text" placeholder="상품가격" value="">
										</div>
										<!-- 상품가격 -->

									</td>
									<td class="border-end align-middle">
										<div class="d-flex mb-1 align-items-center">
											<div class="input-group justify-content-center">

												<!-- 메인 이미지 업로드 -->
												<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<label onClick="filesToFackFilesInput(this)"
													class="d-flex w-80 filesToFackFilesInput"> <input
													name='main_image' class="file_real d-none"
													id="f_main_image" type="file" style="opacity: .5">

													<span class="main_upload">메인1 업로드(필수)</span> <input name='main_image_fake'
													class="file_fake form-control rounded-0" type="text"
													placeholder="main.png로 변경후 업로드해주세요." readonly tabindex="-1">

												</label>
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<!-- 메인 이미지 업로드 -->
												
											</div>
										</div>
										<div class="d-flex mb-1 align-items-center">
											<div class="input-group justify-content-center">
												<!-- 상세 이미지 업로드 -->
												<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<label onClick="filesToFackFilesInput(this)"
													class="d-flex w-80 filesToFackFilesInput"> <input
													name='detail_image1' class="file_real d-none"
													type="file" style="opacity: .5">
													<span class="main_upload">상세1 업로드(선택)</span>
													
													<input name='detail_image1_fake'
													class="file_fake form-control rounded-0" type="text"
													placeholder="detail1.png로 변경후 업로드해주세요." readonly
													tabindex="-1">
												</label>
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<!-- 상세 이미지 업로드 -->
											</div>
										</div>
										<div class="d-flex mb-0 align-items-center">
											<div class="input-group justify-content-center">

												<!-- 상세 이미지 업로드 -->
												<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<label onClick="filesToFackFilesInput(this)"
													class="d-flex w-80 filesToFackFilesInput"> <input
													name='detail_image2' class="file_real d-none"
													type="file" style="opacity: .5">
													<span class="main_upload">상세2 업로드(선택)</span>
													
													<input name='detail_image2_fake'
													class="file_fake form-control rounded-0" type="text"
													placeholder="detail2.png로 변경후 업로드해주세요." readonly
													tabindex="-1">
												</label>
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<!-- 상세 이미지 업로드 -->

											</div>
										</div>

									</td>
									
									<!-- 등록일, 표시하지않음 -->
									<td class="border-end align-middle text-center">-</td>
									<!-- 등록일, 표시하지않음 -->
									
									
									<!-- 추가하기 -->
									<td class="align-middle">
										<button class="w-100 btn border-main  rounded-0  mb-2"
											type="button" onClick="fn_add_new_goods(this.form)">추가</button>
									</td>
									<!-- 추가하기 -->
																
								</tr>
						
							</form>
							<!-- 상품추가, showNewGoods할경우 show됨. end -->

							<c:choose>
								<c:when test="${empty newGoodsList}">

									<!-- 조회된 상품이 없을경우 -->
									<tr>
										<td colspan="5">
											<div class="p-4">
												<p class="my-5 text-center">조회된 상품이 없습니다.</p>
											</div>
										</td>
									</tr>
									<!-- 조회된 상품이 없을경우 -->

								</c:when>
								<c:otherwise>
								
								<!-- 상품리스트, newGoodsList for문 -->
									<c:forEach var="item" items="${newGoodsList}">
										<form method="post" enctype="multipart/form-data">
											<tr>

											<!-- 상품번호 -->
												<td
													class="table-light p-2 align-middle fw-bold border-end text-center "
													style="width: 45px;">${item.goods_id}<input
													type="hidden" value="${item.goods_id}" name="goods_id">
												</td>
												<!-- 상품번호 -->
												
												<td class="border-end align-middle">
													<div class="d-flex mb-1 align-items-center">
														<span style="width: 100px;" class="">카테고리</span>

														<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->
														<!-- //input값에 따른 selectBox option select 스크립트에 의해 자동선택되어 사용자에게 보여줌. -->
														<select
															onchange="selectValue(this, this.value)"
															class="form-select rounded-0 flex-inherit text-start  border border-end">
															<option value="clothes">의류</option>
															<option value="bags">가방</option>
															<option value="accessories">패션잡화</option>
															<option value="toys">토이&#47;완구</option>
														</select> 
														<!-- 상품 카테고리 표시 -->
														<input type="hidden" name="goods_sort"
															id="goods_sort" value="${item.goods_sort}">
														<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->

													</div>
													<div class="d-flex mb-1 align-items-center">
														<span style="width: 100px;" class="">상품이름</span> 
														
														<!-- 상품이름 -->
														<input
															class="form-control rounded-0" type="text"
															placeholder="상품이름" value="${item.goods_title} "
															name="goods_title">
														<!-- 상품이름 -->
														
													</div>
													<div class="d-flex mb-0 align-items-center">
														<span style="width: 100px;" class="">상품가격</span> 
														
														<!-- 상품가격 -->
														<input
															class="form-control rounded-0" type="text"
															placeholder="상품가격" value="${item.goods_sales_price}"
															name="goods_sales_price">
														<!-- 상품가격 -->
														
													</div>

												</td>
												<td class="border-end align-middle">
													<div class="d-flex mb-1 align-items-center">
														<div class="input-group justify-content-center">

															<!-- 메인 이미지 업로드 -->
															<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<label onClick="filesToFackFilesInput(this)"
																class="d-flex w-80 filesToFackFilesInput"> <input
																name='main_image' class="file_real d-none" type="file"
																style="opacity: .5"> <span class="main_upload">메인1 이미지 변경</span> 
																
																<input
																name='main_image_fake'
																class="file_fake form-control rounded-0" type="text"
																placeholder="main.png로 변경후 업로드해주세요."
																readonly tabindex="-1">
															</label>
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<!-- 메인 이미지 업로드 -->



														</div>
													</div>
													<div class="d-flex mb-1 align-items-center">
														<div class="input-group justify-content-center">

															<!-- 상세 이미지 업로드 -->
															<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<label onClick="filesToFackFilesInput(this)"
																class="d-flex w-80 filesToFackFilesInput"> <input
																name='detail_image1' class="file_real d-none"
																type="file" style="opacity: .5"> <span class="main_upload">상세1 이미지 변경</span>

																<input name='detail_image1_fake'
																class="file_fake form-control rounded-0" type="text"
																placeholder="detail1.png로 변경후 업로드해주세요." readonly
																tabindex="-1">
															</label>
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<!-- 상세 이미지 업로드 -->


														</div>
													</div>
													<div class="d-flex mb-0 align-items-center">
														<div class="input-group justify-content-center">

															<!-- 상세 이미지 업로드 -->
															<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<label onClick="filesToFackFilesInput(this)"
																class="d-flex w-80 filesToFackFilesInput"> <input
																name='detail_image2' class="file_real d-none"
																type="file" style="opacity: .5"> <span class="main_upload">상세2 이미지 변경</span>

																<input name='detail_image2_fake'
																class="file_fake form-control rounded-0" type="text"
																placeholder="detail2.png로 변경후 업로드해주세요." readonly
																tabindex="-1">
															</label>
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<!-- 상세 이미지 업로드 -->

														</div>
													</div>
												</td>
												
												<!-- 등록일 -->
												<td class="border-end align-middle text-center">${item.goods_credate}</td>
												<!-- 등록일 -->

												<td class="align-middle">
													<!-- 수정 -->
													<button
														class="w-100 btn border-main  rounded-0  mb-2"
														type="submit"
														formaction="${contextPath}/admin/goods/modifyGoods.do?goods_id=${item.goods_id}">수정</button>
													<!-- 수정 --> <!-- 삭제 -->
													<button
														class="w-100 btn border-main  rounded-0  mb-0"
														onClick="deleteGoods(${item.goods_id})" type="button">삭제</button>
													<!-- 삭제 -->

												</td>
											</tr>
										</form>
									</c:forEach>
									<!-- 상품리스트, newGoodsList for문 -->
									
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
<!-- 상품정보 표시 영역 -->

			</div>
		</div>
	</div>
</div>


<script>

//이미지 이름체크
function filesToFackFilesInput(label){
	let file_real = label.children[0];
	let file_fake = label.children[2];
	
	
	//file input file_real이 change할때
	file_real.addEventListener("change", function () {
		
		//name값에 따른 파일이름을 가져와 대조한다.
		let files = this.files[0].name;
		if(
			(file_fake.name == "main_image_fake") && (files == "main.png")||
		    (file_fake.name == "detail_image1_fake") && (files == "detail1.png")||
			(file_fake.name == "detail_image2_fake") && (files == "detail2.png")){
			//정해진 파일이름으로 업로드했을때 value값을 반영하고
			file_fake.value = files;
		}else{
			//그렇지않은경우 null을 반영 + label의 style을 바꾸어 경고한다.
			file_fake.value = '파일 이름을 형식대로 설정해주세요.';
			label.classList.add("warning1");
		}
	});
}


//상품 추가하기 버튼을 누를 경우, newGoods tr의 class d-none가 remove되며 나타난다.
function showNewGoods(){
	const newGoods = document.querySelector(".newGoods");
	newGoods.classList.remove("d-none");
}


//selectBox가 selected되면 그다음 요소 input에게 그 value가 반영된다.
function selectValue(selectBox, value){
	var input = selectBox.nextElementSibling
	input.setAttribute("value", value);
}


//로드시 상품목록을 가져올때 input값에 따라 selectbox의 option이 select된다. 
var cart_goods_qty_inputs = document.getElementsByName("goods_sort");
//전체 goods_sort 리스트를 돌려
cart_goods_qty_inputs.forEach((cart_goods_qty_inputs) => {
	let inputValue = cart_goods_qty_inputs.value;
	//이전형제요소 select 요소를 잡고
	let selectBox = cart_goods_qty_inputs.previousElementSibling;
	let selectBox_len = selectBox.options.length;
	//해당 select의 리스트 길이 만큼 돌리며 input값과 대조한다.
	for (let i=0; i<selectBox_len; i++){  
		if(selectBox.options[i].value == inputValue){
			//일치할경우 selected true
			selectBox.options[i].selected = true;
		}
	}
});



//상품추가
function fn_add_new_goods(obj){
	const fileName = document.querySelector("#f_main_image").value;
	const add_name = document.querySelector(".add_name").value;
	const add_price = document.querySelector(".add_price").value;
	//f_main_image의 value가 없으면 submit되지않으며, 경고한다.

	 if(add_name != '' && add_price != '' && fileName != ''){
		 obj.submit();
	 }else{alert("상품 추가시 이름, 가격, 메인 이미지는 필수 입력사항입니다.");return;}
}




//getContextPath 
//comfirm의 결과값에 따른 action을 하기 위해 contextPath를 구해봤다. - (상품삭제)
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

//상품삭제
function deleteGoods(goods_id){
	var url = getContextPath();
	url += "/admin/goods/deleteGoods.do?goods_id="+goods_id;
	//confirm단계를 거치고 사용자가 취소를 누를경우 삭제를 취소한다.
	 if (!confirm("삭제하시겠습니까?")) {
	    } else {
	    	//사용자가 확인을 눌렀을 경우 goods_id값과 함께 deleteGoods로 이동한다.
	    	location.href=url;
	    }
}


//버튼식 상품조회
//onclick할때 같이 가져오는 fixedSearchPeriod값과함께 adminGoods 재요청
//해당 값은 자바소스를 거쳐 지정된 기간에 맞는 정보만 select되어 뿌려진다.
function search_order_history(fixedSearchPeriod) {
	var formObj = document.createElement("form");
	var i_fixedSearch_period = document.createElement("input");
	i_fixedSearch_period.name = "fixedSearchPeriod";
	i_fixedSearch_period.value = fixedSearchPeriod;
	formObj.appendChild(i_fixedSearch_period);
	document.body.appendChild(formObj);
	formObj.method = "get";
	formObj.action = "${contextPath}/admin/goods/adminGoods.do";
	formObj.submit();
}
				
//버튼식 상품조회 badge url에 따른 style변경
if (window.location.href.includes("fixedSearchPeriod")) {
	const badges = document.querySelectorAll(".badge");
	for (b of badges){ 
		b.classList.remove("active");
		}
	//각 값이 url에 들어있을 경우 active된다.
	if (window.location.href.includes("today")) {badges[0].classList.add("active");
	} else if (window.location.href.includes("one_month")) {badges[1].classList.add("active");
	}else if (window.location.href.includes("two_month")) {badges[2].classList.add("active");
	}else if (window.location.href.includes("three_month")) {badges[3].classList.add("active");
	}else if (window.location.href.includes("six_month")) {badges[4].classList.add("active");
	}
}
				
</script>