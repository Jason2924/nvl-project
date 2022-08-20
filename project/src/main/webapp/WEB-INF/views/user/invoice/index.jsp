<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Font Awesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/regular_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/regular_responsive.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/invoiceplugins/css/style.css">


<body>

		<div class="content-wrapper">

			<section class="content">
				<div class="container">
					<div class="row">
						<div class="col-12">
							
							<!-- start Add msg if order code not found -->
							<c:if test="${msg != null }">
							
								<div>${msg }</div>
							
							</c:if>
							<!-- end Add msg if order code not found -->
							<!-- start Add msg if order code not found -->
							<c:if test="${msg == null }">
							<c:forEach var="deliveryTemp" items="${order.deliveries }">
								<c:set var="delivery" value="${deliveryTemp }"></c:set>
							</c:forEach>
							<c:forEach var="paymentTemp" items="${order.payments }">
								<c:set var="payment" value="${paymentTemp }"></c:set>
							</c:forEach>
							<c:if test="${order.exchanges != null }">
							<c:forEach var="exchangesTemp" items="${order.exchanges }">
								<c:set var="saleoff" value="${exchangesTemp.voucher.price }"></c:set>
							</c:forEach>
							</c:if>
							<!-- Main content -->
							<div class="invoice p-3 mb-3">
								<!-- title row -->
								<div class="row">
									<div class="col-12">
										<h4>NVLTECH SHOP
											<small class="float-right">Order ID: #<span>${order.id }</span></small>
										</h4>
									</div>
									<!-- /.col -->
								</div>
								<!-- info row -->
								<div class="row invoice-info">
									<div class="col-sm-4 invoice-col">
										From
										<address>
											<strong>NVL Tech</strong>
											<br>440/30 Nguyen Kiem Street, Ward 3, Phu Nhuan District, Ho Chi Minh, Viet Nam
											<br> Phone: 098.778.2201 - (028).3880.3888
											<br> Email: NVLTeam@gmail.com
										</address>
									</div>
									<!-- /.col -->
									<div class="col-sm-4 invoice-col">
										To
										<address>
											<strong>${order.customerName }</strong>
											<br>${delivery.destination }
											<!-- <br>Ho Chi Minh, Viet Nam -->
											<br>Phone: ${order.customerPhone }
											<br>Email: ${order.customerEmail }
										</address>
									</div>
									
									
									<!-- /.col --
									<!-- <div class="col-sm-4 invoice-col">
									Date: 12/02/2019
										<b>Invoice #007612</b><br> <br> <b>Order ID:</b>
										4F3S8J<br> <b>Payment Due:</b> 2/22/2014<br> <b>Account:</b>
										968-34567
									</div> -->
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<!-- Table row -->
								<div class="row">
									<div class="col-12 table-responsive">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>No</th>
													<th>Product</th>
													<th>Quantity</th>
													<th>Price</th>
													<th>Subtotal</th>
													<!-- <th>Action</th> -->
												</tr>
											</thead>
											<tbody>
												<c:set var="totalPrice" value="0"></c:set>
												<c:set var="orderNumber" value="0"></c:set>
												<c:forEach var="orderDetail" items="${order.orderDetails }">
												<tr>
													<c:set var="orderNumber" value="${orderNumber + 1 }"></c:set>
													<td>${orderNumber }</td>
													<td>${orderDetail.product.name }</td>
													<td>${orderDetail.quantity }</td>
													<td><fmt:formatNumber value="${orderDetail.price }" type="currency"/></td>
													<td><fmt:formatNumber value="${orderDetail.price * orderDetail.quantity }" type="currency" /></td>
													<%-- <td>
														<a href="" class="txt-details" data-toggle="modal" data-product="${orderDetail.product.id }" data-target="#configModal" style="text-decoration: none;">
															Details
														</a>
													</td> --%>
													<c:set var="totalPrice" value="${totalPrice + orderDetail.price * orderDetail.quantity }"></c:set>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<!-- accepted payments column -->
									<div class="col-6">
										<p class="lead">Payment Methods:</p>
										<div class="table-responsive">
											<table class="table table-summary">
											<!-- JS Edit 5-7-2020 Delete startDate and endDate -->
												<tr>
													<th style="width: 50%">Method:</th>
													<td><span>${payment.method }</span></td>
												</tr>
												<tr>
													<th>Delivery:</th>
													<td><span>${delivery.type }</span></td>
												</tr>
												<tr>
													<th>Status:</th>
													<td><span>${order.status }</span></td>
												</tr>
											</table>
										</div>

										<p class="text-muted well well-sm shadow-none">
											Thanks You<br>
											<b>Notice:</b> Defective product warranty for 30 days. 1 change 1
										</p>
									</div>
									<!-- /.col -->
									<div class="col-6">
										<p class="lead">More Benefit Code</p>

										<div class="table-responsive">
											<table class="table">
												<tr>
													<th style="width: 50%">Subtotal:</th>
													<td><fmt:formatNumber value="${totalPrice }" type="currency" /></td>
												</tr>
												<tr>
												<!-- start Add Invoice calculation -->
													<th style="width: 50%">Voucher: <span>(-<fmt:formatNumber maxFractionDigits="0" value="${saleoff != null ? saleoff : 0 }" type="number" />%)</span></th>
													<td><fmt:formatNumber value="${saleoff != null ? (totalPrice * saleoff / 100) : 0 }" type="currency" /></td>
												</tr>
												<!-- end Add Invoice calculation -->
												<tr>
													<th>Total:</th>
													<td><fmt:formatNumber value="${payment.price }" type="currency" /></td>
												</tr>
											</table>
										</div>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<!-- this row will not appear when printing -->
								<!-- <div class="row no-print">
									<div class="col-12">
										<a href="invoice-print.html" target="_blank"
											class="btn btn-default"><i class="fas fa-print"></i>
											Print
										</a>
										<button type="button" class="btn btn-success float-right">
											<i class="far fa-credit-card"></i> Submit Payment
										</button>
										<button type="button" class="btn btn-primary float-right"
											style="margin-right: 5px;">
											<i class="fas fa-download"></i> Generate PDF
										</button>
									</div>
								</div> -->
							</div>
							</c:if>
							<!-- /.invoice -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

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

		<!-- Modal -->
	<div class="modal fade" id="configModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Details Configuration</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<table id="config-table" class="table table-borderless">
						
						<tr>
							<th>Brand:</th>
							<td>Apple</td>
						</tr>
						<tr>
							<th>Chipset:</th>
							<td>A13 Bionic</td>
						</tr>
						<tr>
							<th>Ram:</th>
							<td>4GB</td>
						</tr>
						
						<tr>
							<th>Rom:</th>
							<td>256GB</td>
						</tr>
						<tr>
							<th>Rom:</th>
							<td>256GB</td>
						</tr>
						<tr>
							<th>Display:</th>
							<td>Retina</td>
						</tr>
						<tr>
							<th>Resolution:</th>
							<td>1920 x 1080</td>
						</tr>
						<tr>
							<th>Operating System:</th>
							<td>IOS</td>
						</tr>
						<tr>
							<th>Pin:</th>
							<td>3200 mah</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	/* $('.txt-details').on('click',function() {
		var productId = $(this).data('product');
		$.ajax({
			type:'GET',
			contentType: "application/json",
			url: '${pageContext.request.contextPath }/invoice/productDetail',
			data: {productId : productId},
			dataType: 'json',
			async : false,
			cache : false,
			processData : false,
			success: function(config) {
				console.log(config);
			}
			
		});
	}); */
</script>