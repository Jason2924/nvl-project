<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<b>Brands list:</b>
					</h2>
				</div>
				<div class="col-sm-4">
					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-primary float-right"
						data-toggle="modal" data-target="#Modal-1">Add Brand</button>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="brandTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#">Name</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="brand" items="${brands }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${brand.id }</td>
						<td>${brand.name }</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip">
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#" data-brandId="${brand.id}"
								class="edit" title="Edit" data-toggle="modal" data-target="#Modal-2">
							 	<i class="material-icons">&#xE254;</i></a> 
							<a href="${pageContext.request.contextPath }/admin/brand/delete?id=${brand.id}"
								class="delete" title="Delete" data-toggle="tooltip">
								<i class="material-icons">&#xE872;</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</div>

<!-- The Modal Create -->
<div class="modal fade" id="Modal-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Add Brand</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="brandJson"
					action="${pageContext.request.contextPath }/admin/brand/create">
					<div class="form-group">
						<label>Brand Name:</label>
						<form:input type="text" class="form-control"
							path="name" placeholder="Enter Brand Name"/>
					</div>
					<form:input type="hidden" path="id"/>
					<button type="submit" class="btn btn-primary float-right">Add
						Brand</button>
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

<!-- The Modal Update -->
<div class="modal fade" id="Modal-2">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Edit Brand</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="brandJson"
					action="${pageContext.request.contextPath }/admin/brand/update">
					<div class="form-group">
						<label>Brand Name:</label>
						<form:input type="text" class="form-control"
							id="editBrandName" path="name" placeholder="Enter Brand Name"/>
					</div>
					<form:input type="hidden" path="id" id="editBrandId"/>
					<button type="submit" class="btn btn-primary float-right">Update
						Brand</button>
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
	$(document).ready(function(){
		//sort
		var turn = 0;
		$(document).on('click', '#brandTable thead a',function(){
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			$.getJSON(
				'${pageContext.request.contextPath}/admin/brand/ajaxBrandSort',
				{turn : turn},
				function(data){
					loadTable(data);
				}).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status);
				});
		});

		// load table
		function loadTable(brands){
			var content = '';
			for (var i = 0;i<brands.length;++i){
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td>' + brands[i].name + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip">'
					+ '<i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#" data-brandId="' + brands[i].id + '" '
					+ 'class="edit" title="Edit" data-toggle="modal" data-target="#Modal-2">'
					+ '<i class="material-icons">&#xE254;</i></a> '
					+ '<a href="${pageContext.request.contextPath }/admin/brand/delete?id="' + brands[i].id + '"'
					+ 'class="delete" title="Delete" data-toggle="tooltip">'
					+ '<i class="material-icons">&#xE872;</i></a>'
				content + '</td>'
				content += '</tr>';
			}
			$('#brandTable tbody').html(content);
		}

		// // load data to form edit
		$(document).on('click','#brandTable tbody .edit',function(){
			$.getJSON(
				'${pageContext.request.contextPath}/admin/brand/update',
				{
					brandId: $(this).attr('data-brandId'),
				},
				function(data){
					$('#editBrandName').val(data.name);
					$('#editBrandId').val(data.id);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
	});
</script>
