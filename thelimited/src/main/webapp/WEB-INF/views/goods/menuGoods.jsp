<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="container">
	<div class="row justify-content-center">
		<div class="p-0 align-items-center gap-3 mt-5 mb-3">
		
			<!-- 카테고리 명 -->
			<!-- <p class="fs-3 fw-bold">상품목록</p> -->
			<!-- 카테고리 명 -->
			<p class="fs-6 mb-3 menu_title">${menuGoods}</p>
			
			
		</div>
	</div>


	<div class="row mt-4">
		<div
			class="d-flex categoryGoodList align-items-start flex-wrap p-0" style="gap: 4.1rem!important;">
			<c:choose>
			
				<c:when test="${empty goodsList}">
					해당 카테고리에 상품이 없습니다.
				</c:when>

				<c:otherwise>
					<c:forEach var="item" items="${goodsList}">
						<div class="p-0" style="width: 250px; height: 250px">
							<a
								href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id}"
								class="text-decoration-none d-block"> <img
								src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"
								style="width: 200px; height: 200px">
								<p class="mt-4 mb-0 text-truncate fw-bold fs-6">${item.goods_title}</p>
								<p><span class="text-danger fw-bold fs-4 me-1">
								<fmt:formatNumber value="${item.goods_sales_price}" pattern="#,###" />
								</span>원</p>
							</a>
						</div>
					</c:forEach>
				</c:otherwise>

			</c:choose>
		</div>
	</div>
</div>


