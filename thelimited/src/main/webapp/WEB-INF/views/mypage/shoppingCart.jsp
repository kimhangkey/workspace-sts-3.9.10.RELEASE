<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myGoodsList" value="${cartMap.myGoodsList}" />

<!--주문 개수 -->
<c:set var="totalGoodsNum" value="0" />

<!-- 총 배송비 -->
<c:if test="${empty myCartList }">
<c:set var="totalDeliveryPrice" value="0" />
</c:if>
<c:if test="${not empty myCartList }">
<c:set var="totalDeliveryPrice" value="4000" />
</c:if>

<!-- 총 할인금액 -->
<c:set var="totalDiscountedPrice" value="0" />

<!-- 상품총액 -->
<c:set var="total_goods_price" value="0" />




<script>

//select박스가 체크되었을때 input에 반영함.
function selectValue(selectBox, value, goods_id, index){
	var input = selectBox.nextElementSibling;
	input.setAttribute("value", value);
	modify_cart_qty(index, goods_id, value);
}


//장바구니 수정하기
function modify_cart_qty(index, goods_id, value){
	//수정할 cart_goods_qty의 값을 저장.
	var cart_goods_qty = Number(value);
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			goods_id:goods_id,
			cart_goods_qty:cart_goods_qty
		},
		success : function(data, textStatus) {
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");
				location.reload();
			}else{alert("다시 시도해 주세요!!");	}			
		},
		error : function(data, textStatus) {alert("에러가 발생했습니다."+data);},
		complete : function(data, textStatus) {			}
	});
}


//장바구니 삭제하기
function delete_cart_goods(cart_id){
	var result = confirm('해당 상품을 쇼핑카트에서 삭제하시겠습니까?' + cart_id);
	
	if(result) {
		// 삭제할 cart_id값을 저장
		var cart_id=Number(cart_id);
		//formObj을 만들어 submit
		var formObj=document.createElement("form");
		var i_cart = document.createElement("input");
		i_cart.name="cart_id";
		i_cart.value=cart_id;
		formObj.appendChild(i_cart);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action= "${contextPath}/cart/removeCartGoods.do";
	    formObj.submit();
		alert('해당 상품이 삭제 되었습니다.');
	}
	
}


//선택(전체)상품 주문하기
function fn_order_all_cart_goods(){
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty; 
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	
	var cartGood=document.getElementsByClassName("cartGood");
	var length=document.getElementsByClassName("cartGood").length;
	let checkLen = 0;
	if(length>1){
		//전체 체크박스를 돌려 체크됬을때만 걸러낸다.
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				checkLen++;
				console.log(checkLen);
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				//console.log(order_goods_id+":"+order_goods_qty);
				//각 상품의 정보를 해당 숨겨진 hidden input에 넣어 submit
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
			}
		}	
	}else if(length=1){//선택된 상품이 하나일때는 분기처리한다.
		if(cartGood[0].checked){
			checkLen++;
			order_goods_id=checked_goods.value;
			order_goods_qty=cart_goods_qty.value;
			//각 상품의 정보를 해당 숨겨진 hidden input에 넣어 submit
			cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		}
	}
	
	//체크된 상품이 있을 경우 위에 세팅한 값으로 주문.
	if(checkLen > 0){
		objForm.method="post";
	 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
		objForm.submit();
		//사용자가 뒤로가기 한뒤 다시 주문할때를 대비해 input 값을 되돌려놓음.
	 	cart_goods_qty[i].value=cart_goods_qty[i].previousElementSibling.value;
		
	}else {alert("원하시는 상품을 선택해주세요!");}//체크된 상품이 없을 경우 submit하지않고 alert만 표시.
	
}


//개별 주문하기
function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	var total_price,final_total_price,_goods_qty;
	var cart_goods_qty=document.getElementById("cart_goods_qty");
	
	_order_goods_qty=cart_goods_qty.value;
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=_order_goods_qty;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_fileName.value=fileName;
    
    //받아온 정보를 formObj에 저장
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);
    document.body.appendChild(formObj);
    
    //submit
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
}

</script>




