<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/regular_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/regular_responsive.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/paymentplugins/css/style.css">



<div class="container">

	<div class="row">
		<div class="col-md-4 order-md-2 mb-4">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-muted">Your cart</span>
				<span class="badge badge-secondary badge-pill">${sessionScope.cartList.size() }</span>
			</h4>
			<ul class="list-group mb-3">
				
				<c:set var="totalPrice" value="0"></c:set>
				<c:forEach var="cart" items="${sessionScope.cartList }">
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">${cart.product.name }</h6>
							<small class="text-muted">Price: <fmt:formatNumber value="${cart.price }" type="currency" /></small><br>
							<small class="text-muted">Quantity: ${cart.quantity }</small>
						</div>
						<span class="text-muted"><fmt:formatNumber value="${cart.price * cart.quantity }" type="currency" /></span>
						<c:set var="totalPrice" value="${totalPrice + cart.price * cart.quantity }"></c:set>
					</li>
				</c:forEach>
				
				<c:if test="${sessionScope.account != null }">
				<li class="list-group-item d-flex justify-content-between">
					<span>Sub Total (USD)</span>
					<strong><fmt:formatNumber value="${totalPrice }" type="currency" /></strong>
				</li>
				<li class="list-group-item d-flex justify-content-between bg-light">
					<div class="text-success">
						<h6 class="my-0">Discount</h6>
						<small>Credit Point : <span id="sm-current-point">${sessionScope.account.creditPoint }</span> point</small>
						<br/>
						<small style="color: red;">Exchange : <span id="sm-exchange">0</span> point</small>
					</div>
					<span class="text-success" id="discount">0%</span>
				</li>
				</c:if>
				
				<li class="list-group-item d-flex justify-content-between">
					<span>Total (USD)</span>
					<strong id="totalPrice" ><fmt:formatNumber value="${totalPrice }" type="currency" /></strong>
				</li>
				
			</ul>
			
			<!-- Voucher Form -->
			<c:if test="${sessionScope.account != null }">
			<form class="card p-2">
				<label for="vouchers">Voucher : Exchange <span id="exchange">0</span> point</label>
				<select class="custom-select d-block w-100" id="vouchers" name="vouchers" required style="margin: 0px;">
					<option class="voucher-select" value="0" data-discount="0" data-point="0">Select</option>
					<c:forEach var="voucher" items="${voucherList }">
						<option class="voucher-select" value="${voucher.id }"
							data-discount="${voucher.price }" data-point="${voucher.point }">Discount
							${voucher.price }</option>
					</c:forEach>
				</select>
			</form>
			</c:if>
			
		</div>
		
		<!-- Paypal Form -->
		<c:if test="${paypalItemList != null }">
		<form id="paypal-form" method="post" action="${posturl }">
			<input type="hidden" name="upload" value="1" />
			<input type="hidden" name="return" value="${returnurl }" />
			<input type="hidden" name="cmd" value="_cart" />
			<input type="hidden" name="business" value="${business }" />
			<c:forEach var="paypalItem" items="${paypalItemList }" varStatus="i">
				<input type="hidden" name="item_name_${i.index + 1 }" value="${paypalItem.product.name }">
				<input type="hidden" name="amount_${i.index + 1 }" value='<fmt:formatNumber maxFractionDigits="0" type="number" value="${paypalItem.price }"/>'>
				<input type="hidden" name="quantity_${i.index + 1 }" value="${paypalItem.quantity }">
			</c:forEach>
		</form>
		</c:if>
		
		<div class="col-md-8 order-md-1">
		<c:if test="${ppmsg != null }">
			<div style="margin-top: 20px;" id="paypal-success" class="alert alert-success" role="alert">${ppmsg }</div>
		</c:if>
		<c:if test="${msg != null }">
			<div style="margin-top: 20px;" id="alert-success" class="alert alert-success" role="alert">${msg }</div>
		</c:if>
		<c:if test="${err != null }">
			<div style="margin-top: 20px;" class="alert alert-danger" role="alert">${err }</div>
		</c:if>
		<h4 style="padding: 20px 0px 10px;">Please enter your information :</h4>
			<div id="accordion">
				<div class="card">
					<!-- <div class="card-header">
						<a class="card-link font-weight-bold" data-toggle="collapse" href="#collapseOne">Pay At Home</a>
					</div> -->
					<div id="collapseOne" class="collapse show"
						data-parent="#accordion">
						<div class="card-body">
							<h4 class="mb-3">Billing address</h4>
							<sf:form modelAttribute="customer" method="POST" action="${pageContext.request.contextPath }/payment/index">
							<div class="mb-3">
								<label>Full Name</label>
								<div class="input-group">
									<sf:input path="name" id="customerName" cssClass="form-control" placeholder="Full Name" cssStyle="color: #495057;"/>
									<!-- <input type="text" class="form-control" id="phone" placeholder="Full Name" required> -->
									<div class="invalid-feedback" style="width: 100%; display: block;"><sf:errors path="name"></sf:errors></div>
								</div>
							</div>

							<div class="mb-3">
								<label>Phone</label>
								<div class="input-group">
								<sf:input path="phone" id="customerPhone" cssClass="form-control" placeholder="Phone" cssStyle="color: #495057;"/>
									<!-- <input type="text" class="form-control" id="phone" placeholder="Phone" required> -->
									<div class="invalid-feedback" style="width: 100%; display: block;"><sf:errors path="phone"></sf:errors></div>
								</div>
							</div>

							<div class="mb-3">
								<label>Email <span class="text-muted">(Optional)</span></label>
								<sf:input path="email" id="customerEmail" cssClass="form-control" placeholder="Email" cssStyle="color: #495057;"/>
								<!-- <input type="email" class="form-control" id="email" placeholder="you@example.com"> -->
								<div class="invalid-feedback" style="display: block;"><sf:errors path="email"></sf:errors></div>
							</div>

							<div class="mb-3">
								<label>Address</label>
								<!-- JS Edit 5-7-2020 -->
								<sf:input path="address" id="customerAddress" cssClass="form-control" placeholder="Address" cssStyle="color: #495057;"/>
								<!-- /JS Edit 5-7-2020 -->
								<!-- <input type="text" class="form-control" name="deliveryAddress" id="address" placeholder="Address" required> -->
								<div class="invalid-feedback" style="display: block;"><sf:errors path="address"></sf:errors></div>
							</div>
							<hr class="mb-4">
								<h4 class="mb-3">Payment Method</h4>
								<div class="d-block my-3">
									<div class="custom-control custom-radio">
										<input id="credit" name="paymentMethod" type="radio" value="Pay at home" class="custom-control-input" checked required>
										<label class="custom-control-label" for="credit">Pay at home</label>
									</div>
									<div class="custom-control custom-radio">
										<input id="paypal" name="paymentMethod" type="radio" value="Pay by paypal" class="custom-control-input" required>
										<label class="custom-control-label" for="paypal">Pay by paypal</label>
									</div>
								</div>
							
							<hr class="mb-4">
							<div class="custom-control custom-checkbox">
								<span>
									<input type="checkbox" name="deliveryType" value="true" id="type">
									<label>Express Delivery</label>
								</span>
								<c:if test="${sessionScope.account != null }">
								<span style="float: right;">
									<input type="checkbox" id="yourAddress">
									<label>Deliver to Your Address</label>
								</span>
								</c:if>
							</div>
							<div class="custom-control custom-checkbox">
								<hr class="mb-4">
								<button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
							</div>
							<input type="hidden" name="deliveryType" value="false" id="type">
							<input type="hidden" id="voucherId" name="voucherId" value="0">
							</sf:form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<hr>

