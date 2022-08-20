<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="mt" uri="http://customtag.com"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/summernote/summernote-bs4.css">


<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/dist/css/style.css">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"> <i class="fas fa-bars"></i>
				</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					class="nav-link" href="http://localhost:9596">MY SHOP</a></li>
			</ul>

			<!-- @NANG Fix start -->
			
			<mt:adminbell/>
			
			<!-- NANG Fix end -->

			<!-- Right navbar -->
			<ul class="navbar-nav ml-auto">
				<!-- <li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#">Controls</a></li> -->
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/login/admin/logout">LOG
						OUT</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<i class="far fa-user" style="color: #fff; margin-top: 7px;"></i>
					</div>
					<div class="info">
						<span data-toggle="modal" data-target="#myModal">
							<a href="#" class="d-block" data-toggle="tooltip"
								data-placement="right" data-username="${sessionScope.username }"
								id="editAccount" title="Edit Profile!">${sessionScope.username }</a>
						</span>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">

						<li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/dashboard/index"
							class="nav-link"> DashBoard </a></li>

						<li class="nav-item has-treeview"><a href="#"
							class="text-font nav-link"> Products <i
								class="right fas fa-angle-left"></i>

						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admin/product/phone"
									class="nav-link"> Phones </a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admin/product/accessory"
									class="nav-link"> Accessories </a></li>

							</ul></li>

						<li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/order/index"
							class="nav-link"> Orders</a></li>

						<li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/delivery/index"
							class="nav-link"> Deliveries</a></li>

						<%-- <li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/category/index"
							class="nav-link"> Categories </a></li> --%>

						<li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/brand/index"
							class="nav-link"> Brands </a></li>

						<li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/account/index"
							class="nav-link"> Members </a></li>

						<li class="nav-item has-treeview"><a href="#"
							class="text-font nav-link"> Discounts <i
								class="right fas fa-angle-left"></i>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admin/promotion"
									class="nav-link"> Promotions </a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admin/voucher"
									class="nav-link"> Vouchers </a></li>
							</ul></li>

						<li class="text-font nav-item"><a
							href="${pageContext.request.contextPath }/admin/commend/index"
							class="nav-link"> Comment Box </a></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content ============================================================================================-->
		<div class="content-wrapper">

			<tiles:insertAttribute name="content"></tiles:insertAttribute>

		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>NVL Team</strong>

		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>


	<!--JS -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/javascript.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>


	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Edit Profile Admin</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form:form action="${pageContext.request.contextPath }/login/admin/update"
						method="post" modelAttribute="account">
						<div class="form-group row">
							<div class="col-6">
								<label>Full Name:</label>
								<form:input type="text" class="form-control" path="fullName" 
									id="accountFullName" placeholder="Enter Full Name" />
							</div>
							<div class="col-6">
								<label>Phone:</label>
								<form:input type="text" class="form-control" path="phone"
									id="accountPhone" placeholder="Enter Phone Number" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-6">
								<label>Email:</label>
								<form:input type="text" class="form-control" path="email"
									id="accountEmail" placeholder="Enter Email" />
							</div>
							<div class="col-6">
								<label>Address:</label>
								<form:input type="text" class="form-control" path="address"
									id="accountAddress" placeholder="Enter Address" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-6">
								<label>Password:</label>
								<form:input type="password" class="form-control"
									path="password" placeholder="Enter Password" />
							</div>
							<div class="col-6">
								<label>Re-Password:</label>
								<form:input type="password" class="form-control"
									path="password" placeholder="Confirm Password" />
							</div>
						</div>
						<form:input type="hidden" path="id" id="accountId" value="${accountId }"/>
						<button type="submit" class="btn btn-primary float-right">Submit</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	

<!-- @NANG Fix start -->

<mt:adminbellmodal/>

<!-- @NANG Fix end -->
</body>

<script type="text/javascript">
	$(document).ready(function() {
		//edit admin info
		$(document).on('click', '#editAccount', function() {
			$.getJSON(
					'${pageContext.request.contextPath}/login/admin/update',
					{
						username: $(this).attr('data-username')
					},
					function(data){
						loadEditTables(data);
					}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
		// load edit tables
		function loadEditTables(account){
			// fill account info
			$('#accountId').val(account.id);
			$('#accountFullName').val(account.fullName);
			$('#accountPhone').val(account.phone);
			$('#accountEmail').val(account.email);
			$('#accountAddress').val(account.address);
		}

	})
</script>
</html>