<!-- 쇼핑카트 -->
<section class="cart1">
	<div class="container">
		<div class="justify-content-md-center mx-auto px-auto mypage_form">
			<div class="cart__information">
				<ul>
					<li>쇼핑카트 상품은 최대 30일간 저장됩니다.</li>
					<li>한 번에 여러 상품을 선택하여 주문할 경우, 배송비는 1회만 추가됩니다.</li>
					<li>상품 판매가, 재고 수량 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
					<li>해당 상품이 삭제되는 경우, 쇼핑카트 목록에서 자동으로 제거될 수 있습니다.</li>
				</ul>
			</div>
			<!-- 장바구니  리스트 myGoodsList를 foreach 문으로 돌려 출력한다.-->
			<table class="cart__list">
				<thead>
					<tr>
						<td><input title="모든 상품을 결제상품으로 설정" type="checkbox"
							name="checked_goods" class="all-deal-select"
							onclick='selectAll(this)'></td>
						<td colspan="2">상품 정보</td>
						<td>판매가</td>
						<td>상품 옵션</td>
						<td>배송비</td>
						<td>합계</td>
						<td>선택</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
	
						<c:when test="${ empty myCartList || isLogOn == 'false' }">
							<!-- 장바구니가 비어있을 경우 -->
							<tr> 	
								<td colspan="8" height="100px">쇼핑카트에 상품이 없습니다 !</td>
							</tr>
						</c:when>
	
						<c:otherwise>
	
	
							<form name="frm_order_all_cart">
								<c:forEach var="item" items="${myGoodsList}" varStatus="cnt">
	
									<!-- 인덱스 초기화 -->
									<c:set var="cart_goods_qty"
										value="${myCartList[cnt.count-1].cart_goods_qty}" />
									<c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
									<!-- 인덱스 초기화 -->
	
									<tr class="cart__list__detail">
										<td><input type="checkbox" name="checked_goods"
											class="cartGood"
											price="${item.goods_sales_price*cart_goods_qty}"
											value="${item.goods_id}"></td>
										<td><img
											src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
											class="cart_img"></td>
										<td><a
											href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
												<span>${item.goods_title}</span>
										</a></td>
										<td><span> <fmt:formatNumber
													value="${item.goods_sales_price}" pattern="#,###" />원
										</span></td>
										<td class="cart_select">
											<span> 수량 : </span> 
											<select id="" class="form-select rounded-0 text-center" 
												onchange="selectValue(this, this.value,${item.goods_id },${cnt.count-1 })">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
											</select> 
											<input type="hidden" id="cart_goods_qty" name="cart_goods_qty" value="${cart_goods_qty}"><br><br>
											<span> 상품총액 : </span> <span> <span
												class="goods_sales_price d-none">${item.goods_sales_price * cart_goods_qty}</span>
												<span><fmt:formatNumber
														value="${item.goods_sales_price * cart_goods_qty}"
														pattern="#,###" />원</span>
										</span></td>
										<!-- 	<td class="cart__list__option">
										<p>모델명 : 키보드 - 한국어 MK2A3KH/A / 1개</p>
										<button class="cart__list__optionbtn">주문조건 추가/변경</button>
									</td> -->
										<td><span><fmt:formatNumber
													value="${totalDeliveryPrice}" pattern="#,###" />원</span></td>
										<td><span><fmt:formatNumber
													value="${(item.goods_sales_price * cart_goods_qty) + totalDeliveryPrice}"
													pattern="#,###" />원</span></td>
										<td><a class="cart__list__orderbtn"
											href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}')">주문하기</a><br>
										<br> <%-- <button class="cart__list__delbtn" onclick="delete_cart_goods('${cart_id}')">삭제하기</button> --%>
											<a class="cart__list__delbtn"
											href="javascript:delete_cart_goods('${cart_id}')">삭제하기</a></td>
									</tr>
								</c:forEach>
							</form>
						</c:otherwise>
					</c:choose>
	
				</tbody>
			</table>
	
	
		<c:choose>
			<c:when test="${ !empty myCartList || isLogOn == 'false' }">
		
				<!-- 선택상품 가격표시 영역 -->
				<p
					class="bg-light border text-end p-4 text-secondary d-flex justify-content-end align-items-center">
					<!-- 변수세팅 및 형 변환 -->
					<!-- 상품가격 * 갯수 및 형변환 -->
					<c:set var="totalGoodsPrice"
						value="${totalGoodsPrice+item.goods_sales_price*cart_goods_qty }" />
		
					<c:set var="total_price"
						value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
					<!-- 변수세팅 및 형 변환 -->
		
					<!-- 가격정보 hidden input -->
					<input id="h_totalGoodsPrice" type="hidden"
						value="${totalGoodsPrice}" /> <input id="h_totalDeliveryPrice"
						type="hidden" value="${totalDeliveryPrice}" /> <input
						id="h_totalSalesPrice" type="hidden" value="${totalSalesPrice}" />
					<input id="h_final_totalPrice" type="hidden"
						value="${totalGoodsPrice+totalDeliveryPrice}" />
					<!-- 가격정보 hidden input -->
		
					<span> <!-- 총 상품가격 --> <span>상품총액 <span id="goodsPrice">${total_goods_price}</span>
							원
					</span> <span>+</span> <!-- 총 배송비 --> <span>기본 배송비 <span><fmt:formatNumber
									value="${totalDeliveryPrice}" pattern="#,###" /></span> 원
					</span> <span>=</span> <!-- 총 주문금액 --> 총 주문금액 <span
						class="text-black fw-bold fs-5 ms-3"> <span id="totalPrice">${total_price}</span>
							원
					</span>
					</span>
				</p>
				<!-- 선택상품 가격표시 영역 -->
		
			</c:when>
		</c:choose>
	
		
			<!-- 선택상품 주문하기 -->
			<div class="d-flex justify-content-end">
				<a href="javascript:fn_order_all_cart_goods()"
					class="btn btn-lg btn-main rounded-0 d-block fw-bold p-2 lh-lg mb-3">선택상품
					주문하기</a>
			</div>
			<!-- 선택상품 주문하기 -->
		</div>
	</div>
