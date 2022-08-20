<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @NANG Fix start -->
<style>
.bell-box {
	color: rgba(0, 0, 0, 5);
	font-size: 20px;
	position: relative;
	width: 40px;
}

.bell-box:hover>div {
	display: block;
}

.bell-box>span {
	font-size: 10px;
	position: absolute;
	user-select: none;
	background-color: red;
	width: 12px;
	height: 15px;
	color: #ffffff;
	text-align: center;
	border-radius: 16px;
}

.bell-box>div {
	display: none;
	min-height: 1px;
	max-height: 280px;
	overflow-y: scroll;
	width: 350px;
	position: absolute;
	background-color: #ffffff;
	box-shadow: 0px 0px 1px 0px #000;
}

.bell-box>div>ul {
	margin: 0px;
	padding: 0px;
	list-style-type: none;
	font-size: 13px;
}

.bell-box>div>ul>li {
	padding: 10px;
	border-bottom: 1px solid #eaeaea;
}

.bell-box>div>ul>li:last-child {
	border-bottom: none;
}
.bell-box>div>ul>li>a {
	color: #000;
}
.bell-box>div>ul>li>a:hover {
	color: #007bff;
}
</style>

<!-- comment search form -->

<div class="bell-box" id="bellBox">
	<i class="fa fa-bell" aria-hidden="true"></i> <span>${paypalList.size() > 0 ? paypalList.size() : 0 }</span>
	<div>
		<ul>
			<c:if test="${paypalList.size() <= 0 || empty paypalList == true }">
				<li>Empty</li>
			</c:if>
			<c:forEach var="paypal" items="${paypalList }">
				<li>
					<a href="#" class="bell-link" data-orderId="${paypal.id }" data-toggle="modal" data-target="#bellModal">
						Order id <strong>${paypal.id }</strong> with code <strong>${paypal.code }</strong> has paid by paypal
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>



<!-- NANG Fix end -->

