<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/contact_responsive.css">

	<!-- Contact Info -->

	<div class="contact_info">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact_info_container d-flex flex-lg-row flex-column justify-content-between align-items-between">

						<!-- Contact Item -->
						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/contact_1.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Phone</div>
								<div class="contact_info_text">098.778.2201 - (028).3880.3888</div>
							</div>
						</div>

						<!-- Contact Item -->
						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/contact_2.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Email</div>
								<div class="contact_info_text">nvlteam123@gmail.com</div>
							</div>
						</div>

						<!-- Contact Item -->
						<div class="contact_info_item d-flex flex-row align-items-center justify-content-start">
							<div class="contact_info_image"><img src="${pageContext.request.contextPath }/resources/userplugins/images/contact_3.png" alt=""></div>
							<div class="contact_info_content">
								<div class="contact_info_title">Address</div>
								<div class="contact_info_text">440/30 Nguyen Kiem, HCM, VN</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact Form -->

	<div class="contact_form">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="contact_form_container">
						<div class="contact_form_title">Get in Touch</div>
						<c:if test="${msg != null }">
							<div id="alert-success" class="alert alert-success" role="alert">${msg }</div>
						</c:if>
						<sf:form modelAttribute="contact" action="${pageContext.request.contextPath }/contact" id="contact_form" method="POST">
							<div class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<sf:input path="name" cssClass="contact_form_name input_field" placeholder="Your name" required="required" data-error="Name is required."/>
								<sf:input path="email" cssClass="contact_form_email input_field" placeholder="Your email" required="required" data-error="Email is required."/>
								<sf:input path="phone" cssClass="contact_form_phone input_field" placeholder="Your phone" required="required" data-error="Phone is required."/>
								<!-- <input type="text" id="contact_form_name" class="contact_form_name input_field" placeholder="Your name" required="required" data-error="Name is required.">
								<input type="text" id="contact_form_email" class="contact_form_email input_field" placeholder="Your email" required="required" data-error="Email is required.">
								<input type="text" id="contact_form_phone" class="contact_form_phone input_field" placeholder="Your phone number"> -->
							</div>
							<div class="contact_form_text">
								<sf:textarea path="content" class="text_field contact_form_message" rows="4" placeholder="Message" required="required" data-error="Please, write us a message."/>
								<!-- <textarea id="contact_form_message" class="text_field contact_form_message" name="message" rows="4" placeholder="Message" required="required" data-error="Please, write us a message."></textarea> -->
							</div>
							<div class="contact_form_button">
								<button type="submit" class="button contact_submit_button">Send Message</button>
							</div>
						</sf:form>

					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<!-- Map -->

	<div class="contact_map">
		<div id="google_map" class="google_map">
			<div class="map_container">
				<div id="map">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.1217841714324!2d106.67815171526041!3d10.801983561674119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175293431069ea9%3A0x6eebed96cafbd07a!2sAptech%20Saigon%20Computer%20Education!5e0!3m2!1svi!2s!4v1586172524292!5m2!1svi!2s" width="100%" height="400" aria-hidden="false" tabindex="0"></iframe>
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
<script src="${pageContext.request.contextPath }/resources/userplugins/https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
<script src="${pageContext.request.contextPath }/resources/userplugins/js/contact_custom.js"></script>

<!-- Nang Script -->
<script>
	$(document).ready(function() {
		if ($('#alert-success').text() != "") {
			setTimeout(function() {successReload()}, 3000);
		}
	});
	function successReload() {
		window.location.href="${pageContext.request.contextPath }/home";
	}
</script>
