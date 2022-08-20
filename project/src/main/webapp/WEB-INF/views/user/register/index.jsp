<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- Title Page-->
<title>Register Form</title>

<!-- Icons font CSS-->
<link
	href="${pageContext.request.contextPath }/resources/registerplugins/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath }/resources/registerplugins/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link
	href="${pageContext.request.contextPath }/resources/registerplugins/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${pageContext.request.contextPath }/resources/registerplugins/vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/registerplugins/css/main.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/css/main.css">
</head>

<body>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">Create Account</h2>
				</div>
				<hr>
				<div class="card-body">
				
					<c:if test="${msg != null }">
						<div id="alert-success" class="alert alert-success" role="alert">${msg }</div>
					</c:if>
					
					<sf:form method="post" modelAttribute="account" action="${pageContext.request.contextPath }/register/index">
						<div style="color:red;"><sf:errors path="username"></sf:errors></div>
						<div class="wrap-input100 validate-input">
							<sf:input path="username" cssClass="input100" placeholder="User Name"/>
								<span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-user"
								aria-hidden="true"></i>
							</span>
						</div>
						
						<div style="color:red;"><sf:errors path="password"></sf:errors></div>
						<div class="wrap-input100 validate-input"
							data-validate="Password is required">
							<sf:password path="password" cssClass="input100" placeholder="Password"/>
								<span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-unlock-alt"
								aria-hidden="true"></i>
							</span>
						</div>
						
						<div style="color:red;">${confirmerror }</div>
						<div class="wrap-input100 validate-input"
							data-validate="Confirm Password">
							<input class="input100" type="password" name="confirm"
								placeholder="Confirm Password"> <span
								class="focus-input100"></span> <span class="symbol-input100">
								<i class="fa fa-lock" aria-hidden="true"></i>
							</span>
						</div>
						
						<div style="color:red;"><sf:errors path="fullName"></sf:errors></div>
						<div class="wrap-input100 validate-input">
							<sf:input path="fullName" cssClass="input100" placeholder="Full Name"/>
							<span class="focus-input100"></span>
							<span class="symbol-input100"> <i
								class="fa fa-user-circle-o" aria-hidden="true"></i>
							</span>
						</div>
						
						<div style="color:red;"><sf:errors path="phone"></sf:errors></div>
						<div class="wrap-input100 validate-input">
							<sf:input path="phone" cssClass="input100" placeholder="Phone Number"/>
							<span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-phone"
								aria-hidden="true"></i>
							</span>
						</div>
						
						<div style="color:red;"><sf:errors path="email"></sf:errors></div>
						<div class="wrap-input100 validate-input">
							<sf:input path="email" cssClass="input100" placeholder="Email"/>
							<span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-envelope"
								aria-hidden="true"></i>
							</span>
						</div>
						
						
						<div style="color:red;"><sf:errors path="address"></sf:errors></div>
						<div class="wrap-input100 validate-input">
							<sf:input path="address" cssClass="input100" placeholder="Address"/>
							<span class="focus-input100"></span>
							<span class="symbol-input100"> <i class="fa fa-map-marker"
								aria-hidden="true"></i>
							</span>
						</div>
						
						<div class="container-login100-form-btn">
							<button type="submit" class="login100-form-btn">Register</button>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="${pageContext.request.contextPath }/resources/registerplugins/vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script
		src="${pageContext.request.contextPath }/resources/registerplugins/vendor/select2/select2.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/registerplugins/vendor/datepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/registerplugins/vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script
		src="${pageContext.request.contextPath }/resources/registerplugins/js/global.js"></script>
		
<!-- Nang Script -->
<script>
	$(document).ready(function() {
		if ($('#alert-success').text() != "") {
			setTimeout(function() {successReload()}, 3000);
		}
	});
	function successReload() {
		window.location.href="${pageContext.request.contextPath }/login";
	}
</script>

</body>

</html>