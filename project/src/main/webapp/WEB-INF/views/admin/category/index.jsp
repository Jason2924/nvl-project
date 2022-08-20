<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<b>Categories list:</b>
					</h2>
				</div>
				<div class="col-sm-4">
					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-primary float-right"
						data-toggle="modal" data-target="#Modal-3">Add Category</button>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="categoryTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#">Name</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${categories }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${category.id }</td>
						<td>${category.name }</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip">
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#"
								class="edit" title="Edit" data-toggle="tooltip">
								<i class="material-icons">&#xE254;</i></a> 
							<a href="${pageContext.request.contextPath }/admin/category/delete?id=${category.id}"
								class="delete" title="Delete" data-toggle="tooltip">
								<i class="material-icons">&#xE872;</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- The Modal -->
	<div class="modal fade" id="Modal-3">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Category</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<form action="">
						<div class="form-group">
							<label>Category Name:</label> <input type="text"
								class="form-control" name="productname"
								placeholder="Enter Category Name">
						</div>
						<button type="submit" class="btn btn-primary float-right">Add
							Category</button>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	$(document).ready(function() {
		// sort
		var turn = 0;
		$(document).on('click', '#categoryTable thead a', function() {
			if(turn==0){
				turn = 1;
			}else{
				turn = 0;
			}
			$.getJSON(
				'${pageContext.request.contextPath}/admin/category/ajaxCategorySort',
				{turn : turn},
				function(data){
					loadTable(data);
				}).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status);
				});
		});

		// load table
		function loadTable(categories){
			var content = '';
			for (var i = 0;i<categories.length;++i){
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td>' + categories[i].name + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a> '
					+ '<a href="#"'
					+ 'class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a> '
					+ '<a href="${pageContext.request.contextPath }/admin/category/delete?id=' + categories[i].id + '"'
					+ 'class="delete" title="Delete" data-toggle="tooltip">'
					+ '<i class="material-icons">&#xE872;</i></a>'
					+ '</td>'
				content += '</tr>';
			}
			$('#categoryTable tbody').html(content);
		}
	});
</script>

