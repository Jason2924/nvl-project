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
						<b>Promotions list:</b>
					</h2>
				</div>
				<div class="col-sm-4">
					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-primary float-right"
						data-toggle="modal" data-target="#Modal-1">Add Promotion</button>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="promotionTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thName">Name</a></th>
					<th><a href="#" id="thPrice">Discount (%)</a></th>
					<th><a href="#" id="thDescription">Description</a></th>
					<th><a href="#" id="thStartDate">Start Date</a></th>
					<th><a href="#" id="thEndDate">End Date</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="promotion" items="${promotions }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${promotion.id }</td>
						<td>${promotion.name }</td>
						<td>${promotion.price }</td>
						<td>${promotion.description }</td>
						<td><fmt:formatDate value="${promotion.startDate }" 
							pattern = "yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${promotion.endDate }"
							pattern = "yyyy-MM-dd" /></td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip">
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#"
								class="edit-no" title="Edit" data-toggle="modal"
								data-target="#Modal-2" data-promotionId="${promotion.id}">
								<i class="material-icons">&#xE254;</i></a> 
							<a href="${pageContext.request.contextPath }/admin/promotion/delete?id=${promotion.id}"
								class="delete" title="Delete" data-toggle="tooltip">
								<i class="material-icons">&#xE872;</i></a>
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
				<h4 class="modal-title">Add Promotion</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="promotion"
					action="${pageContext.request.contextPath }/admin/promotion/create">
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Promotion Name:</label>
							<form:input type="text" class="form-control" path="name"
								placeholder="Enter Promotion Name" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Promotion Discount (%):</label>
							<form:input type="currency" class="form-control" path="price"
								placeholder="Enter Promotion Price" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Start Date:</label>
							<form:input type="date" class="form-control" path="startDate"
								placeholder="Enter Promotion Start Date" require="required" />
						</div>
						<div class="col-sm-6">
							<label>End Date:</label>
							<form:input type="date" class="form-control" path="endDate"
								placeholder="Enter Promotion End Date" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<label>Promotion Description:</label>
						<form:textarea type="text" class="form-control" path="description"
							placeholder="Enter Promotion Name" require="required" />
					</div>
					<button type="submit" class="btn btn-primary float-right">Add
						Promotion</button>
				</form:form>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- The Modal-2 -->
<div class="modal fade" id="Modal-2">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Edit Promotion</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="promotion"
					action="${pageContext.request.contextPath }/admin/promotion/update">
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Promotion Name:</label>
							<form:input type="text" class="form-control" path="name"
								id="editName" placeholder="Enter Promotion Name" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Promotion Discount (%):</label>
							<form:input type="currency" class="form-control" path="price"
								id="editPrice" placeholder="Enter Promotion Price" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Start Date:</label>
							<form:input type="date" class="form-control" path="startDate"
								id="editStartDate" placeholder="Enter Promotion Start Date" require="required" />
						</div>
						<div class="col-sm-6">
							<label>End Date:</label>
							<form:input type="date" class="form-control" path="endDate"
								id="editEndDate" placeholder="Enter Promotion End Date" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<label>Promotion Description:</label>
						<form:textarea type="text" class="form-control" path="description"
							id="editDescription" placeholder="Enter Promotion Description" require="required" />
					</div>
					<p class="lead">Details</p>
					<table class="table table-striped" id="detailTable"
								style="overflow-wrap: break-word">
						<thead>
							<tr>
								<th>No</th>
								<th>Product</th>
								<th>Brand</th>
							</tr>
						</thead>
					</table>
					<form:input type="hidden" id="promotionId" path="id"/>
					<button type="submit" class="btn btn-primary float-right">Edit
						Promotion</button>
				</form:form>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		// sort
		var turn = 0;
		$(document).on('click', '#promotionTable thead a', function() {
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			$.getJSON(
				'${pageContext.request.contextPath}/admin/promotion/ajaxPromotionSort',
				{turn : turn, thead : $(this).attr('id')},
				function(data){
					loadTable(data);
				}).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status);
				});
		});
		// load table
		function loadTable(promotions){
			var content = '';
			for (var i = 0;i<promotions.length;++i){
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td>' + promotions[i].name + '</td>';
				content += '<td>' + promotions[i].price + '</td>';
				content += '<td>' + promotions[i].description + '</td>';
				content += '<td>' + getDateTime(promotions[i].startDate) + '</td>';
				content += '<td>' + getDateTime(promotions[i].endDate) + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#"'
					+ 'class="edit-no" title="Edit"  data-toggle="modal" '
					+ 'data-target="#Modal-2"  data-promotionId="' + promotions[i].id + '">'
					+ '<i class="material-icons">&#xE254;</i></a> '
					+ '<a href="${pageContext.request.contextPath }/admin/promotion/delete?id="' + promotions[i].id + '"'
					+ 'class="delete" title="Delete" data-toggle="tooltip">'
					+ '<i class="material-icons">&#xE872;</i></a>'
					+ '</td>'
				content += '</tr>';
			}
			$('#promotionTable tbody').html(content);
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
			    ((''+day).length<2 ? '0' : '') + day;
		}
		// load data to form edit
		$(document).on('click','#promotionTable tbody .edit-no',function(){
			$.getJSON(
				'${pageContext.request.contextPath}/admin/promotion/update',
				{ promotionId: $(this).attr('data-promotionId') },
				function(data){
					$('#editName').val(data.name);
					$('#editPrice').val(data.price);
					$('#editStartDate').val(getDateTime(data.startDate));
					$('#editEndDate').val(getDateTime(data.endDate));
					$('#editDescription').val(data.description);
					$('#promotionId').val(data.id);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
	});
</script>

