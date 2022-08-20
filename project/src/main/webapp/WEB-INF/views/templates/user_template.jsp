<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>NVLTech</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/loginplugins/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/profileplugins/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/scroll_top.css"> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/profileplugins/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/scroll_top.css">

<style>
	.js-1-rows {
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>

<body>

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
								<img src="${pageContext.request.contextPath }/resources/userplugins/images/phone.png" alt="">
							</div>098.778.2201 - (028).3880.3888
						</div>
						<div class="top_bar_contact_item">
							<div class="top_bar_icon">
								<img src="${pageContext.request.contextPath }/resources/userplugins/images/mail.png" alt="">
							</div>
							<a href="${pageContext.request.contextPath }/contact">nvlteam123@gmail.com</a>
						</div>
						<div class="top_bar_content ml-auto">
							<div class="top_bar_user">
								<c:if test="${sessionScope.account == null}">
									<div><a href="${pageContext.request.contextPath }/register/index">Register</a></div>
									<div><a href="${pageContext.request.contextPath }/login/index">Sign in</a></div>
								</c:if>
								<c:if test="${sessionScope.account != null}">
									<div>
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Profile</button>
									</div>
									<div>
										<a href="${pageContext.request.contextPath }/home/signout">Sign out</a>
									</div>
								</c:if>
							</div>
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
					<div class="col-lg-3 col-sm-3 col-3 order-1">
						<div class="logo_container">
							<div class="logo"><a href="${pageContext.request.contextPath }/home/index">NVLTech</a></div>
						</div>
					</div>

					<!-- Search -->
					<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
						<div class="header_search">
							<div class="header_search_content">
								<div class="header_search_form_container">
								<!-- JS Edit 5-7-2020 -->
									<form action="${pageContext.request.contextPath }/search" method="get" class="header_search_form clearfix">
										<input type="search" required="required" name="keyword" class="header_search_input" placeholder="Search for products...">
										<div class="custom_dropdown">
											<div class="custom_dropdown_list">
												<span class="custom_dropdown_placeholder clc">All Categories</span>
												<i class="fas fa-chevron-down"></i>
												<ul class="custom_list clc">
													<li><a class="choose-cate clc" href="#" data-category="0">All Categories</a></li>
													<li><a class="choose-cate clc" href="#" data-category="1">Smart Phone</a></li>
													<li><a class="choose-cate clc" href="#" data-category="2">Accessory</a></li>
												</ul>
											</div>
										</div>
										<input id="chose-cate" type="hidden" name="category" value="0">
										<button type="submit" class="header_search_button trans_300" value="Submit">
											<img src="${pageContext.request.contextPath }/resources/userplugins/images/search.png" alt="">
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Profile -->
					<div class="col-lg-3 col-9 order-lg-3 order-2 text-lg-left text-right">
						<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
							<!-- <div class="wishlist d-flex flex-row align-items-center justify-content-end">
							</div> -->
							
							<!-- Cart -->
							<div class="cart">
								<div class="cart_container d-flex flex-row align-items-center justify-content-end">
									<div class="cart_icon">
										<img src="${pageContext.request.contextPath }/resources/userplugins/images/cart.png" alt="">
										<div class="cart_count">
											<span id="cart-size">${sessionScope.cartList == null ? 0 : sessionScope.cartList.size() }</span>
										</div>
									</div>
									<div class="cart_content">
										<div class="cart_text">
											<ul class="standard_dropdown main_nav_dropdown">
												<li class="hassubs">
													<a href="${pageContext.request.contextPath }/cart/index">Cart</a>
													
													<ul class="cart_list" id="cart_list">
														<c:if test="${sessionScope.cartList == null || empty sessionScope.cartList == true }">
														<li style="text-align: center; height: auto;" class="cart_item clearfix" id="cart_item">
															Your cart is empty
														</li>
														</c:if>
														<c:forEach var="cart" items="${sessionScope.cartList }">
														<li style="height: auto;" class="cart_item clearfix cart-top-item" id="cart_item" data-id="${cart.product.id }">
															<div style="display: grid; grid-template-columns: 88px auto;">
															<div style="width: 88px; height: 88px;" class="cart_item_image" id="cart_item_image">
																<a style="height: 100%; text-align: center;" href="${pageContext.request.contextPath }/product?id=${cart.product.id }">
																	<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${cart.product.photo }">
																</a>
															</div>
															<div style="padding: 0px 0px 0px 20px; width: unset; overflow: hidden;" class="cart_item_info" id="cart_item_info">
																<div style="text-align: left; margin: 0px;" class="cart_item_name cart_info_col" id="cart_item_name">
																	<a style="line-height: unset;" class="js-1-rows" href="${pageContext.request.contextPath }/product?id=${cart.product.id }">
																		${cart.product.name }
																	</a>
																</div>
																<div style="text-align: left; padding: 10px 0px;" class="cart_item_price cart_info_col" id="cart_item_name">
																	<div style="display: inline-block;" class="cart_item_title">Price : </div>
																	<div style="font-size: 15px; margin: 0px; display: inline-block;" class="cart_item_text"><fmt:formatNumber value="${cart.price }" type="currency"></fmt:formatNumber></div>
																	&nbsp;x&nbsp;
																	<div style="display: inline-block;" class="cart-quantity" data-id="${cart.product.id }">${cart.quantity }</div>
																</div>
																<div style="text-align: left;" class="cart_item_total cart_info_col" id="cart_item_name">
																	<button style="left: 0px; outline: none;" class="trash tooltip " data-id="${cart.product.id }">
																		<span class="lid"></span> <span class="can"></span>
																	</button>
																</div>
															</div>
															</div>
														</li>
														</c:forEach>
													</ul>
													
												</li>
											</ul>
										</div>
										<c:if test="${sessionScope.cartList != null}" >
											<c:set var="totalPrice" value="0"></c:set>
											<c:forEach var="cart" items="${sessionScope.cartList }">
												<c:set var="totalPrice" value="${totalPrice + cart.price * cart.quantity }"></c:set>
											</c:forEach>
											<div id="cart-total-price" class="cart_price"><fmt:formatNumber value="${totalPrice }" type="currency"></fmt:formatNumber></div>
										</c:if>
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

							<div class="cat_menu_container">
								<div class="cat_menu_title d-flex flex-row align-items-center justify-content-start">
									<div class="cat_burger"><span></span><span></span><span></span></div>
									<div class="cat_menu_text">categories</div>
								</div>

								<ul class="cat_menu">
									<li><a href="${pageContext.request.contextPath }/shop/index">All Products<i class="fas fa-chevron-right"></i></a></li>
									<li class="hassubs">
										<a href="${pageContext.request.contextPath }/shop/category?id=1">Smart Phone</a>
									</li>
									<li class="hassubs">
										<a href="${pageContext.request.contextPath }/shop/category?id=2">Accessory</a>
									</li>
								</ul>
							</div>

							<!-- Main Nav Menu -->

							<div class="main_nav_menu ml-auto">
								<ul class="standard_dropdown main_nav_dropdown">
									<li><a href="${pageContext.request.contextPath }/home/index">Home<i class="fas fa-chevron-down"></i></a></li>
									<li class="hassubs">
										<a href="${pageContext.request.contextPath }/shop/index">Shop<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li><a href="${pageContext.request.contextPath }/shop/category?id=1">Smart Phone<i class="fas fa-chevron-down"></i></a></li>
											<li><a href="${pageContext.request.contextPath }/shop/category?id=2">Accessory<i class="fas fa-chevron-down"></i></a></li>
										</ul>
									</li>
									<li><a href="${pageContext.request.contextPath }/contact/index">Contact<i class="fas fa-chevron-down"></i></a></li>
									<li class="hassubs od-cont">
										<a href="javascript:;">Order Tracking<i class="fas fa-chevron-down"></i></a>
										<ul>
											<li>
												<form action="${pageContext.request.contextPath }/invoice" method="get">
													<input type="text" class="od-txt-m" name="orderCode" placeholder="Order Code">
													<button class="od-btn-m btn btn-primary float-right">Submit</button>
												</form>
											</li>
										</ul>
									</li>
								</ul>
							</div>

							<!-- Menu Trigger -->

							<div class="menu_trigger_container ml-auto">
								<div class="menu_trigger d-flex flex-row align-items-center justify-content-end">
									<div class="menu_burger">
										<div class="menu_trigger_text">menu</div>
										<div class="cat_burger menu_burger_inner"><span></span><span></span><span></span></div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<!-- Menu -->

		<div class="page_menu" id="page_menu">
			<div class="container">
				<div class="row">
					<div class="col">
						
						<div class="page_menu_content" id="page_menu_content">
							
							<div class="page_menu_search" id="page_menu_search">
								<form action="#">
									<input type="search" required="required" class="page_menu_search_input" id="page_menu_search_input" placeholder="Search for products...">
								</form>
							</div>
							<ul class="page_menu_nav">
							
								<li class="page_menu_item" id="page_menu_item">
									<a href="${pageContext.request.contextPath }/home/index">Home<i class="fa fa-angle-down"></i></a>
								</li>

								<li id="accordion">
									<div class="card" id="card">
										<div class="card-header page_menu_item card-header-rm" id="card-header page_menu_item">
											<a class="card-link" data-toggle="collapse" href="#collapseThree">SHOP<i class="fa fa-angle-down has-children"></i></a>
										</div>
										<div id="collapseThree" class="collapse" data-parent="#accordion">
											<div class="card-body" id="card-body">
												<ul>
													<li><a href="${pageContext.request.contextPath }/shop">SMART PHONE</a></li>
													<li><a href="${pageContext.request.contextPath }/shop">ACCESSORY</a></li>
												</ul>
											</div>
										</div>
									</div>
								</li>
								<li class="page_menu_item" id="page_menu_item">
									<a href="${pageContext.request.contextPath }/contact/index">Contact<i class="fa fa-angle-down"></i></a>
								</li>
								
								<li id="accordion">
									<div class="card" id="card">
										<div class="card-header page_menu_item card-header-rm" id="card-header page_menu_item">
											<a class="card-link" data-toggle="collapse" href="#collapseFour">ORDER TRACKING <i class="fa fa-angle-down has-children"></i></a>
										</div>
										<div id="collapseFour" class="collapse"
											data-parent="#accordion">
											<div class="card-body" id="card-body">
												<ul>
													<li>
														<form action="${pageContext.request.contextPath }/invoice" method="post">
															<input type="text" name="orderCode" placeholder="Order Code" class="od-txt">
															<button type="submit">submit</button>
														</form>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</li>
								
								<li id="accordion">
									<div class="card" id="card">
										<div class="card-header page_menu_item card-header-rm" id="card-header page_menu_item">
											<a class="card-link" data-toggle="collapse" href="#collapseFive">ACCOUNT <i class="fa fa-angle-down has-children"></i></a>
										</div>
										<div id="collapseFive" class="collapse"
											data-parent="#accordion">
											<div class="card-body" id="card-body">
												<ul>
													<c:if test="${sessionScope.account == null}">
													<li><a href="${pageContext.request.contextPath }/register/index">REGISTER</a></li>
													<li><a href="${pageContext.request.contextPath }/login/index">SIGN IN</a></li>
													</c:if>
													<c:if test="${sessionScope.account != null}">
													<li><a href="#" data-toggle="modal" data-target="#myModal">PROFILE</a></li>
													<li><a href="${pageContext.request.contextPath }/home/signout">SIGN OUT</a></li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</li>
								
							</ul>
							
							<div class="menu_contact">
								<div class="menu_contact_item" id="menu_contact_item"><div class="menu_contact_icon" id="menu_contact_icon"><img src="${pageContext.request.contextPath }/resources/userplugins/images/phone_white.png" alt=""></div>098.778.2201 - (028).3880.3888</div>
								<div class="menu_contact_item" id="menu_contact_item"><div class="menu_contact_icon" id="menu_contact_icon"><img src="${pageContext.request.contextPath }/resources/userplugins/images/mail_white.png" alt=""></div><a href="#">NVLTeam@gmail.com</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</header>
	<!-- ==================================================================================================================================================
	==================================================================================================================================================
	================================================================================================================================================== -->
	
	
	<tiles:insertAttribute name="content"></tiles:insertAttribute>

	<!-- Footer -->

	<footer class="footer">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 footer_col">
					<div class="footer_column footer_contact">
						<div class="logo_container">
							<div class="logo"><a href="#">NVLTech</a></div>
						</div>
						<div class="footer_title">Got Question? Call Us 24/7</div>
						<div class="footer_phone">098.778.2201 - (028).3880.3888</div>
						
						<div class="footer_contact_text">
							<p>440/30 Nguyen Kiem Street, Ward 3, Phu Nhuan District</p>
							<p>Ho Chi Minh City, VN</p>
						</div>
						<div class="footer_social">
							<ul>
								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-youtube"></i></a></li>
								<li><a href="#"><i class="fab fa-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-2 offset-lg-2">
					<div class="footer_column">
						<div class="footer_title">Menu</div>
						<ul class="footer_list">
							<li><a href="${pageContext.request.contextPath }/home">Home</a></li>
							<li><a href="${pageContext.request.contextPath }/shop">Shop</a></li>
							<li><a href="${pageContext.request.contextPath }/contact">Contact</a></li>
						</ul>
						<!-- <div class="footer_subtitle">Gadgets</div>
						<ul class="footer_list">
							<li><a href="#">Car Electronics</a></li>
						</ul> -->
					</div>
				</div>

				<div class="col-lg-2">
					<div class="footer_column">
						<div class="footer_title">Categories</div>
						<ul class="footer_list">
							<li><a href="${pageContext.request.contextPath }/shop">All Products</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/category?id=1">Smart Phone</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/category?id=2">Accessory</a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</footer>

	<!-- Copyright -->

	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<div class="copyright_container d-flex flex-sm-row flex-column align-items-center justify-content-start">
						<div class="copyright_content"> Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
						All rights reserved | This template made by <a href="#" target="_blank">NVLTeam</a>
					</div>
						<div class="logos ml-sm-auto">
							<ul class="logos_list">
								<li><a href="#"><img src="${pageContext.request.contextPath }/resources/userplugins/images/logos_1.png" alt=""></a></li>
								<li><a href="#"><img src="${pageContext.request.contextPath }/resources/userplugins/images/logos_2.png" alt=""></a></li>
								<li><a href="#"><img src="${pageContext.request.contextPath }/resources/userplugins/images/logos_3.png" alt=""></a></li>
								<li><a href="#"><img src="${pageContext.request.contextPath }/resources/userplugins/images/logos_4.png" alt=""></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Scroll to Top -->
<a id="scroll-to-top" href="#" class="btn btn-primary btn-lg" role="button" title="Return to top of page" data-toggle="tooltip" data-placement="left"><i class="fa fa-arrow-up"></i></a>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/scroll_top.js"></script>

<%-- <script src="${pageContext.request.contextPath }/resources/userplugins/js/jquery-3.3.1.min.js"></script>
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
<script src="${pageContext.request.contextPath }/resources/userplugins/js/scroll_top.js"></script>

<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/shop_custom.js"></script>

<script src="${pageContext.request.contextPath }/resources/userplugins/https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/contact_custom.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/cart_custom.js"></script> --%>
<!-- The Modal -->
<c:if test="${sessionScope.account != null }">
  <div class="modal fade" id="myModal">
    <div class="modal-dialog" style="max-width: 1140px;">
      <div class="modal-content modal-xl">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">My Profile</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
					<div class="container emp-profile">
						<form method="post">
							<div class="row" style="margin: 0px; padding: 10px 0px;">
								<%-- <div class="col-md-4">
									<div class="profile-img">
										<img src="${pageContext.request.contextPath }/resources/profileplugins/img/avatar.png"/>
									</div>
								</div> --%>
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-10 profile-head">
											<h5>User Name : ${sessionScope.account.username }</h5>
											<h6>${sessionScope.account.role == 'ROLE_MEMBER' ? 'Member' : '' }</h6>
											<p class="proile-rating">Credit Point : <span>${sessionScope.account.creditPoint }</span></p>
										</div>
										<div class="col-md-2" style="padding: 10px 0px;">
											<a href="${pageContext.request.contextPath }/manageprofile/index">
												<button type="button" class="btn btn-primary profile-edit-btn" style="width: 100%;">Edit Profile</button>
												</a>
										</div>
									</div>
									<div class="row">
										<ul class="col-md-12 nav nav-tabs" id="myTab" role="tablist">
											<li class="nav-item">
											<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
											</li>
											<li class="nav-item">
											<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">History</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row" style="margin: 0px;">
								<div class="col-md-4">
								</div>
								<div class="col-md-12" style="padding: 0px;">
									<div class="tab-content profile-tab" id="myTabContent">
										<div class="tab-pane fade show active" id="home"
											role="tabpanel" aria-labelledby="home-tab">
											<div class="row">
												<div class="col-md-6">
													<label>Full Name</label>
												</div>
												<div class="col-md-6">
													<p>${sessionScope.account.fullName }</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Email</label>
												</div>
												<div class="col-md-6">
													<p>${sessionScope.account.email }</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Phone</label>
												</div>
												<div class="col-md-6">
													<p>${sessionScope.account.phone }</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Address</label>
												</div>
												<div class="col-md-6">
													<p>${sessionScope.account.address }</p>
												</div>
											</div>
										</div>
										<div class="tab-pane fade" id="profile" role="tabpanel"
											aria-labelledby="profile-tab">
											<div class="row">
	<!-- Order History -->
	
    <div class="container cont-history">
    <table class="table table-bordered table_form">
        <thead>
            <tr>
                <th>No</th>
                <th>Address</th>
                <th>Price</th>
                <th>Status</th>
                <th>Created Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="history-table">
        	<%-- <c:set var="no" value="0"></c:set>
        	<c:forEach var="order" items="${sessionScope.account.orders }">
        	<c:set var="no" value="${no + 1 }"></c:set>
            <tr class="active">
                <td>${no }</td>
                <c:forEach var="delivery" items="${order.deliveries }">
                <td>${delivery.destination }</td>
                </c:forEach>
                <c:forEach var="payment" items="${order.payments }">
                <td>${payment.price }</td>
                </c:forEach>
                <td>${order.status }</td>
                <td>
                	<a href="${pageContext.request.contextPath }/invoice?orderCode=${order.code }">Details</a>
                </td>
            </tr>
            </c:forEach> --%>
        </tbody>
    </table>
    </div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  </c:if>
  <script>
	$('.choose-cate').click(function() {
		$('#chose-cate').val($(this).data('category'));
	});

	$('#profile-tab').click(function(){
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'${pageContext.request.contextPath }/home/history',
			success: function(data){
				var table = "";
				for (var i = 0; i < data.length; i++) {
					table += '<tr class="active">'
						+ '<td>' + (i+1) + '</td>'
						+ '<td>' + data[i].destination + '</td>'
						+ '<td>' + data[i].price + '</td>'
						+ '<td>' + data[i].status + '</td>'
						+ '<td>' + data[i].createdDate + '</td>'
						+ '<td>'
						+	'<a href="${pageContext.request.contextPath }/invoice?orderCode=' + data[i].code + '">Details</a>'
						+ '</td>';
				}
				$('#history-table').html(table);
			}
		});
	});
	
	$('.trash').click(function(){
		var productId = $(this).data('id');
		var topItem = $('.cart-top-item[data-id=' + productId + ']');
		var cartItem = $('.cart-item[data-id=' + productId + ']');
		if (window.confirm("Are you sure?")) {
			$.ajax({
				type:'POST',
				contextType:'application/json',
				data:{productId:productId},
				dataType:'json',
				url:'${pageContext.request.contextPath }/cart/remove',
				success: function(data) {
					$('#order-total').text("$" + data.total);
					$('#cart-total-price').text("$" + data.total);
					$('#cart-size').text(data.size);
					if (data.size == 0) {
						$('#cart_list').html(
							 '<li style="text-align: center; height: auto;" class="cart_item clearfix" id="cart_item">'
							+	'Your cart is empty'
							+ '</li>'
						);
						$('#cart-ctnr').html(
							'<div class="order_total">'
							+ 	'<div class="order_total_content text-center">'
							+ 		'<div class="order_total_title">'
							+			'Your shopping cart has no any products'
							+ 		'</div>'
							+ 	'</div>'
							+ '</div>'
						);
					} else {
						topItem.remove();
						cartItem.remove();
					}
				}
			});
		}
	});
  </script>
</body>

</html>