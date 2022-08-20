<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- @NANG Fix start -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- The Bell Modal -->
<div class="modal fade" id="bellModal">
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
							<form:select class="form-control" path="status" id="editBellOrderStatus"
								items="${bellStatuses}" itemLabel="name" itemValue="id" />
							<form:input type="hidden" id="bellOrderId" path="id" />
						</div>
						<table class="table table-striped" id="bellOrderTable2"
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
						<table class="table table-striped" id="bellOrderDetailTable"
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
							<table class="table table-striped" id="bellPaymentTable"
								style="overflow-wrap: break-word">
							</table>
						</div>
						<div class="col-7">
							<p class="lead">Discount</p>
							<table class="table table-striped" id="bellDiscountTable"
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

<script>
$(document).on('click','#bellBox .bell-link',function(){
	/* $('.modal-backdrop').toggle(function(){$('.modal-backdrop').css({'display':'none'});}); */
	$.getJSON(
		'${pageContext.request.contextPath}/admin/order/update',
		{
			orderId: $(this).attr('data-orderId')
		},
		function(data){
			$('#editBellOrderStatus').val(data.orderStatusId);
			loadBellTables(data);
		}
	).fail(function(jqXHR, status, error){
		console.log(error);
		console.log(status)
	});
});

function getBellDateTime(string){
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

// load edit tables
function loadBellTables(data){
	// set id for orderId
	$('#bellOrderId').val(data.order.id);
	// load table bellOrderTable2			
	var content = '';
	var order = data.order;
	content += '<tr>';
	content += '<td>' + order.code + '</td>';
	content += '<td>' + getBellDateTime(order.createdDate) + '</td>';
	content += '<td>' + order.customerName + '</td>';
	content += '<td>' + order.customerPhone + '</td>';
	content += '<td><p>' + order.customerEmail + '</p></td>';
	content += '</tr>';
	$('#bellOrderTable2 tbody').html(content);
	// load table bellOrderDetailTable
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
	$('#bellOrderDetailTable tbody').html(content);
	// load table bellDiscountTable
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
	$('#bellDiscountTable tbody').html(content);
	// load table bellPaymentTable
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
	content += '<td><span>' + getBellDateTime(payment.createdDate) + '</span></td></tr>';
	content += '</tr>';
	$('#bellPaymentTable').html(content);
}
</script>
<!-- NANG Fix end -->

