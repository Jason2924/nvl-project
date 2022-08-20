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
						<b>Vouchers list:</b>
					</h2>
				</div>
				<div class="col-sm-4">
					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-primary float-right"
						data-toggle="modal" data-target="#Modal-1">Add Voucher</button>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="voucherTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thPrice">Discount (%)</a></th>
					<th><a href="#" id="thPoint">Credit Points</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="voucher" items="${vouchers }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${voucher.id }</td>
						<td>${voucher.price }</td>
						<td>${voucher.point }</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip">
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#" data-voucherId="${voucher.id }"
								class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-2">
								<i class="material-icons">&#xE254;</i></a> 
							<a href="${pageContext.request.contextPath }/admin/voucher/delete?id=${voucher.id}"
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
				<h4 class="modal-title">Add Voucher</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="voucher"
					action="${pageContext.request.contextPath }/admin/voucher/create">
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Voucher Discount (%):</label>
							<form:input type="currency" class="form-control" path="price"
								placeholder="Enter Voucher Price" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Voucher Points:</label>
							<form:input type="number" class="form-control" path="point"
								placeholder="Enter Voucher Credit Point" require="required" />
						</div>
					</div>

					<button type="submit" class="btn btn-primary float-right">Add
						Voucher</button>
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
				<h4 class="modal-title">Edit Voucher</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="voucher"
					action="${pageContext.request.contextPath }/admin/voucher/update">
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Voucher Discount (%):</label>
							<form:input type="currency" class="form-control" path="price"
								id="editPrice" placeholder="Enter Voucher Price" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Voucher Points:</label>
							<form:input type="number" class="form-control" path="point"
								id="editPoint" placeholder="Enter Voucher Credit Points" require="required" />
						</div>
					</div>
					<form:input type="hidden" id="voucherId" path="id"/>
					<button type="submit" class="btn btn-primary float-right">Edit
						Voucher</button>
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
		$(document).on('click', '#voucherTable thead a', function() {
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			$.getJSON(
				'${pageContext.request.contextPath}/admin/voucher/ajaxVoucherSort',
				{turn : turn, thead : $(this).attr('id')},
				function(data){
					loadTable(data);
				}).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status);
				});
		});
		// load table
		function loadTable(vouchers){
			var content = '';
			for (var i = 0;i<vouchers.length;++i){
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td>' + vouchers[i].price + '</td>';
				content += '<td>' + vouchers[i].point + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#" data-voucherId="' + vouchers[i].id + '"'
					+ 'class="edit-no" title="Edit" data-toggle="modal"  data-target="#Modal-2">'
					+ '<i class="material-icons">&#xE254;</i></a> '
					+ '<a href="${pageContext.request.contextPath }/admin/voucher/delete?id=' + vouchers[i].id + '"'
					+ 'class="delete" title="Delete" data-toggle="tooltip">'
					+ '<i class="material-icons">&#xE872;</i></a>'
					+ '</td>'
				content += '</tr>';
			}
			$('#voucherTable tbody').html(content);
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
		$(document).on('click','#voucherTable tbody .edit-no',function(){
			$.getJSON(
				'${pageContext.request.contextPath}/admin/voucher/update',
				{ voucherId: $(this).attr('data-voucherId') },
				function(data){
					$('#editPrice').val(data.price);
					$('#editPoint').val(data.point);
					$('#voucherId').val(data.id);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
	});
</script>