<!-- Scroll to Top -->
	<a id="scroll-to-top" href="#" class="btn btn-primary btn-lg" role="button" title="Return to top of page" data-toggle="tooltip" data-placement="left">
		<i class="fa fa-arrow-up"></i>
	</a>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TimelineMax.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/animation.gsap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/regular_custom.js"></script>
<script>
$('#vouchers').change(function(){
	var voucherId = $(this).val();
	var discount = $(this).find(':selected').data('discount');
	var point = $(this).find(':selected').data('point');
	$('#exchange').text(point);
	$('#sm-exchange').text(point);
	$('#discount').text(discount + '%');
	$('#voucherId').val(voucherId);
	var totalPrice = "<c:out value='${totalPrice }' />";
	var temp = totalPrice - (totalPrice * discount / 100);
	$('#totalPrice').text('$' + parseFloat(temp).toFixed(2));
})
$(document).ready(function() {
	if ($('#alert-success').text() != "") {
		setTimeout(function() {successReload()}, 3000);
	}
	if ($('#paypal-success').text() != "") {
		setTimeout(function() {$('#paypal-form').submit()}, 3000);
	}
	$(document).on('click', '#yourAddress', function() {
		var customerName = $('#customerName');
		var customerPhone = $('#customerPhone');
		var customerEmail = $('#customerEmail');
		var customerAddress = $('#customerAddress');
		if ($(this).is(':checked')) {
			$.ajax({
				type:"GET",
				url: "${pageContext.request.contextPath }/payment/account-info",
				dataType: "json",
				success: function(accountInfo) {
					customerName.val(accountInfo.fullName);
					customerName.attr('readonly','true');
					customerPhone.val(accountInfo.phone);
					customerPhone.attr('readonly','true');
					customerEmail.val(accountInfo.email);
					customerEmail.attr('readonly','true');
					customerAddress.val(accountInfo.address);
				}
			});
		} else {
			customerName.removeAttr('readonly');
			customerPhone.removeAttr('readonly');
			customerEmail.removeAttr('readonly');
		}
	});
});
function successReload() {
	window.location.href="${pageContext.request.contextPath }/home";
}
</script>