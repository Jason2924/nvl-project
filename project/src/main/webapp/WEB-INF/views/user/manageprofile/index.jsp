<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/profileplugins/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/loginplugins/fonts/font-awesome-4.7.0/css/font-awesome.min.css">


<body class="bgcolor">
	<div class="container chg-profile">
		<sf:form method="POST" modelAttribute="account" action="${pageContext.request.contextPath }/manageprofile/index">
			<div class="row">
				<div class="col-md-2">
					<%-- <div class="profile-img">
					<img src="${pageContext.request.contextPath }/resources/profileplugins/img/avatar.png"/>
					<div class="file btn btn-lg btn-primary">Change Photo<input type="file" name="file" /></div>
				</div> --%>
				</div>
				<div class="col-md-8">

					<div class="row row_mg">
						<div class="col-md-6">
							<h3>Edit Info</h3>
						</div>
						<!-- <div class="col-md-6">
					<input type="reset" class="btn btn-primary pull-right" value="Reset">
				</div> -->
					</div>
					<div class="wrap-input100 validate-input">
						<sf:input  path="username" cssClass="input100" readonly="true"/>
						<span class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
					
					<div style="color:red;"><sf:errors path="password"></sf:errors></div>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<sf:password path="password" cssClass="input100" placeholder="Password"/>
						<span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-unlock-alt"
							aria-hidden="true"></i>
						</span>
					</div>
					
					<div style="color:red;">${confirmerror }</div>
					<div class="wrap-input100 validate-input"
						data-validate="Confirm Password">
						<input class="input100" type="password" name="confirm" placeholder="Confirm Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
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
						<span class="symbol-input100"> 
							<i class="fa fa-map-marker" aria-hidden="true"></i>
						</span>
					</div>
					
					<sf:hidden path="id"/>
					
					<div class="form-group">
						<div class="row row-button">
							<div class="col-md-8">
								<a href="${pageContext.request.contextPath }/home/index">
									<input type="submit" class="btn btn-primary login100-form-btn" value="Save Changes">
								</a>
							</div>
							<div class="col-md-4">
								<a href="${pageContext.request.contextPath }/home/index">
									<input type="button" class="btn btn-default" value="Cancel">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</sf:form>
	</div>
</body>