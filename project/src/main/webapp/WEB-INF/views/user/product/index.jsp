<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/product_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/product_responsive.css">

	<!-- Single Product -->
	
	<% Date date = new Date(); %>
	<c:set var="today" value="<%=date %>"></c:set>
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

	<div class="single_product">
		<div class="container">
			<div class="row">
				<!-- Images -->
				<div class="col-lg-2 order-lg-1 order-1">
					<ul class="image_list">
					<!-- start: Change resources/userplugin... to /resources/upload/images/products/ -->
						<%-- <li data-image="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }">
						<img class="sml-img" src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }" alt="">
						</li> --%>
						<c:forEach var="photo" items="${product.photos }">
						<li data-image="${pageContext.request.contextPath }/resources/upload/images/products/${photo.photo }">
						<img style="height: 100%;" class="sml-img" src="${pageContext.request.contextPath }/resources/upload/images/products/${photo.photo }" alt="">
						</li>
						</c:forEach>
					<!-- end: Change resources/userplugin... to /resources/upload/images/products/ -->
					</ul>
				</div>

				<!-- Selected Image -->
				<div class="col-lg-5 order-lg-2 order-2">
					<div class="image_selected">
					<!-- start: Change resources/userplugin... to /resources/upload/images/products/ -->
						<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${product.photo }" alt="">
					<!-- end: Change resources/userplugin... to /resources/upload/images/products/ -->
					</div>
						
							<%-- <div class="text-des font-weight-bold">
								<h4>DESCRIPTION:</h4>
							</div>
							<div class="text-des">
								${product.description }
							</div> --%>
						
					</div>

				<!-- Description -->
				<div class="col-lg-5 order-3">
					<div class="product_description">
						<div class="product_category">${product.brand.name }</div>
						<div class="product_name">${product.name }</div>
						<div>Rate : ${product.rate } <span class="fas fa-star" style="color: #547ef89e; "></span></div>
						<div class="order_info d-flex flex-row">
							<form action="${pageContext.request.contextPath }/cart/create" method="get">
								<c:if test="${productPrice > 0 && product.quantity > 0 }">
								<div class="clearfix" style="z-index: 1000;">
									<!-- Product Quantity -->
									<div class="product_quantity clearfix">
										<span>Quantity: </span>
										<input id="quantity_input" type="text" pattern="[0-9]*" value="1" min="1" name="quantity">
										<div class="quantity_buttons">
											<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fas fa-chevron-up"></i></div>
											<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fas fa-chevron-down"></i></div>
										</div>
									</div>
								</div>
								</c:if>
							<c:choose>
								<c:when test="${productPrice <= 0 }">
									<div class="product_price">Updating</div>
								</c:when>
								<c:when test="${product.quantity <= 0 }">
									<div class="product_price">Sold out</div>
								</c:when>
								<c:when test="${discount > 0 && productPrice > 0 }">
									<div class="product_price">
										<fmt:formatNumber value="${productPrice - (productPrice * discount / 100) }" type="currency" />
										<span style="color: #04040450;">
											<del>
												<small>
													<fmt:formatNumber value="${productPrice}" type="currency" />
												</small>
											</del>
										</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="product_price">
										<fmt:formatNumber value="${productPrice}" type="currency" />
									</div>
								</c:otherwise>
							</c:choose>
							<!-- <div class="product_price">$${productPrice }</div> -->
								<c:if test="${productPrice > 0 && product.quantity > 0 }">
								<div class="button_container">
									<a href="javascript:;">
										<button type="submit" class="button cart_button">Add to Cart</button>
									</a>
									<div class="product_fav"><i class="fas fa-heart"></i></div>
								</div>
								</c:if>
								<input type="hidden" name="id" value="${product.id }">
							</form>
						</div>
					</div>
				</div>

			</div>
		<div class="row">
			<div class="col-lg-7 order-lg-1 order-1">
				<div class="text-des font-weight-bold">
					<h4>DESCRIPTION:</h4>
				</div>
				<div class="text-des">
					<img id="lrg-img" src="">
					${product.description }
				</div>
			</div>
			<div class="col-lg-5 order-2">
				<div class="product_text">
					<div class="text-des font-weight-bold">
						<h4>CONFIGURATION</h4>
					</div>
					<c:if test="${product.category.id == 1 }">
						<table class="table table-striped">
							<tbody>
								<c:forEach var="key" items="${config.keySet() }">
									<tr>
										<td>${key }</td>
										<td>${config.get(key) }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${product.category.id != 1 }">
						<div>${product.configuration }</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	
	<hr>

<!-- Comment box -->


