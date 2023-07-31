<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="container">
	<div class="">
		<div class="mt-5 align-items-center">
			<div class="">
				<p class="fs-5 fw-bold mb-2">상품관리</p>
				<div class="d-flex align-items-center gap-1 justify-content-between">
					<div>

						<!-- 검색 - 오늘 -->
						<a href="javascript:search_order_history('today')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main  ">오늘</a>

						<!-- 검색 - 1개월 -->
						<a href="javascript:search_order_history('one_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main  active">최근
							1개월</a>

						<!-- 검색 - 2개월 -->
						<a href="javascript:search_order_history('two_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main  two_month">최근
							2개월</a>

						<!-- 검색 - 3개월 -->
						<a href="javascript:search_order_history('three_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main  three_month">최근
							3개월 </a>

						<!-- 검색 - 6개월 -->
						<a href="javascript:search_order_history('six_month')"
							class="badge rounded-pill btn mb-2 rounded-0 border-main  six_month">최근
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
					<table class="table border-top mb-0  fw-light border-bottom">
						<tbody>

							<!-- thead -->
							<tr>
								<td
									class="table-light p-2 align-middle fw-bold border-end text-center "
									style="width: 45px;">상품번호</td>
								<td
									class="table-light ps-4 align-middle fw-bold text-center border-end">상품정보</td>
								<td
									class="table-light ps-4 align-middle fw-bold text-center border-end">상품이미지</td>
								<td
									class="table-light align-middle fw-bold text-center border-end"
									style="width: 114px;">등록일</td>
								<td class="table-light text-center px-4 align-middle"
									style="width: 114px;">-</td>
							</tr>
							<!-- thead -->


							<!-- 상품추가, showNewGoods할경우 show됨. -->
							<form action="${contextPath}/admin/goods/addNewGoods.do" method="post" enctype="multipart/form-data">
								
								<tr class="d-none newGoods bg-primary-subtle ">

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
												name="" id="" onchange="selectValue(this, this.value)"
												class="form-select rounded-0 flex-inherit text-start  border border-end">
												<option value="생활용품">생활용품</option>
												<option value="디지털" selected>디지털</option>
												<option value="도서">도서</option>
												<option value="건강기능식품">건강기능식품</option>
											</select> 
											<!-- 초기선택값 디지털 -->
											<input type="hidden" name="goods_sort" id="goods_sort"
												value="디지털">
											<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->
											
										</div>
										
										<!-- 상품이름 -->
										<div class="d-flex mb-1 align-items-center">
											<span style="width: 100px;" class="">상품이름</span> 
											<input
												class="form-control rounded-0" type="text"
												placeholder="상품이름" value="" name="goods_title">
										</div>
										<!-- 상품이름 -->
										
										<!-- 상품가격 -->
										<div class="d-flex mb-0 align-items-center">
											<span style="width: 100px;" class="">상품가격</span> <input
												class="form-control rounded-0" name="goods_sales_price"
												type="text" placeholder="상품가격" value="">
										</div>
										<!-- 상품가격 -->

									</td>
									<td class="border-end align-middle">
										<div class="d-flex mb-1 align-items-center">
											<span style="width: 100px;" class="">상품이미지</span>
											<div class="input-group">

												<!-- 메인 이미지 업로드 -->
												<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<label onClick="filesToFackFilesInput(this)"
													class="d-flex w-100 filesToFackFilesInput"> <input
													name='main_image' class="file_real d-none"
													id="f_main_image" type="file" style="opacity: .5">

													<span>파일선택</span> <input name='main_image_fake'
													class="file_fake form-control rounded-0" type="text"
													placeholder="main.png로 변경후 업로드해주세요." readonly tabindex="-1">

												</label>
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<!-- 메인 이미지 업로드 -->
												
											</div>
										</div>
										<div class="d-flex mb-1 align-items-center">
											<span style="width: 100px;" class="">상세이미지</span>
											<div class="input-group">
												<!-- 상세 이미지 업로드 -->
												<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<label onClick="filesToFackFilesInput(this)"
													class="d-flex w-100 filesToFackFilesInput"> <input
													name='detail_image1' class="file_real d-none"
													id="f_main_image" type="file" style="opacity: .5">
													<span>파일선택</span> 
													
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
											<span style="width: 100px;" class=""></span>
											<div class="input-group">

												<!-- 상세 이미지 업로드 -->
												<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
												<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
												<label onClick="filesToFackFilesInput(this)"
													class="d-flex w-100 filesToFackFilesInput"> <input
													name='detail_image2' class="file_real d-none"
													id="f_main_image" type="file" style="opacity: .5">
													<span>파일선택</span> 
													
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
							<!-- 상품추가, showNewGoods할경우 show됨. -->

							<c:choose>
								<c:when test="${empty newGoodsList }">

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
									<c:forEach var="item" items="${newGoodsList }">
										<form method="post" enctype="multipart/form-data">
											<tr>

											<!-- 상품번호 -->
												<td
													class="table-light p-2 align-middle fw-bold border-end text-center "
													style="width: 45px;">${item.goods_id }<input
													type="hidden" value="${item.goods_id }" name="goods_id">
												</td>
												<!-- 상품번호 -->
												
												<td class="border-end align-middle">
													<div class="d-flex mb-1 align-items-center">
														<span style="width: 100px;" class="">카테고리</span>

														<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->
														<!-- //input값에 따른 selectBox option select 스크립트에 의해 자동선택되 사용자에게 보여줌. -->
														<select name="" id=""
															onchange="selectValue(this, this.value)"
															class="form-select rounded-0 flex-inherit text-start  border border-end">
															<option value="생활용품">생활용품</option>
															<option value="디지털">디지털</option>
															<option value="도서">도서</option>
															<option value="건강기능식품">건강기능식품</option>
														</select> 
														<!-- 상품 카테고리 표시 -->
														<input type="hidden" name="goods_sort"
															id="goods_sort" value="${item.goods_sort }">
														<!-- select 선택시 input에 selected value가 공유됨 selectValue() -->

													</div>
													<div class="d-flex mb-1 align-items-center">
														<span style="width: 100px;" class="">상품이름</span> 
														
														<!-- 상품이름 -->
														<input
															class="form-control rounded-0" type="text"
															placeholder="상품이름" value="${item.goods_title } "
															name="goods_title">
														<!-- 상품이름 -->
														
													</div>
													<div class="d-flex mb-0 align-items-center">
														<span style="width: 100px;" class="">상품가격</span> 
														
														<!-- 상품가격 -->
														<input
															class="form-control rounded-0" type="text"
															placeholder="상품가격" value="${item.goods_sales_price }"
															name="goods_sales_price">
														<!-- 상품가격 -->
														
													</div>

												</td>
												<td class="border-end align-middle">
													<div class="d-flex mb-1 align-items-center">
														<span style="width: 100px;" class="">상품이미지</span>
														<div class="input-group">

															<!-- 메인 이미지 업로드 -->
															<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<label onClick="filesToFackFilesInput(this)"
																class="d-flex w-100 filesToFackFilesInput"> <input
																name='main_image' class="file_real d-none" type="file"
																style="opacity: .5"> <span>파일선택</span> 
																
																<input
																name='main_image_fake'
																class="file_fake form-control rounded-0" type="text"
																value="main.png" placeholder="main.png로 변경후 업로드해주세요."
																readonly tabindex="-1">
															</label>
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<!-- 메인 이미지 업로드 -->



														</div>
													</div>
													<div class="d-flex mb-1 align-items-center">
														<span style="width: 100px;" class="">상세이미지</span>
														<div class="input-group">

															<!-- 상세 이미지 업로드 -->
															<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<label onClick="filesToFackFilesInput(this)"
																class="d-flex w-100 filesToFackFilesInput"> <input
																name='detail_image1' class="file_real d-none"
																type="file" style="opacity: .5"> <span>파일선택</span>

																<input name='detail_image1_fake'
																class="file_fake form-control rounded-0" type="text"
																value="detail1.png"
																placeholder="detail1.png로 변경후 업로드해주세요." readonly
																tabindex="-1">
															</label>
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<!-- 상세 이미지 업로드 -->


														</div>
													</div>
													<div class="d-flex mb-0 align-items-center">
														<span style="width: 100px;" class=""></span>
														<div class="input-group">

															<!-- 상세 이미지 업로드 -->
															<!-- filesToFackFilesInput, 본래 file input은 placeholder등을지정할 수 없는 이유로 hidden, -->
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<label onClick="filesToFackFilesInput(this)"
																class="d-flex w-100 filesToFackFilesInput"> <input
																name='detail_image2' class="file_real d-none"
																type="file" style="opacity: .5"> <span>파일선택</span>

																<input name='detail_image2_fake'
																class="file_fake form-control rounded-0" type="text"
																value="detail2.png"
																placeholder="detail2.png로 변경후 업로드해주세요." readonly
																tabindex="-1">
															</label>
															<!-- label로 연결된 input으로 file value값을 반영해 사용자에게 알림. -->
															<!-- 상세 이미지 업로드 -->

														</div>
													</div>
												</td>
												
												<!-- 등록일 -->
												<td class="border-end align-middle text-center">${item.goods_credate }</td>
												<!-- 등록일 -->

												<td class="align-middle">
													<!-- 수정 -->
													<button
														class="w-100 btn border-main  rounded-0  mb-2"
														type="submit"
														formaction="${contextPath}/admin/goods/modifyGoods.do?goods_id=${item.goods_id }">수정</button>
													<!-- 수정 --> <!-- 삭제 -->
													<button href="https://www.naver.com"
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
</body>
</html>