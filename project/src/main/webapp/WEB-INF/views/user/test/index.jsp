<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/resources/userplugins/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/cart_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/userplugins/styles/cart_responsive.css">

	<style type="text/css">
.cont_w {
	max-width: 960px;
}
.order-md-2 {
	margin: 20px auto;
}
.border-top {
	border-top: 1px solid #e5e5e5;
}

.border-bottom {
	border-bottom: 1px solid #e5e5e5;
}

.border-top-gray {
	border-top-color: #adb5bd;
}

.box-shadow {
	box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
}

.lh-condensed {
	line-height: 1.25;
}
</style>


<div class="container">

	<div class="row">
		<div class="col-md-4 order-md-2 mb-4">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-muted">Your cart</span> <span
					class="badge badge-secondary badge-pill">3</span>
			</h4>
			<ul class="list-group mb-3">
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">Product name</h6>
						<small class="text-muted">Brief description</small>
					</div> <span class="text-muted">$12</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">Second product</h6>
						<small class="text-muted">Brief description</small>
					</div> <span class="text-muted">$8</span>
				</li>
				<li
					class="list-group-item d-flex justify-content-between lh-condensed">
					<div>
						<h6 class="my-0">Third item</h6>
						<small class="text-muted">Brief description</small>
					</div> <span class="text-muted">$5</span>
				</li>
				<li class="list-group-item d-flex justify-content-between bg-light">
					<div class="text-success">
						<h6 class="my-0">Promo code</h6>
						<small>EXAMPLECODE</small>
					</div> <span class="text-success">-$5</span>
				</li>
				<li class="list-group-item d-flex justify-content-between"><span>Total
						(USD)</span> <strong>$20</strong></li>
			</ul>

			<form class="card p-2">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Promo code">
					<div class="input-group-append">
						<button type="submit" class="btn btn-secondary">Redeem</button>
					</div>
				</div>
			</form>
		</div>




		<div class="col-md-8 order-md-1">
			<div id="accordion">
				<div class="card">
					<div class="card-header">
						<a class="card-link" data-toggle="collapse" href="#collapseOne">
							Pay At Home </a>
					</div>
					<div id="collapseOne" class="collapse show"
						data-parent="#accordion">
						<div class="card-body">
							<h4 class="mb-3">Billing address</h4>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="firstName">First name</label> <input type="text"
										class="form-control" id="firstName" placeholder="" value=""
										required>
									<div class="invalid-feedback">Valid first name is
										required.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="lastName">Last name</label> <input type="text"
										class="form-control" id="lastName" placeholder="" value=""
										required>
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>
							</div>

							<div class="mb-3">
								<label for="username">Username</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">@</span>
									</div>
									<input type="text" class="form-control" id="username"
										placeholder="Username" required>
									<div class="invalid-feedback" style="width: 100%;">Your
										username is required.</div>
								</div>
							</div>

							<div class="mb-3">
								<label for="email">Email <span class="text-muted">(Optional)</span></label>
								<input type="email" class="form-control" id="email"
									placeholder="you@example.com">
								<div class="invalid-feedback">Please enter a valid email
									address for shipping updates.</div>
							</div>

							<div class="mb-3">
								<label for="address">Address</label> <input type="text"
									class="form-control" id="address" placeholder="1234 Main St"
									required>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>

							<div class="mb-3">
								<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
								<input type="text" class="form-control" id="address2"
									placeholder="Apartment or suite">
							</div>

							<div class="row">
								<div class="col-md-5 mb-3">
									<label for="country">Country</label> <select
										class="custom-select d-block w-100" id="country" required>
										<option value="">Choose...</option>
										<option>United States</option>
									</select>
									<div class="invalid-feedback">Please select a valid
										country.</div>
								</div>
								<div class="col-md-4 mb-3">
									<label for="state">State</label> <select
										class="custom-select d-block w-100" id="state" required>
										<option value="">Choose...</option>
										<option>California</option>
									</select>
									<div class="invalid-feedback">Please provide a valid
										state.</div>
								</div>
								<div class="col-md-3 mb-3">
									<label for="zip">Zip</label> <input type="text"
										class="form-control" id="zip" placeholder="" required>
									<div class="invalid-feedback">Zip code required.</div>
								</div>
							</div>
							<hr class="mb-4">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="same-address"> <label class="custom-control-label"
									for="same-address">Shipping address is the same as my
									billing address</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="save-info"> <label class="custom-control-label"
									for="save-info">Save this information for next time</label>
								<hr class="mb-4">
								<button class="btn btn-primary btn-lg btn-block" type="submit">Continue
									to checkout</button>
							</div>
						</div>
					</div>
				</div>


				<div class="card">
					<div class="card-header">
						<a class="collapsed card-link" data-toggle="collapse"
							href="#collapseTwo"> Direct Payment </a>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion">
						<div class="card-body">

							<h4 class="mb-3">Billing address</h4>
							<form class="needs-validation" novalidate>
								<div class="row">
									<div class="col-md-6 mb-3">
										<label for="firstName">First name</label> <input type="text"
											class="form-control" id="firstName" placeholder="" value=""
											required>
										<div class="invalid-feedback">Valid first name is
											required.</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="lastName">Last name</label> <input type="text"
											class="form-control" id="lastName" placeholder="" value=""
											required>
										<div class="invalid-feedback">Valid last name is
											required.</div>
									</div>
								</div>

								<div class="mb-3">
									<label for="username">Username</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">@</span>
										</div>
										<input type="text" class="form-control" id="username"
											placeholder="Username" required>
										<div class="invalid-feedback" style="width: 100%;">Your
											username is required.</div>
									</div>
								</div>

								<div class="mb-3">
									<label for="email">Email <span class="text-muted">(Optional)</span></label>
									<input type="email" class="form-control" id="email"
										placeholder="you@example.com">
									<div class="invalid-feedback">Please enter a valid email
										address for shipping updates.</div>
								</div>

								<div class="mb-3">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" placeholder="1234 Main St"
										required>
									<div class="invalid-feedback">Please enter your shipping
										address.</div>
								</div>

								<div class="mb-3">
									<label for="address2">Address 2 <span
										class="text-muted">(Optional)</span></label> <input type="text"
										class="form-control" id="address2"
										placeholder="Apartment or suite">
								</div>

								<div class="row">
									<div class="col-md-5 mb-3">
										<label for="country">Country</label> <select
											class="custom-select d-block w-100" id="country" required>
											<option value="">Choose...</option>
											<option>United States</option>
										</select>
										<div class="invalid-feedback">Please select a valid
											country.</div>
									</div>
									<div class="col-md-4 mb-3">
										<label for="state">State</label> <select
											class="custom-select d-block w-100" id="state" required>
											<option value="">Choose...</option>
											<option>California</option>
										</select>
										<div class="invalid-feedback">Please provide a valid
											state.</div>
									</div>
									<div class="col-md-3 mb-3">
										<label for="zip">Zip</label> <input type="text"
											class="form-control" id="zip" placeholder="" required>
										<div class="invalid-feedback">Zip code required.</div>
									</div>
								</div>
								<hr class="mb-4">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="same-address"> <label class="custom-control-label"
										for="same-address">Shipping address is the same as my
										billing address</label>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="save-info"> <label class="custom-control-label"
										for="save-info">Save this information for next time</label>
								</div>









								<hr class="mb-4">

								<h4 class="mb-3">Payment</h4>

								<div class="d-block my-3">
									<div class="custom-control custom-radio">
										<input id="credit" name="paymentMethod" type="radio"
											class="custom-control-input" checked required> <label
											class="custom-control-label" for="credit">Credit card</label>
									</div>
									<div class="custom-control custom-radio">
										<input id="debit" name="paymentMethod" type="radio"
											class="custom-control-input" required> <label
											class="custom-control-label" for="debit">Debit card</label>
									</div>
									<div class="custom-control custom-radio">
										<input id="paypal" name="paymentMethod" type="radio"
											class="custom-control-input" required> <label
											class="custom-control-label" for="paypal">Paypal</label>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-3">
										<label for="cc-name">Name on card</label> <input type="text"
											class="form-control" id="cc-name" placeholder="" required>
										<small class="text-muted">Full name as displayed on
											card</small>
										<div class="invalid-feedback">Name on card is required</div>
									</div>
									<div class="col-md-6 mb-3">
										<label for="cc-number">Credit card number</label> <input
											type="text" class="form-control" id="cc-number"
											placeholder="" required>
										<div class="invalid-feedback">Credit card number is
											required</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 mb-3">
										<label for="cc-expiration">Expiration</label> <input
											type="text" class="form-control" id="cc-expiration"
											placeholder="" required>
										<div class="invalid-feedback">Expiration date required</div>
									</div>
									<div class="col-md-3 mb-3">
										<label for="cc-expiration">CVV</label> <input type="text"
											class="form-control" id="cc-cvv" placeholder="" required>
										<div class="invalid-feedback">Security code required</div>
									</div>
								</div>
								<hr class="mb-4">
								<button class="btn btn-primary btn-lg btn-block" type="submit">Continue
									to checkout</button>
							</form>

						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	</div>

	<!-- Scroll to Top -->
	<a id="scroll-to-top" href="#" class="btn btn-primary btn-lg"
		role="button" title="Return to top of page" data-toggle="tooltip"
		data-placement="left"><i class="fa fa-arrow-up"></i></a>

	<script
		src="${pageContext.request.contextPath }/resources/userplugins/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/popper.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/styles/bootstrap4/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TweenMax.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/TimelineMax.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/animation.gsap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/greensock/ScrollToPlugin.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/userplugins/plugins/easing/easing.js"></script>