<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/cart_responsive.css">

<!-- Cart -->

<div class="cart_section">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div id="cart-ctnr" class="cart_container">
					<div class="cart_title">Shopping Cart</div>
					<c:if test="${sessionScope.cartList == null || empty sessionScope.cartList == true}">
						<div class="order_total">
							<div class="order_total_content text-center">
								<div class="order_total_title">
									Your shopping cart has no any products
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.cartList != null && empty sessionScope.cartList == false}">
					<div class="cart_items">
						<ul class="cart_list">
							<c:set var="totalPrice" value="0"></c:set>
							<c:forEach var="cart" items="${sessionScope.cartList }">
								<li class="cart_item clearfix cart-item" data-id="${cart.product.id }">
									<div class="cart_item_image">
										<img style="height: 100%;" src="${pageContext.request.contextPath }/resources/upload/images/products/${cart.product.photo }" alt="">
									</div>
									<div
										class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
										<div class="cart_item_name cart_info_col">
											<div class="cart_item_title">Name</div>
											<div class="cart_item_text">${cart.product.name }</div>
										</div>
										<div class="cart_item_quantity cart_info_col">
											<div class="cart_item_title">Quantity</div>
											<div class="cart_item_text">
												<input type="number" name="${cart.product.id }" class="n-cart-qty" value="${cart.quantity }" min="1" max="100" step="1"/>
											</div>
										</div>
										<div class="cart_item_price cart_info_col">
											<div class="cart_item_title">Price</div>
											<div class="cart-pri cart_item_text"><fmt:formatNumber value="${cart.price}" type="currency" /></div>
										</div>
										<div class="cart_item_total cart_info_col">
											<div class="cart_item_title">Total</div>
											<div class="cart-subtotal cart_item_text"><fmt:formatNumber value="${cart.price * cart.quantity }" type="currency" /></div>
										</div>
										<div class="cart_item_total cart_info_col">
											<%-- <form action="${pageContext.request.contextPath }/cart/remove" method="get"> --%>
												<button class="cart-trash trash tooltip" data-id="${cart.product.id }" style="outline:none;">
													<span class="lid"></span>
													<span class="can"></span>
													<span class="tooltiptext">Delete</span>
												</button>
												<%-- <input type="hidden" name="id" value="${cart.product.id }"> --%>
											<!-- </form> -->
										</div>
									</div>
									<c:set var="totalPrice" value="${totalPrice + cart.price * cart.quantity }"></c:set>
								</li>
							</c:forEach>
						</ul>
					</div>

					<!-- Order Total -->
					<div class="order_total">
						<div class="order_total_content text-md-right">
							<div class="order_total_title">Order Total:</div>
							<div id="order-total" class="order_total_amount"><fmt:formatNumber value="${totalPrice }" type="currency" /></div>
						</div>
					</div>

					<div class="cart_buttons">
						<a href="${pageContext.request.contextPath }/payment/index">
							<button type="button" class="button cart_button_checkout">Buy Now</button>
						</a>
					</div>
					</c:if>
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
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/cart_custom.js"></script>

<!-- Nang Script -->
<script>
$(document).ready(function(){
	
	$('.n-cart-qty').change(function() {
		var productId = $(this).attr('name');
		var cartQuantity = $(this).val();
		var element = $(this).parents('.cart_item_info').find('.cart-subtotal');
		var cartButtonQantity = $('.cart-quantity[data-id=' + productId + ']');
		cartButtonQantity.text(cartQuantity);
		$.ajax({
			type:'POST',
			contextType:'application/json',
			data:{productId:productId, cartQuantity:cartQuantity},
			dataType:'json',
			url:'${pageContext.request.contextPath }/cart/update',
			success: function(data) {
				element.text("$" + data.subtotal);
				$('#order-total').text("$" + data.total);
				$('#cart-total-price').text("$" + data.total);
			}
		});
	});


});
</script>