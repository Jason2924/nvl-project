<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/styles/shop_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/userplugins/styles/shop_responsive.css">

<!-- Home -->

<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="${pageContext.request.contextPath }/resources/userplugins/images/shop_background.jpg"></div>
	<div class="home_overlay"></div>
	<div
		class="home_content d-flex flex-column align-items-center justify-content-center">
		<h2 class="home_title">Search</h2>
	</div>
</div>

<!-- Shop -->

<div class="shop">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">

				<!-- Shop Content -->

				<div class="shop_content">
					<div class="shop_bar clearfix">
						<div class="shop_product_count">
							There are have <span>${count > 0 ? count : 'no any '}</span>
							product(s) be found by keyword : ${keyword }
						</div>
					</div>

					<div class="product_grid">
						<div class="product_grid_border"></div>

						<c:forEach var="product" items="${productList }">

							<% Date date = new Date(); %>
							<c:set var="today" value="<%=date %>"></c:set>

							<c:forEach var="price" items="${product.prices }">
								<c:if test="${price.status==true }">
									<c:set var="productPrice" value="${price.price }"></c:set>
								</c:if>
							</c:forEach>

							<fmt:setLocale value="en_US" />
							<a href="${pageContext.request.contextPath }/product?id=${product.id }">
								<div class="product_item is_new">
									<div class="product_border"></div>
									<div
										class="product_image d-flex flex-column align-items-center justify-content-center">
										<img style="height: 100%;"
											src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }"
											alt="">
									</div>
									<div class="product_content">
										<c:set var="discount" value="0"></c:set>
										<c:if
											test="${product.promotionDetails != null && empty product.promotionDetails == false }">
											<c:forEach var="promotionDetail"
												items="${product.promotionDetails }">
												<c:if
													test="${promotionDetail.promotion != null && promotionDetail.promotion.status == true }">
													<c:if
														test="${promotionDetail.promotion.startDate.before(today) && promotionDetail.promotion.endDate.after(today)}">
														<c:set var="discount"
															value="${discount + promotionDetail.promotion.price }"></c:set>
													</c:if>
												</c:if>
											</c:forEach>
										</c:if>
										<c:choose>
											<c:when test="${productPrice <= 0 }">
												<div class="product_price">Updating</div>
											</c:when>
											<c:when test="${product.quantity <= 0 }">
												<div class="product_price">Sold out</div>
											</c:when>
											<c:when test="${discount > 0 && productPrice > 0 }">
												<div class="viewed_price">
													<fmt:formatNumber
														value="${productPrice - (price * discount / 100) }"
														type="currency" />
													<span> <fmt:formatNumber value="${productPrice}"
															type="currency" />
													</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="viewed_price">
													<fmt:formatNumber value="${productPrice}" type="currency" />
												</div>
											</c:otherwise>
										</c:choose>
										<!-- <div class="product_price">$${productPrice }</div> -->
										<div class="product_name">
											<div>
												<a
													href="${pageContext.request.contextPath }/product?id=${product.id }"
													tabindex="0">${product.name }</a>
											</div>
										</div>
									</div>
									<div class="product_fav">
										<i class="fas fa-heart"></i>
									</div>
									<ul class="product_marks">
										<c:if
											test="${discount > 0 && productPrice > 0 && product.quantity > 0}">
											<li class="product_mark product_discount"
												style="display: inline-block; visibility: visible; opacity: 1;">
												<fmt:formatNumber type="number" value="${discount }"></fmt:formatNumber>%
											</li>
										</c:if>
										<!-- <li class="product_mark product_new">new</li> -->
									</ul>
								</div>
							</a>
						</c:forEach>

					</div>

				</div>

			</div>
		</div>
	</div>
</div>

<!-- Brands -->

<div class="brands">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="brands_slider_container">

					<!-- Brands Slider -->

					<div class="owl-carousel owl-theme brands_slider">

						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_1.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_2.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_3.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_4.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_5.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_6.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_7.jpg"
									alt="">
							</div>
						</div>
						<div class="owl-item">
							<div
								class="brands_item d-flex flex-column justify-content-center">
								<img
									src="${pageContext.request.contextPath }/resources/userplugins/images/brands_8.jpg"
									alt="">
							</div>
						</div>

					</div>

					<!-- Brands Slider Navigation -->
					<div class="brands_nav brands_prev">
						<i class="fas fa-chevron-left"></i>
					</div>
					<div class="brands_nav brands_next">
						<i class="fas fa-chevron-right"></i>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<!-- Scroll to Top -->
<a id="scroll-to-top" href="#" class="btn btn-primary btn-lg"
	role="button" title="Return to top of page" data-toggle="tooltip"
	data-placement="left"><i class="fa fa-arrow-up"></i></a>

<script
	src="${pageContext.request.contextPath }/resources/userplugins/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/popper.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TweenMax.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TimelineMax.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/animation.gsap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/ScrollToPlugin.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/easing/easing.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/Isotope/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/plugins/parallax-js-master/parallax.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/userplugins/js/shop_custom.js"></script>