<div class="user-comment">
		<div class="viewed_title"><h4><b>REVIEWS AND COMMENT:</b></h4></div>
	<div class="comments-section">
		<c:forEach var="commend" items="${commendList }">
			<c:set var="commentClass" value="comment-post"></c:set>
			<c:if test="${commend.account.role == 'ROLE_ADMIN' }">
				<c:set var="commentClass" value="comment-post-reply"></c:set>
			</c:if>
			<div class="${commentClass }">
			<%-- <div class="comment-img">
				<img src="${pageContext.request.contextPath }/resources/profileplugins/img/avatar.png"/>
			</div> --%>
			<div class="comment-details">
				<p>
					<span class="comment-author">${commend.account.role == 'ROLE_MEMBER' ? commend.account.username : 'Admin' }</span>
					<span class="comment-time">
						<fmt:formatDate type="both" dateStyle = "short" timeStyle = "short" value="${commend.createdDate }"/>
					</span>
				</p>
				<c:if test="${commend.rate != null && commend.rate > 0}">
					<div class="comment-like-unlike">
						<span>Rating : ${commend.rate } <i class="fas fa-star"></i></span>
					<!-- <span><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></span>
					<span><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></span>
					<span><i class="fa fa-reply" aria-hidden="true"></i></span> -->
					</div>
				</c:if>
				<p class="comment-content">${commend.content }</p>
			</div>
		</div>
		</c:forEach>
		<div id="response-value"></div>
		<c:if test="${sessionScope.account == null }">
			<div>Please <a href="${pageContext.request.contextPath }/login">Sign in</a> to leave your comment and rate!</div>
		</c:if>
		<c:if test="${sessionScope.account != null }">
				<div class="comment-add">
					<div style="padding: 10px 0px 10px 10px; ">
						<div style="display:inline-block;">Rating : </div>
						<div class="comment-like-unlike" style="display:inline-block;">
							<span class="stars" data-rating="1"><i style="margin:0px; width: unset;" class="far fa-star"></i></span>
							<span class="stars" data-rating="2"><i style="margin:0px; width: unset;" class="far fa-star"></i></span>
							<span class="stars" data-rating="3"><i style="margin:0px; width: unset;" class="far fa-star"></i></span>
							<span class="stars" data-rating="4"><i style="margin:0px; width: unset;" class="far fa-star"></i></span>
							<span class="stars" data-rating="5"><i style="margin:0px; width: unset;" class="far fa-star"></i></span>
						</div>
					</div>
					<div class="field-comment">
						<textarea id="comment-content" rows="4" cols="50" name="content" required="required"></textarea>
						<button id="comment-button" type="button" class="button cart_button float-right">POST</button>
					</div>
				</div>
				<input id="star-rating" type="hidden" name="rating" value="0">
				<input id="comment-id" type="hidden" name="id" value="${product.id }">
		</c:if>
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
	
	

	<!-- Newsletter -->

	<!-- Scroll to Top -->
	<a id="scroll-to-top" href="#" class="btn btn-primary btn-lg" role="button" title="Return to top of page" data-toggle="tooltip" data-placement="left"><i class="fa fa-arrow-up"></i></a>

<script src="${pageContext.request.contextPath }/resources/userplugins/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/product_custom.js"></script>

<!-- Nang script -->
<script>
$('.stars').click(function() {
	var stars = $('.stars > i');
  	var rating = $(this).data('rating');
  	$('#star-rating').val(rating);
  	for (var i = 0; i < stars.length; i++) {
		if (i < rating) {
			stars[i].classList.replace("far", "fas");
		} else {
			stars[i].classList.replace("fas", "far");
		}
   	}
});
$('#comment-button').click(function() {
	var starsIcon = $('.stars > i');
	var stars = $('#star-rating').val();
	var productId = $('#comment-id').val();
	var content = $('#comment-content').val();
	if (content != "") {
		$.ajax({
			type: 'POST',
			contextType: 'application/json',
			data: {stars: stars, productId: productId, content: content},
			dataType: 'json',
			url: '${pageContext.request.contextPath }/product/commend',
			success: function(data) {
				if (data.success == true) {
					$('#response-value').html('<div style="padding: 20px;" id="alert-success" class="alert alert-success" role="alert">' + data.msg + '</div>');
					setTimeout(function(){ clearField() }, 5000);
				} else {
					$('#response-value').html('<div style="padding: 20px;" id="alert-success" class="alert alert-danger" role="alert">' + data.msg + '</div>');
					setTimeout(function(){ clearField() }, 5000);
				}
				$('#star-rating').val("0");
				$('#comment-content').val("");
				for (var i = 0; i < starsIcon.length; i++) {
					starsIcon[i].classList.replace("fas", "far");
			   	}
			}
		});
	} else {
		$('#response-value').html(
				'<div style="padding: 20px;" id="alert-success" class="alert alert-danger" role="alert">'
				+ 'Please leave your comment'
				+ '</div>'
				);
	}
});
function clearField() {
	$('#response-value').html("");
}
</script>
