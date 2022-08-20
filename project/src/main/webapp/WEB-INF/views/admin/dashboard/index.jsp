<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${pageContxt.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="${pageContxt.request.contextPath }/resources/http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContxt.request.contextPath }/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="${pageContxt.request.contextPath }/resources/https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">

		<!-- /.row -->
		<div class="row mb-2">
			<div class="col-sm-12">
				<h1 class="m-0 text-dark">Dashboard</h1>
			</div>
			<!-- /.col -->
			<%-- <div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="${pageContxt.request.contextPath }/resources/#">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</div> --%>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-info">
					<div class="inner">
						<h3>${totalOrder }</h3>

						<p>Total Orders</p>
					</div>
					<div class="icon">
						<i class="ion ion-bag"></i>
					</div>
					<a href="${pageContxt.request.contextPath }/admin/order"
						class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-success">
					<div class="inner">
						<h3>
							53<sup style="font-size: 20px">%</sup>
						</h3>

						<p>Total Income</p>
					</div>
					<div class="icon">
						<i class="ion ion-stats-bars"></i>
					</div>
					<a href="${pageContxt.request.contextPath }/admin/order"
						class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>

			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-warning">
					<div class="inner">
						<h3>${totalAccount }</h3>

						<p>Active Members</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="${pageContxt.request.contextPath }/admin/account"
						class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-danger">
					<div class="inner">
						<h3>${totalProduct }</h3>

						<p>Products Available</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<a href="${pageContxt.request.contextPath }/admin/product/phone"
						class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>

	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header border-0">
						<div class="d-flex justify-content-between">
							<h3 class="card-title">Orders</h3>
							<a href="${pageContxt.request.contextPath }/admin/order">View Details</a>
						</div>
					</div>
					<div class="card-body">
						<div class="d-flex">
							<p class="d-flex flex-column">
								<span class="text-bold text-lg">${ordersPresent }</span> 
								<span>Orders this month</span>
							</p>
							<p class="ml-auto d-flex flex-column text-right">
								<c:choose>
									<c:when test="${orderRate > 0 }">
										<span class="text-success mr-1"> <i class="fas fa-arrow-up"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${orderRate }"/>%
										</span> 
									</c:when>
									<c:when test="${orderRate < 0 }">
										<span class="text-danger mr-1"> <i class="fas fa-arrow-down"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${orderRate }"/>%
										</span>
									</c:when>
								</c:choose>
								<span class="text-muted">Since last month</span>
							</p>
						</div>
						<!-- /.d-flex -->

						<!-- <div class="position-relative mb-4">
							<canvas id="visitors-chart" height="200"></canvas>
						</div>

						<div class="d-flex flex-row justify-content-end">
							<span class="mr-2"> <i class="fas fa-square text-primary"></i>
								This Week
							</span> <span> <i class="fas fa-square text-gray"></i> Last Week
							</span>
						</div> -->
					</div>
				</div>
				<!-- /.card -->

				<div class="card">
					<div class="card-header border-0">
						<h3 class="card-title">Products</h3>
						<%-- <div class="card-tools">
							<a href="${pageContxt.request.contextPath }/resources/#" class="btn btn-tool btn-sm"> <i
								class="fas fa-download"></i>
							</a> <a href="${pageContxt.request.contextPath }/resources/#" class="btn btn-tool btn-sm"> <i
								class="fas fa-bars"></i>
							</a>
						</div> --%>
					</div>
					<div class="card-body table-responsive p-0">
						<table class="table table-striped table-valign-middle">
							<thead>
								<tr>
									<th>Product</th>
									<th>Price</th>
									<th style="width: auto">Fluctuation Rate</th>
								</tr>
							</thead>
							<tbody>
							<!-- maxIncreaseProduct -->
								<tr>
									<td><img
										src="${pageContext.request.contextPath }/resources/upload/images/products/${maxIncreaseProduct.photo }"
										alt="${maxIncreaseProduct.photo }" class="img-size-32 mr-2">${maxIncreaseProduct.name }
									</td>
									<td><c:forEach var="price" items="${maxIncreaseProduct.prices }">
										<c:if test="${price.status==true }">
											$${price.price }
										</c:if>
									</c:forEach></td>
									<td>
										<span class="text-success mr-1"> <i class="fas fa-arrow-up"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${maxIncreaseRate }"/>%
										</span> 
									</td>
								</tr>
							<!-- minIncreaseProduct -->
								<tr>
									<td><img
										src="${pageContext.request.contextPath }/resources/upload/images/products/${minIncreaseProduct.photo }"
										alt="${minIncreaseProduct.photo }" class="img-size-32 mr-2">${minIncreaseProduct.name }
									</td>
									<td><c:forEach var="price" items="${minIncreaseProduct.prices }">
										<c:if test="${price.status==true }">
											$${price.price }
										</c:if>
									</c:forEach></td>
									<td>
										<span class="text-success mr-1"> <i class="fas fa-arrow-up"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${minIncreaseRate }"/>%
										</span> 
									</td>
								</tr>
							<!-- minDescreaseProduct -->
								<tr>
									<td><img
										src="${pageContext.request.contextPath }/resources/upload/images/products/${minDescreaseProduct.photo }"
										alt="${minDescreaseProduct.photo }" class="img-size-32 mr-2">${minDescreaseProduct.name }
									</td>
									<td><c:forEach var="price" items="${minDescreaseProduct.prices }">
										<c:if test="${price.status==true }">
											$${price.price }
										</c:if>
									</c:forEach></td>
									<td>
										<span class="text-danger mr-1"> <i class="fas fa-arrow-down"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${minDescreaseRate }"/>%
										</span> 
									</td>
								</tr>
							<!-- maxDescreaseProduct -->
								<tr>
									<td><img
										src="${pageContext.request.contextPath }/resources/upload/images/products/${maxDescreaseProduct.photo }"
										alt="${maxDescreaseProduct.photo }" class="img-size-32 mr-2">${maxDescreaseProduct.name }
									</td>
									<td><c:forEach var="price" items="${maxDescreaseProduct.prices }">
										<c:if test="${price.status==true }">
											$${price.price }
										</c:if>
									</c:forEach></td>
									<td>
										<span class="text-danger mr-1"> <i class="fas fa-arrow-down"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${maxDescreaseRate }"/>%
										</span> 
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col-md-6 -->
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header border-0">
						<div class="d-flex justify-content-between">
							<h3 class="card-title">Sales</h3>
							<a href="${pageContxt.request.contextPath }/admin/promotion">View Details</a>
						</div>
					</div>
					<div class="card-body">
						<div class="d-flex">
							<p class="d-flex flex-column">
								<span class="text-bold text-lg">
									$<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${promotionTotalPrice }"/>
								</span>
								<span>Sales Over Time</span>
							</p>
							<p class="ml-auto d-flex flex-column text-right">
								<c:choose>
									<c:when test="${promotionPriceRate > 0 }">
										<span class="text-success mr-1"> <i class="fas fa-arrow-up"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${promotionPriceRate }"/>%
										</span> 
									</c:when>
									<c:when test="${promotionPriceRate <= 0 }">
										<span class="text-danger mr-1"> <i class="fas fa-arrow-down"></i>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${promotionPriceRate }"/>%
										</span>
									</c:when>
								</c:choose>
								<span class="text-muted">Since last month</span>
							</p>
						</div>
						<!-- /.d-flex -->

						<!-- <div class="position-relative mb-4">
							<canvas id="sales-chart" height="200"></canvas>
						</div>

						<div class="d-flex flex-row justify-content-end">
							<span class="mr-2"> <i class="fas fa-square text-primary"></i>
								This year
							</span> <span> <i class="fas fa-square text-gray"></i> Last year
							</span>
						</div> -->
					</div>
				</div>
				<!-- /.card -->

				<div class="card">
					<div class="card-header border-0">
						<h3 class="card-title">Tops list</h3>
						<%-- <div class="card-tools">
							<a href="${pageContxt.request.contextPath }/resources/#" class="btn btn-sm btn-tool"> <i
								class="fas fa-download"></i>
							</a> <a href="${pageContxt.request.contextPath }/resources/#" class="btn btn-sm btn-tool"> <i
								class="fas fa-bars"></i>
							</a>
						</div> --%>
					</div>
					<div class="card-body">
						<div class="d-flex justify-content-between align-items-center border-bottom mb-3 row">
							<div class=" col-4">
								<p class="text-success">
									Best-Selling Product:
								</p>
							</div>
							<div class=" col-4">
								<p class="text-success">
									<img
										src="${pageContext.request.contextPath }/resources/upload/images/products/${bestProduct.photo }"
										alt="${bestProduct.photo }" class="img-size-32 mr-2">${bestProduct.name }
								</p>
							</div>
							<div class=" col-4">
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> 
										${bestProductQuantity } orders
									</span>
								</p>
							</div>
						</div>
						<!-- /.d-flex -->
						<div class="d-flex justify-content-between align-items-center border-bottom mb-3 row">
							<div class=" col-4">
								<p class="text-success">
									Best-Selling Brand:
								</p>
							</div>
							<div class=" col-4">
								<p class="text-success">
									${bestBrand.name }
								</p>
							</div>
							<div class=" col-4">
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> 
										$<fmt:formatNumber type="number" maxFractionDigits="3" value="${bestBrandTotalPrice }"/>
									</span>
								</p>
							</div>
						</div>
						<!-- /.d-flex -->
						<div class="d-flex justify-content-between align-items-center border-bottom mb-3 row">
							<div class=" col-4">
								<p class="text-success">
									Best-Purchasing Member:
								</p>
							</div>
							<div class=" col-4">
								<p class="text-success">
									${bestBuyer.username }
								</p>
							</div>
							<div class=" col-4">
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> 
										$<fmt:formatNumber type="number" maxFractionDigits="3" value="${bestPriceBuyer }"/>
									</span>
								</p>
							</div>
						</div>
						<!-- /.d-flex -->
						<div class="d-flex justify-content-between align-items-center border-bottom mb-3 row">
							<div class=" col-4">
								<p class="text-success">
									Most-Voucher Member:
								</p>
							</div>
							<div class=" col-4">
								<p class="text-success">
									${bestVoucher.username }
								</p>
							</div>
							<div class=" col-4">
								<p class="d-flex flex-column text-right">
									<span class="font-weight-bold"> 
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${bestTotalVoucher }"/> points
									</span>
								</p>
							</div>
						</div>
						<!-- /.d-flex -->
					</div>
				</div>
			</div>
			<!-- /.col-md-6 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- /.content -->


<!-- jQuery -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script
	src="${pageContext.request.contextPath }/resources/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/chart.js/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/dist/js/pages/dashboard3.js"></script>