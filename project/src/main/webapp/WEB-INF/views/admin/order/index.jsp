<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<div class="container">
	<div class="table-wrapper">
		<div class="table-title">
			<div class="row">
				<div class="col-md-10">
					<h2>
						<b>Orders List:</b>
					</h2>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<form:select path="statuses" class="form-control" name="statuses"
							items="${statuses}" itemLabel="name" itemValue="id"
							style="text-align: center" id="orderStatuses" />
					</div>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="orderTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thOrderCode">Order Code</a></th>
					<th><a href="#" id="thCustomer">Customer</a></th>
					<th><a href="#" id="thOrderDate">Order Date</a></th>
					<th><a href="#" id="thPrice">Price</a></th>
					<th><a href="#" id="thStatus">Status</a></th>
					<th><a href="#" id="thDelivery">Delivery</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${order.id }</td>
						<td>${order.code }
						<td><c:choose>
								<c:when test="${order.account!=null }">
								${order.account.fullName }
							</c:when>
								<c:when test="${order.account==null }">
								${order.customerName }
							</c:when>
							</c:choose></td>
						<td><fmt:formatDate value="${order.createdDate }" 
							pattern = "yyyy-MM-dd HH:mm:ss" /></td>
						<td>
							<c:forEach var="payment" items="${order.payments }">
								$<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${payment.price }"/>
							</c:forEach>
						</td>
						<td>${order.status }
						<td>
							<c:forEach var="delivery" items="${order.deliveries }">
								<a>${delivery.destination }</a>
							</c:forEach>
						</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip">
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#" data-orderId="${order.id }"
								class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-1">
								<i class="material-icons">&#xE254;</i></a> 
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- The Modal-1 -->
<div class="modal fade" id="Modal-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Update Order</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="order"
					action="${pageContext.request.contextPath }/admin/order/update">
					<div class="form-group row">
						<div class="col-sm-6">
							<p class="lead">Order</p>
						</div>
						<div class="col-sm-3 align-self-center text-right">
							<label>Order Status: </label>
						</div>
						<div class="col-sm-3">
							<form:select class="form-control" path="status" id="editOrderStatus"
								items="${statuses}" itemLabel="name" itemValue="id" />
							<form:input type="hidden" id="orderId" path="id" />
						</div>
						<table class="table table-striped" id="orderTable2"
							style="overflow-wrap: break-word">
							<thead>
								<tr>
									<th>Code</th>
									<th>Date</th>
									<th>Name</th>
									<th>Phone</th>
									<th style="width:auto">Email</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div class="form-group row">
						<p class="lead">Order Details</p>
						<table class="table table-striped" id="orderDetailTable"
							style="overflow-wrap: break-word">
							<thead>
								<tr>
									<th>No</th>
									<th>Product</th>
									<th>Unit Price</th>
									<th>Quantity</th>
									<th>Sub Total</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div class="form-group row">
						<div class="col-5">
							<p class="lead">Payment</p>
							<table class="table table-striped" id="paymentTable"
								style="overflow-wrap: break-word">
							</table>
						</div>
						<div class="col-7">
							<p class="lead">Discount</p>
							<table class="table table-striped" id="discountTable"
								style="overflow-wrap: break-word">
								<thead>
									<tr>
									<th>No</th>
									<th>Type</th>
									<th>Content</th>
									<th>Price</th>
								</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
					<form:input type="hidden" class="form-control" path="id" />
					<button id="test" type="submit" class="btn btn-primary float-right">Update
						Order</button>
				</form:form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		// orderStatuses changing event
		$(document).on('change','#orderStatuses',function load() {
			$.getJSON(
				'${pageContext.request.contextPath}/admin/order/ajaxOrderStatus',
				{ status: $(this).val() },
				function(data){
					loadOrderTable(data);
			}).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status)
			});
		});
		// orderTable thead clicking event
		var turn = 0;
		$(document).on('click','#orderTable thead a',function() {
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			var tbodyRows = $('#orderTable>tbody>tr').length;
			var orders = new Array(tbodyRows);
			for(var i = 0; i < tbodyRows; ++i){
				var order = {
					"id": $('#orderTable')[0].rows[i+1].cells[1].innerText,
					"code": $('#orderTable')[0].rows[i+1].cells[2].innerText,
					"name": $('#orderTable')[0].rows[i+1].cells[3].innerText,
					"createdDate": $('#orderTable')[0].rows[i+1].cells[4].innerText,
					"price": $('#orderTable')[0].rows[i+1].cells[5].innerText.substring(1,5),
					"status": $('#orderTable')[0].rows[i+1].cells[6].innerText,
					"delivery": $('#orderTable')[0].rows[i+1].cells[7].innerText
				}
				orders[i]=order;
			}
			$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/admin/order/ajaxOrderSort?header='
				+ $(this).attr('id') + '&turn=' + turn,
				data: JSON.stringify(orders),
				async: false,
				cache: false,
				processData:false,
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				success: function(data){
					loadOrderTable(data);
				}
			});
		});
		//function load orderTable
		function loadOrderTable(orders){
			var content = '';
			for (var i = 1; i <= orders.length; ++i) {
				content += '<tr>';
				content += '<td>' + i + '</td>';
				content += '<td style="display:none">' + orders[i-1].id + '</td>';
				content += '<td>' + orders[i-1].code + '</td>';
				content += '<td>' + orders[i-1].name + '</td>';
				content += '<td>' + getDateTime(orders[i-1].createdDate) + '</td>';
				content += '<td>' + '$' + orders[i-1].price + '</td>';
				content += '<td>' + orders[i-1].status + '</td>';
				content += '<td>' + orders[i-1].delivery + '</a></td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#" data-orderId="' + orders[i-1].id + '"'
					+ 'class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-1">'
					+ '<i class="material-icons">&#xE254;</i></a> '
					+ '</td>'
				content += '</tr>';
			}
			$('#orderTable tbody').html(content);
		}
		//function convert string to datetime
		function getDateTime(string){
			var date = new Date(string);
			var month = date.getMonth()+1;
			var day = date.getDate();
			var hour = date.getHours();
			var minute = date.getMinutes();
			var second = date.getSeconds();
			return output = date.getFullYear() + '-' +
			    ((''+month).length<2 ? '0' : '') + month + '-' +
			    ((''+day).length<2 ? '0' : '') + day + ' ' +
			    ((''+hour).length<2 ? '0' :'') + hour + ':' +
			    ((''+minute).length<2 ? '0' :'') + minute + ':' +
			    ((''+second).length<2 ? '0' :'') + second;
		}
		// load data to form edit
		$(document).on('click','#orderTable tbody .edit-no',function(){
			$.getJSON(
				'${pageContext.request.contextPath}/admin/order/update',
				{
					orderId: $(this).attr('data-orderId')
				},
				function(data){
					$('#editOrderStatus').val(data.orderStatusId);
					loadEditTables(data);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
		// load edit tables
		function loadEditTables(data){
			// set id for orderId
			$('#orderId').val(data.order.id);
			// load table orderTable2			
			var content = '';
			var order = data.order;
			content += '<tr>';
			content += '<td>' + order.code + '</td>';
			content += '<td>' + getDateTime(order.createdDate) + '</td>';
			content += '<td>' + order.customerName + '</td>';
			content += '<td>' + order.customerPhone + '</td>';
			content += '<td><p>' + order.customerEmail + '</p></td>';
			content += '</tr>';
			$('#orderTable2 tbody').html(content);
			// load table orderDetailTable
			content = '';
			var orderDetails = data.orderDetails;
			var totalOrderPrice = 0;
			for(var i = 1; i<=orderDetails.length; ++i) {
				content += '<tr>';
				content += '<td>' + i + '</td>';
				content += '<td>' + orderDetails[i-1].product.name + '</td>';
				content += '<td>' + orderDetails[i-1].price + '</td>';
				content += '<td>' + orderDetails[i-1].quantity + '</td>';
				content += '<td>$' + orderDetails[i-1].price * orderDetails[i-1].quantity + '</td>';
				totalOrderPrice += orderDetails[i-1].price * orderDetails[i-1].quantity;
				content += '</tr>';
			}
			$('#orderDetailTable tbody').html(content);
			// load table discountTable
			content = '';
			var i = 1;
			var totalDiscountPrice = 0;
			var exchanges = data.exchanges;
			for(var j = 1; j<=exchanges.length; ++j) {
				content += '<tr>';
				content += '<td>' + ++i + '</td>';
				content += '<td>' + 'Voucher' + '</td>';
				content += '<td>' + exchanges[j-1].voucher.point + ' points</td>';
				content += '<td>$' + exchanges[j-1].voucher.price + '</td>';
				totalDiscountPrice += exchanges[j-1].voucher.price;
				content += '</tr>';
			}
			var promotions = data.promotions;
			for(var j = 1; j<=promotions.length; ++j) {
				content += '<tr>';
				content += '<td>' + ++i + '</td>';
				content += '<td>' + 'Promotion' + '</td>';
				content += '<td>' + promotions[j-1].name + '</td>';
				content += '<td>' + promotions[j-1].price + '%</td>';
				totalDiscountPrice += promotions[j-1].price;
				content += '</tr>';
			}
			$('#discountTable tbody').html(content);
			// load table paymentTable
			content = '';
			var payment = data.payment;
			content += '<tr><th style="width: 50%">Method:</th>';
			content += '<td><span>' + payment.method + '</span></td></tr>';
			content += '<tr><th style="width: 50%">Order Price:</th>';
			content += '<td><span>$' + totalOrderPrice + '</span></td></tr>';
			content += '<tr><th style="width: 50%">Discount:</th>';
			content += '<td><span>$' + totalDiscountPrice + '</span></td></tr>';
			content += '<tr><th style="width: 50%">Payment Price:</th>';
			content += '<td><span>$' + payment.price + '</span></td></tr>';
			content += '<tr><th style="width: 50%">Payment Date:</th>';
			content += '<td><span>' + getDateTime(payment.createdDate) + '</span></td></tr>';
			content += '</tr>';
			$('#paymentTable').html(content);
		}
	});
</script>