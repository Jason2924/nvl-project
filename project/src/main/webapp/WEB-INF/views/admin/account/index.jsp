<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<div class="col-sm-8">
					<h2>
						<b>Accounts List:</b>
					</h2>
				</div>
				<div class="col-sm-4"></div>
			</div>
		</div>
		<table class="table table-striped" id="accountTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thName">Full Name</a></th>
					<th><a href="#" id="thPhone">Phone</a></th>
					<th><a href="#" id="thEmail">Email</a></th>
					<th><a href="#" id="thAddress">Address</a></th>
					<th><a href="#" id="thPoint">Credit Points</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="account" items="${accounts }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${account.id }</td>
						<td>${account.fullName }</td>
						<td>${account.phone }</td>
						<th style="overflow-wrap: break-word">${account.email }</th>
						<td>${account.address }</td>
						<td>${account.creditPoint }</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip">
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#" data-accountId="${account.id }"
								class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-1">
							 	<i class="material-icons">&#xE254;</i></a> 
							<a href="${pageContext.request.contextPath }/admin/account/delete?id=${account.id}"
								class="delete" title="Delete" data-toggle="tooltip">
								<i class="material-icons">&#xE872;</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- The Modal -->
<div class="modal fade" id="Modal-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Edit Account</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form:form  method="post" modelAttribute="account"
					action="${pageContext.request.contextPath }/admin/account/update">
					<form:label path="username" id="accountUsername"/>
					<div class="form-group row">
						<div class="col-6">
							<label>Name:</label>
							<form:input type="text" path="fullName" id="editAccountName"
								class="form-control" placeholder="Enter Full Name"/>
						</div>
						<div class="col-6">
							<label>Phone Number:</label>
							<form:input type="text" path="phone" id="editAccountPhone"
							class="form-control" placeholder="Enter Phone"/>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-6">
							<label>Email:</label>
							<form:input type="email" path="email" id="editAccountEmail"
								class="form-control" placeholder="Enter Email"/>
						</div>
						<div class="col-6">
							<label>Address:</label>
							<form:input type="text" path="address" id="editAccountAddress"
							class="form-control" placeholder="Enter Address"/>
						</div>
					</div>
					<div class="form-group row">
					<label>Orders List</label>
						<table class="table table-striped" id="orderTable"
							style="overflow-wrap: break-word">
							<thead>
								<tr>
									<th>No</th>
									<th>Code</th>
									<th>Date</th>
									<th>Status</th>
									<th>Payment Status</th>
									<th style="width: auto">Delivery Status</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div class="form-group row">
					<label>Vourchers List</label>
						<table class="table table-striped" id="exchangeTable"
							style="overflow-wrap: break-word">
							<thead>
								<tr>
									<th>No</th>
									<th>Order Code</th>
									<th>Point</th>
									<th>Price</th>
									<th style="width: auto">Exchange Date</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<form:input type="hidden" path="id" id="accountId"/>
					<button type="submit" class="btn btn-primary float-right">Update</button>
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
	$(document).ready(function(){
		// customerTable thead clicking event
		var turn = 0;
		$(document).on('click','#accountTable thead a',function() {
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			var accounts = [];
			$('#accountTable tbody tr').each(function(){
				var account = {
					'id': this.cells[1].innerText,
					'fullName': this.cells[2].innerText,
					'phone': this.cells[3].innerText,
					'email': this.cells[4].innerText,
					'address': this.cells[5].innerText,
					'creditPoint': this.cells[6].innerText
				}
				accounts.push(account);
			});
			$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/admin/account/ajaxAccountSort?header='
				+ $(this).attr('id') + '&turn=' + turn,
				data: JSON.stringify(accounts),
				async: false,
				cache: false,
				processData:false,
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				success: function(data){
					loadTable(data);
				}
			});
		});
		//function load table
		function loadTable(accounts){
			var content = '';
			for (var i = 0; i < accounts.length; i++) {
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td style="display:none">' + accounts[i].id + '</td>';
				content += '<td>' + accounts[i].fullName + '</td>';
				content += '<td>' + accounts[i].phone + '</td>';
				content += '<td>' + accounts[i].email + '</td>';
				content += '<td>' + accounts[i].address + '</td>';
				content += '<td>' + accounts[i].creditPoint + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#" data-accountId="' + accounts[i].id + '"';
					+ 'class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a> '
					+ '<a href="${pageContext.request.contextPath }/admin/account/delete?id="'+ accounts[i].id + '"'
					+ 'class="delete" title="Delete" data-toggle="tooltip">'
					+ '<i class="material-icons">&#xE872;</i></a>'
					+ '</td>'
				content += '</tr>';
			}
			$('#accountTable tbody').html(content);
		}
		// load data to form edit
		$(document).on('click','#accountTable .edit-no',function(){
			$.getJSON(
				'${pageContext.request.contextPath}/admin/account/update',
				{
					accountId: $(this).attr('data-accountId')
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
		function loadEditTables(data){
			// fill account info
			var account = data.account;
			$('#accountId').val(account.id);
			$('#editAccountName').val(account.fullName);
			$('#editAccountPhone').val(account.phone);
			$('#editAccountEmail').val(account.email);
			$('#editAccountAddress').val(account.address);
			$('#accountUsername').text(account.username);
			// render table order
			var orders = data.orders;
			var content='';
			for(var i = 1; i<=orders.length; ++i){
				content += '<tr>';
				content += '<td>' + i + '</td>'
				content += '<td style="display:none">' + orders[i-1].id + '</td>';
				content += '<td>' + orders[i-1].code + '</td>';
				content += '<td>' + getDateTime(orders[i-1].createdDate) + '</td>';
				content += '<td>' + orders[i-1].status + '</td>';
				content += '<td>' + orders[i-1].payments[0].method + '</td>';
				content += '<td>' + orders[i-1].deliveries[0].status + '</td>';
				content += '</tr>';
			}
			$('#orderTable tbody').html(content);
			// render table exchange
			var exchanges = data.exchanges;
			content='';
			for(var i = 1; i<=exchanges.length; ++i){
				content += '<tr>';
				content += '<td>' + i + '</td>'
				content += '<td style="display:none">' + exchanges[i-1].id + '</td>';
				content += '<td>' + exchanges[i-1].order.code + '</td>';
				content += '<td>' + exchanges[i-1].point + '</td>';
				content += '<td>' + exchanges[i-1].voucher.price + '</td>';
				content += '<td>' + getDateTime(exchanges[i-1].createdDate) + '</td>';
				content += '</tr>';
			}
			$('#exchangeTable tbody').html(content);
		}
		//function convert string to datetime
		function getDateTime(inputDate){
			var date = new Date(inputDate);
			var month = date.getMonth()+1;
			var day = date.getDate();
			var hour = date.getHours();
			var minute = date.getMinutes();
			var second = date.getSeconds();
			return output = date.getFullYear() + '-' +
			    ((''+month).length<2 ? '0' : '') + month + '-' +
			    ((''+day).length<2 ? '0' : '') + day;
		}
	});
</script>