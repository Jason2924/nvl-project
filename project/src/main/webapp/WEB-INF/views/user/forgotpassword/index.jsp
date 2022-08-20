<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath }/resources/registerplugins/css/main.css" rel="stylesheet" media="all">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/loginplugins/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/loginplugins/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<body>
<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">FORGOT PASSWORD?</h2>
                </div>
                <hr>
                <div class="card-body">
                <h4><b>Please enter your info to get password</b></h4>
                
                	<c:if test="${msg != null }">
						<div id="alert-success" class="alert alert-success" role="alert">${msg }</div>
					</c:if>
					<c:if test="${err != null }">
						<div class="alert alert-danger" role="alert">${err }</div>
					</c:if>
                	
                    <form method="POST" action="${pageContext.request.contextPath }/forgotpassword/index">
                    	
                    	<div style="color:red;">${usernameerror }</div>
                        <div class="wrap-input100 validate-input">
							<input class="input100" type="text" name="username" placeholder="Username">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-user" aria-hidden="true"></i>
							</span>
						</div>
						
                        <!-- <div class="wrap-input100 validate-input">
							<input class="input100" type="email" name="Email" placeholder="Email"> <span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span>		
						</div>
						
						<div class="wrap-input100 validate-input">
							<input class="input100" type="number" name="Phone-number" placeholder="Phone Number"> <span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-phone" aria-hidden="true"></i>
							</span>
						</div> -->
						
                        <div class="container-login100-form-btn">
							<button type="submit" class="login100-form-btn ">
								GET PASSWORD
							</button>
						</div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath }/resources/registerplugins/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/loginplugins/js/main.js"></script>
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