</section>
<!-- 쇼핑카트 end -->



<script>

	
/* input의 value를 select에 select해 사용자에게 보여주는 역할 */
var cart_goods_qty_inputs = document.getElementsByName("cart_goods_qty");
cart_goods_qty_inputs.forEach((cart_goods_qty_inputs) => {
let inputValue = cart_goods_qty_inputs.value;
let selectBox = cart_goods_qty_inputs.previousElementSibling;
let selectBox_len = selectBox.options.length;
for (let i=0; i<selectBox_len; i++){  
	if(selectBox.options[i].value == inputValue){
		selectBox.options[i].selected = true;
	}
}
});


//전체 선택을 눌렀을때 금액 계산
var total = 0;
var total_goods = 0;
const checkboxes = document.getElementsByName('checked_goods');
var totalPrice=document.getElementById("totalPrice");
var goodsPrice=document.getElementById("goodsPrice");
function selectAll(selectAll){
	const goods_sales_price = document.querySelectorAll(".goods_sales_price");
	//checked_goods name을 가진 checkbox가 체크되었는지 확인
	checkboxes.forEach((checkbox) => {checkbox.checked = selectAll.checked;}); 
	//체크되었을경우 금액추가
	if (selectAll.checked == true) {
		total_goods=0;
		total=0;
		for (const i of goods_sales_price) {total_goods += i.innerHTML*1;total=total_goods+4000;};
		goodsPrice.innerHTML=total_all.toLocaleString();
		totalPrice.innerHTML=total.toLocaleString();
	}
	//체크되지않았을 경우 금액빼기
	else if(selectAll.checked == false){ 
		for (const i of goods_sales_price) {total_goods -= i.innerHTML*1;total=total_goods+4000;};
		goodsPrice.innerHTML=total_goods.toLocaleString();
		totalPrice.innerHTML=total.toLocaleString();
	}
}


//체크박스를 누를때 금액 계산
let all_select = document.querySelector(".all-deal-select");
checkboxes.forEach((i) => i.addEventListener("click", function () {
	//체크되었을경우 금액추가
	if (this.checked == true) {total_goods += i.getAttribute("price")*1;total=total_goods+4000;}
	//체크되지않았을 경우 금액빼기
	else if(this.checked == false){total_goods -= i.getAttribute("price")*1;all_select.checked = false;total=total_goods+4000;}
	//계산된 금액 반영 innerHTML
	goodsPrice.innerHTML=total_goods.toLocaleString(); 
	totalPrice.innerHTML=total.toLocaleString();
}));

</script>