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
				<div class="col-md-10">
					<h2>
						<b>Deliveries List:</b>
					</h2>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<form:select path="statuses" class="form-control" name="statuses"
							items="${statuses}" itemLabel="name" itemValue="id"
							style="text-align: center" id="deliveryStatuses" />
					</div>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="deliveryTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thOrder">Order Code</a></th>
					<th><a href="#" id="thType">Type</a></th>
					<th><a href="#" id="thDeliveryDate">Delivery Date</a></th>
					<th><a href="#" id="thDestination">Destination</a></th>
					<th><a href="#" id="thStatus">Status</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="delivery" items="${deliveries }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${delivery.id }</td>
						<td>${delivery.order.code }</td>
						<td>${delivery.type }</td>
						<td><c:if test="${delivery.deliveryDate == null }">Not Updated</c:if>
							<fmt:formatDate value="${delivery.deliveryDate }"
								pattern="yyyy-MM-dd" /></td>
						<td style="overflow-wrap: break-word">${delivery.destination }</td>
						<td>${delivery.status }</td>
						<td>
							<div>
								<a class="add" title="Add" data-toggle="tooltip">
									<i class="material-icons">&#xE03B;</i></a> 
							 	<a href="#" data-deliveryId="${delivery.id }"
							 		class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-1">
							 		<i class="material-icons">&#xE254;</i></a> 
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- the modal-1 -->
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
				<form:form method="post" modelAttribute="deliveryJson"
					action="${pageContext.request.contextPath }/admin/delivery/update">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Order Code</th>
								<th>Type</th>
								<th>Delivery Date</th>
								<th>Destination</th>
								<th id="editThStatus" style="width:auto">Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="editId" style="display: none"></td>
								<td id="editOrderCode"></td>
								<td>
									<form:select path="type" class="form-control"
										items="${types }" id ="editType" style="text-align: center"/>
								</td>
								<td id="editDeliveryDate"></td>
								<td id="editDestination" style="overflow-wrap: break-word"></td>
								<td>
									<form:select path="status" class="form-control"
										items="${statusesEdit }" itemLabel="name" itemValue="id"
										id ="editStatus" style="text-align: center"/>
								</td>
							</tr>
						</tbody>
					</table>
					<form:input type="hidden" class="form-control" path="id" id="editDeliveryId" />
					<button id="test" type="submit" class="btn btn-primary float-right">Update</button>
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
		// deliveryStatuses select
		$(document).on('change','#deliveryStatuses',function load() {
			$.getJSON(
				'${pageContext.request.contextPath}/admin/delivery/ajaxDeliveryStatus',
				{ statusId: $(this).val() },
				function(data){
					loadTable(data);
				}).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status);
				});
		});

		// deliveryTable sort
		var turn = 0;
		$(document).on('click','#deliveryTable thead a',function() {
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			var deliveries = [];
			$('#deliveryTable tbody tr').each(function(){
				var deliveryDate = null;
				if(this.cells[4].innerText!='Not Updated'){
					deliveryDate = this.cells[4].innerText;
				}
				var delivery = {
					'id': this.cells[1].innerText,
					'orderCode': this.cells[2].innerText,
					'type': this.cells[3].innerText,
					'deliveryDate': deliveryDate,
					'destination': this.cells[5].innerText,
					'status': this.cells[6].innerText
				}
				deliveries.push(delivery);
			});
			$.ajax({
				type: "POST",
				url: '${pageContext.request.contextPath}/admin/delivery/ajaxDeliverySort?header='
				+ $(this).attr('id') + '&turn=' + turn,
				data: JSON.stringify(deliveries),
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
		function loadTable(deliveries){
			var content = '';
			for (var i = 0; i < deliveries.length; i++) {
				var no = i + 1;
				//validate delivery date
				var deliveryDate = 'Not Updated';
				if(deliveries[i].deliveryDate!=null){
					deliveryDate = getDateTime(deliveries[i].deliveryDate);
				}
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td style="display:none">' + deliveries[i].id + '</td>';
				content += '<td>' + deliveries[i].orderCode + '</td>';
				content += '<td>' + deliveries[i].type + '</td>';
				content += '<td>' + deliveryDate + '</td>';
				content += '<td>' + deliveries[i].destination + '</td>';
				content += '<td>' + deliveries[i].status + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#" data-deliveryId="' + deliveries[i].id + '"'
					+ 'class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-1">'
					+ '<i class="material-icons">&#xE254;</i></a> '
					+ '</td>'
				content += '</tr>';
			}
			$('#deliveryTable tbody').html(content);
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
		// load update form
		var deliveryDateStore = $('#editDeliveryDate').html();
		$(document).on('click','#deliveryTable .edit-no', function(){
			$.getJSON(
					'${pageContext.request.contextPath}/admin/delivery/update',
					{ deliveryId: $(this).attr('data-deliveryId') },
					function(data){
						$("#editId").text(data.id);
						$("#editOrderCode").text(data.orderCode);
						$("#editType").val(data.type);
						if(data.deliveryDate!=null){
							$("#editDeliveryDate").text(getDateTime(data.deliveryDate));
						}else{
							$("#editDeliveryDate").text('Not Updated');
						}
						$("#editDestination").text(data.destination);
						$("#editStatus").val(data.status);
						$("#editDeliveryId").val(data.id);
						$('#editThStatus').css('width', 'auto')
					}).fail(function(jqXHR, status, error){
						console.log(error);
						console.log(status);
					});
		});
	});
</script>