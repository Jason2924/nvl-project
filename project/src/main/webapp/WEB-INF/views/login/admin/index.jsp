<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath }/resources/loginplugins/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/css/main.css">
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
			<div class="login100-pic js-tilt" data-tilt>
					<img src="${pageContext.request.contextPath }/resources/loginplugins/images/img-01.png" alt="IMG">
				</div>
				<form method="POST"
					action="${pageContext.request.contextPath }/login/admin/login"
					class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32"> Account Login </span> <span
						class="txt1 p-b-11"> Username </span>
					<div class="wrap-input100 validate-input m-b-36"
						data-validate="Username is required">
						<input class="input100" type="text" name="username"> <span
							class="focus-input100"></span>
					</div>

					<span class="txt1 p-b-11"> Password </span>
					<div class="wrap-input100 validate-input m-b-12"
						data-validate="Password is required">
						<span class="btn-show-pass"> <i class="fa fa-eye"></i>
						</span> <input class="input100" type="password" name="password">
						<span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full">
						<div>
							<a data-target="#Modal-1" data-toggle="modal" href="#Modal-1"
								class="txt3" id="forgotPassword"> Forgot Password? </a>
						</div>
					</div>
					<span id="message" style="color: red">${message }</span>
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="Login">
					</div>

				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>

	<!-- The Modal -->
	<div class="modal fade" id="Modal-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Reset Password</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form method="post"
						action="${pageContext.request.contextPath }/login/admin/resetPassword">
						<div class="form-group row">
							<label>Username or Email:</label> <input type="text"
								name="keyword" class="form-control"
								placeholder="Enter Username or Email" /> <span>New
								password will be sent automatically to your registered email.</span>
						</div>
						<button type="submit" class="btn btn-primary float-right">Reset</button>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/animsition/js/animsition.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/select2/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/vendor/countdowntime/countdowntime.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/loginplugins/js/main.js"></script>

</body>

</html>