<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/slick-1.8.0/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/responsive.css">

	
	<!-- Banner -->

	<div class="banner">
		<div class="banner_background" style="background-image:url(images/banner_background.jpg)"></div>
		<div class="container fill_height">
			<div class="row fill_height">
				<div class="banner_product_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/banner_product.png" alt=""></div>
				<div class="col-lg-5 offset-lg-4 fill_height">
					<div class="banner_content">
						<h1 class="banner_text">new era of smartphones</h1>
						<div class="banner_price">Accessories</div>
						<div class="banner_product_name">And Others More</div>
						<div class="button banner_button"><a href="${pageContext.request.contextPath }">Shop Now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Characteristics -->

	<div class="characteristics">
		<div class="container">
			<div class="row">

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="${pageContext.request.contextPath }/resources/userplugins/images/char_1.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">Free Delivery</div>
							<div class="char_subtitle">for all Products</div>
						</div>
					</div>
				</div>

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="${pageContext.request.contextPath }/resources/userplugins/images/char_2.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">Refund</div>
							<div class="char_subtitle">if product's problem</div>
						</div>
					</div>
				</div>

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="${pageContext.request.contextPath }/resources/userplugins/images/char_3.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">Pay at home</div>
							<div class="char_subtitle">free deposit</div>
						</div>
					</div>
				</div>

				<!-- Char. Item -->
				<div class="col-lg-3 col-md-6 char_col">
					
					<div class="char_item d-flex flex-row align-items-center justify-content-start">
						<div class="char_icon"><img src="${pageContext.request.contextPath }/resources/userplugins/images/char_4.png" alt=""></div>
						<div class="char_content">
							<div class="char_title">Warranty</div>
							<div class="char_subtitle">for 6 month</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Deals of the week -->

	<div class="deals_featured">
		<div class="container">
			<div class="row">
				<div class="col d-flex flex-lg-row flex-column align-items-center justify-content-start">
					
					<% Date date = new Date(); %>
					<c:set var="today" value="<%=date %>"></c:set>
					<!-- Featured -->
					<div class="featured" style="width:100%;">
						<div class="tabbed_container">
							<div class="tabs">
								<ul class="clearfix">
									<c:set var="firstCate" value="1"></c:set>
									<c:forEach var="category" items="${categoryList }">
										<c:if test="${firstCate != 1 }">
											<li>${category.name }</li>
										</c:if>
										<c:if test="${firstCate == 1 }">
											<li class="active">${category.name }</li>
											<c:set var="firstCate" value="2"></c:set>
										</c:if>
									</c:forEach>
								</ul>
								<div class="tabs_line"><span></span></div>
							</div>

							<!-- Product Panel -->
							<c:set var="firstCateProduct" value="1"></c:set>
							<c:forEach var="category" items="${categoryList }">
							<c:choose>
								<c:when test="${firstCateProduct == 1 }">
									<div class="product_panel panel active">
								<div class="featured_slider slider">
									<!-- Slider Item -->
									<c:forEach var="product" items="${category.products }">
									<c:if test="${product.status == true }">
									<c:forEach var="price" items="${product.prices }">
										<c:if test="${price.status == true }">
											<c:set var="productPrice" value="${price.price }"></c:set>
										</c:if>
									</c:forEach>
									
									<div class="featured_slider_item">
										<div class="border_active"></div>
										<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
											<div class="product_image d-flex flex-column align-items-center justify-content-center">
												<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }" alt="">
											</div>
											<c:set var="discount" value="0"></c:set>
									<c:if test="${product.promotionDetails != null && empty product.promotionDetails == false }">
										<c:forEach var="promotionDetail" items="${product.promotionDetails }">
											<c:if test="${promotionDetail.promotion != null && promotionDetail.promotion.status == true}">
											<c:if test="${promotionDetail.promotion.startDate.before(today) && promotionDetail.promotion.endDate.after(today)}">
												<c:set var="discount" value="${discount + promotionDetail.promotion.price }"></c:set>
												</c:if>
											</c:if>
										</c:forEach>
									</c:if>
									<div class="product_content">
									<c:choose>
										<c:when test="${productPrice <= 0 }">
											<div class="product_price">
												Updating
											</div>
										</c:when>
										<c:when test="${product.quantity <= 0 }">
											<div class="product_price">
												Sold out
											</div>
										</c:when>
										<c:when test="${discount > 0 && productPrice > 0 }">
											<div class="product_price discount">
												<fmt:formatNumber value="${productPrice - (productPrice * discount / 100) }" type = "currency"/>
												<span>
												<fmt:formatNumber value="${productPrice}" type = "currency"/>
												</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="product_price">
												<fmt:formatNumber value="${productPrice}" type = "currency"/>
											</div>
										</c:otherwise>
									</c:choose>
												<div class="product_name"><div><a href="${pageContext.request.contextPath }/product?id=${product.id }">${product.name }</a></div></div>
											</div>
											<div class="product_fav"><i class="fas fa-heart"></i></div>
									<c:if test="${discount > 0 && productPrice > 0 && product.quantity > 0}">
									<ul class="product_marks">
										<li class="product_mark product_discount"><fmt:formatNumber type="number" value="${discount }"></fmt:formatNumber>%</li>
									</ul>
									</c:if>
										</div>
									</div>
									</c:if>
									</c:forEach>
									
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div>
							<c:set var="firstCateProduct" value="2"></c:set>
								</c:when>
								<c:otherwise>
									<div class="product_panel panel">
								<div class="featured_slider slider">
									<!-- Slider Item -->
									<c:forEach var="product" items="${category.products }">
									<c:if test="${product.status == true }">
									<c:forEach var="price" items="${product.prices }">
										<c:if test="${price.status==true }">
											<c:set var="productPrice" value="${price.price }"></c:set>
										</c:if>
									</c:forEach>
									
									<div class="featured_slider_item">
										<div class="border_active"></div>
										<div class="product_item discount d-flex flex-column align-items-center justify-content-center text-center">
											<div class="product_image d-flex flex-column align-items-center justify-content-center">
												<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }" alt="">
											</div>
											<c:set var="discount" value="0"></c:set>
									<c:if test="${product.promotionDetails != null && empty product.promotionDetails == false }">
										<c:forEach var="promotionDetail" items="${product.promotionDetails }">
											<c:if test="${promotionDetail.promotion != null && promotionDetail.promotion.status == true }">
											<c:if test="${promotionDetail.promotion.startDate.before(today) && promotionDetail.promotion.endDate.after(today)}">
												<c:set var="discount" value="${discount + promotionDetail.promotion.price }"></c:set>
											</c:if>
											</c:if>
										</c:forEach>
									</c:if>
									<div class="product_content">
									<c:choose>
										<c:when test="${productPrice <= 0 }">
											<div class="product_price">
												Updating
											</div>
										</c:when>
										<c:when test="${product.quantity <= 0 }">
											<div class="product_price">
												Sold out
											</div>
										</c:when>
										<c:when test="${discount > 0 && productPrice > 0 }">
											<div class="product_price discount">
												<fmt:formatNumber value="${productPrice - (productPrice * discount / 100) }" type = "currency"/>
												<span>
												<fmt:formatNumber value="${productPrice}" type = "currency"/>
												</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="product_price">
												<fmt:formatNumber value="${productPrice}" type = "currency"/>
											</div>
										</c:otherwise>
									</c:choose>
									<div class="product_name"><div><a href="${pageContext.request.contextPath }/product?id=${product.id }">${product.name }</a></div></div>
									</div>
									<c:if test="${discount > 0 && productPrice > 0 && product.quantity > 0}">
									<ul class="product_marks">
										<li class="product_mark product_discount"><fmt:formatNumber type="number" value="${discount }"></fmt:formatNumber>%</li>
									</ul>
									</c:if>
										</div>
									</div>
									</c:if>
									</c:forEach>
								</div>
								<div class="featured_slider_dots_cover"></div>
							</div>
								</c:otherwise>
							</c:choose>
							</c:forEach>
	
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Popular Categories -->

	<div class="popular_categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="popular_categories_content">
						<div class="popular_categories_title">Popular Categories</div>
						<div class="popular_categories_slider_nav">
							<div class="popular_categories_prev popular_categories_nav"><i class="fas fa-angle-left ml-auto"></i></div>
							<div class="popular_categories_next popular_categories_nav"><i class="fas fa-angle-right ml-auto"></i></div>
						</div>
						<div class="popular_categories_link"><a href="#">full catalog</a></div>
					</div>
				</div>
				
				<!-- Popular Categories Slider -->

				<div class="col-lg-9">
					<div class="popular_categories_slider_container">
						<div class="owl-carousel owl-theme popular_categories_slider">

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/popular_1.png" alt=""></div>
									<div class="popular_category_text">Smartphones</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/popular_5.png" alt=""></div>
									<div class="popular_category_text">Accessories</div>
								</div>
							</div>
							
							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/popular_1.png" alt=""></div>
									<div class="popular_category_text">Smartphones</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/popular_5.png" alt=""></div>
									<div class="popular_category_text">Accessories</div>
								</div>
							</div>
							
							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/popular_1.png" alt=""></div>
									<div class="popular_category_text">Smartphones</div>
								</div>
							</div>

							<!-- Popular Categories Item -->
							<div class="owl-item">
								<div class="popular_category d-flex flex-column align-items-center justify-content-center">
									<div class="popular_category_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/popular_5.png" alt=""></div>
									<div class="popular_category_text">Accessories</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Best Sellers -->

	<div class="best_sellers">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="tabbed_container">
						<div class="tabs clearfix tabs-right">
							<div class="new_arrivals_title">Promotion</div>
							<c:set var="promoCate" value="1"></c:set>
							<ul class="clearfix">
								<li class="active">High Rate</li>
								<c:forEach var="promotion" items="${promotionList }">
									<li>${promotion.name }</li>
								</c:forEach>
							</ul>
							<div class="tabs_line"><span></span></div>
						</div>
						
						<div class="bestsellers_panel panel active">

							<!-- Best Sellers Slider -->
						
							<div class="bestsellers_slider slider">
								
								<c:forEach var="product" items="${productRateList }" begin="0" end="10">
								
								<c:forEach var="price" items="${product.prices }">
									<c:if test="${price.status==true }">
										<c:set var="productPrice" value="${price.price }"></c:set>
									</c:if>
								</c:forEach>
								<c:set var="discount" value="0"></c:set>
								<c:if test="${product.promotionDetails != null && empty product.promotionDetails == false }">
									<c:forEach var="promotionDetail" items="${product.promotionDetails }">
										<c:if test="${promotionDetail.promotion != null && promotionDetail.promotion.status == true }">
											<c:if test="${promotionDetail.promotion.startDate.before(today) && promotionDetail.promotion.endDate.after(today)}">
												<c:set var="discount" value="${discount + promotionDetail.promotion.price }"></c:set>
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<!-- Best Sellers Item -->
								<div class="bestsellers_item discount">
									<div class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
										<div class="bestsellers_image">
											<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }" alt="">
										</div>
										<div class="bestsellers_content">
											<div class="bestsellers_category">
												<a href="${pageContext.request.contextPath }/shop/category?id=${product.category.id }">${product.category.name }</a>
											</div>
											<div class="bestsellers_name">
												<a href="${pageContext.request.contextPath }/product?id=${product.id }">${product.name }</a>
											</div>
											<div>
												${product.rate } <i class="fas fa-star" style="color: #547ef89e;"></i>
											</div>
											<c:choose>
												<c:when test="${productPrice <= 0 }">
													<div class="product_price">
														Updating
													</div>
												</c:when>
												<c:when test="${product.quantity <= 0 }">
													<div class="product_price">
														Sold out
													</div>
												</c:when>
												<c:when test="${discount > 0 && productPrice > 0 }">
													<div class="bestsellers_price discount">
														<fmt:formatNumber value="${productPrice - (productPrice * discount / 100) }" type="currency" />
														<span>
															<fmt:formatNumber value="${productPrice}" type="currency" />
														</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="bestsellers_price">
														<fmt:formatNumber value="${productPrice}" type="currency" />
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<c:if test="${discount > 0 && productPrice > 0 && product.quantity > 0 }">
									<ul class="bestsellers_marks">
										<li class="bestsellers_mark bestsellers_discount"><fmt:formatNumber type="number" value="${discount }"></fmt:formatNumber>%</li>
									</ul>
									</c:if>
								</div>
								</c:forEach>
							</div>
						</div>
						
						<c:forEach var="promotion" items="${promotionList }">
						<div class="bestsellers_panel panel">

							<!-- Best Sellers Slider -->
							<div class="bestsellers_slider slider">
								
								<c:forEach var="promotionDetail" items="${promotion.promotionDetails }">
								<c:set var="product" value="${promotionDetail.product }"></c:set>
								<c:if test="${product.status == true && promotionDetail.status == true }">
								<c:forEach var="price" items="${product.prices }">
									<c:if test="${price.status==true }">
										<c:set var="productPrice" value="${price.price }"></c:set>
									</c:if>
								</c:forEach>
								<c:set var="discount" value="0"></c:set>
								<c:if test="${product.promotionDetails != null && empty product.promotionDetails == false }">
									<c:forEach var="promotionDetail" items="${product.promotionDetails }">
										<c:if test="${promotionDetail.promotion != null && promotionDetail.promotion.status == true }">
											<c:if test="${promotionDetail.promotion.startDate.before(today) && promotionDetail.promotion.endDate.after(today)}">
												<c:set var="discount" value="${discount + promotionDetail.promotion.price }"></c:set>
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
								<!-- Best Sellers Item -->
								<div class="bestsellers_item discount">
									<div class="bestsellers_item_container d-flex flex-row align-items-center justify-content-start">
										<div class="bestsellers_image">
											<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }" alt="">
										</div>
										<div class="bestsellers_content">
											<div class="bestsellers_category">
												<a href="${pageContext.request.contextPath }/shop/category?id=${product.category.id }">${product.category.name }</a>
											</div>
											<div class="bestsellers_name">
												<a href="${pageContext.request.contextPath }/product?id=${product.id }">${product.name }</a>
											</div>
											<div>
												${product.rate } <i class="fas fa-star" style="color: #547ef89e;"></i>
											</div>
											<c:choose>
												<c:when test="${productPrice <= 0 }">
													<div class="product_price">
														Updating
													</div>
												</c:when>
												<c:when test="${product.quantity <= 0 }">
													<div class="product_price">
														Sold out
													</div>
												</c:when>
												<c:when test="${discount > 0 && productPrice > 0 }">
													<div class="bestsellers_price discount">
														<fmt:formatNumber value="${productPrice - (productPrice * discount / 100) }" type="currency" />
														<span>
															<fmt:formatNumber value="${productPrice}" type="currency" />
														</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="bestsellers_price">
														<fmt:formatNumber value="${productPrice}" type="currency" />
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<c:if test="${discount > 0 && productPrice > 0 && product.quantity > 0 }">
										<ul class="bestsellers_marks">
											<li class="bestsellers_mark bestsellers_discount"><fmt:formatNumber type="number" value="${discount }"></fmt:formatNumber>>%</li>
										</ul>
									</c:if>
								</div>
								</c:if>
								</c:forEach>
							</div>
						</div>
						</c:forEach>
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
							
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_1.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_2.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_3.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_4.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_5.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_6.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_7.jpg" alt=""></div></div>
							<div class="owl-item"><div class="brands_item d-flex flex-column justify-content-center"><img src="${pageContext.request.contextPath }/resources/userplugins/images/brands_8.jpg" alt=""></div></div>

						</div>
						
						<!-- Brands Slider Navigation -->
						<div class="brands_nav brands_prev"><i class="fas fa-chevron-left"></i></div>
						<div class="brands_nav brands_next"><i class="fas fa-chevron-right"></i></div>

					</div>
				</div>
			</div>
		</div>
	</div>

<script src="${pageContext.request.contextPath }/resources/userplugins/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/slick-1.8.0/slick.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/custom.js"></script>