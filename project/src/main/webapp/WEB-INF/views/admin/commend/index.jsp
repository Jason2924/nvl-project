<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
							style="text-align: center" id="commendStatuses" />
					</div>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="commendTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thAccount">Account</a></th>
					<th><a href="#" id="thProduct">Product Name</a></th>
					<th><a href="#" id="thRate">Rate</a></th>
					<th><a href="#" id="thStatus">Status</a></th>
					<th>Commend</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="commend" items="${commends }" varStatus="i">
					<tr>
						<td>${i.index }</td>
						<td>${commend.account.username }</td>
						<td>${commend.product.name }</td>
						<td>${commend.rate }</td>
						<td><c:choose>
								<c:when test="${commend.status == true }">Accepted</c:when>
								<c:when test="${commend.status == false }">Not Accepted</c:when>
							</c:choose></td>
						<td>${commend.content }</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip"> 
								<i class="material-icons">&#xE03B;</i></a>
							<c:if test="${commend.status == false }">
								<a href="${pageContext.request.contextPath }/admin/commend/update?id=${commend.id}"
									class="done-no" title="Update Status" data-toggle="tooltip"> 
									<i class="material-icons">done</i></a>
							</c:if>
							<a href="${pageContext.request.contextPath }/admin/commend/delete?id=${commend.id}"
								class="delete" title="Delete" data-toggle="tooltip"> 
								<i class="material-icons">&#xE872;</i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>



<script type="text/javascript">
	$(document).ready(function(){
		// commendTable sort
		var turn = 0;
		$(document).on('click','#commendTable thead a',function() {
			if (turn == 0) {
				turn = 1;
			} else {
				turn = 0;
			}
			$.getJSON(
				'${pageContext.request.contextPath}/admin/commend/ajaxCommendSort',
				{ thead: $(this).attr('id'),turn: turn },
				function(data) {
					loadTable(data);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
		$(document).on('change','#commendStatuses',function(){
			$.getJSON(
					'${pageContext.request.contextPath}/admin/commend/ajaxCommendStatus',
					{ status: $(this).val() },
					function(data) {
						loadTable(data);
					}
				).fail(function(jqXHR, status, error){
					console.log(error);
					console.log(status)
				});
		});
		//function load table
		function loadTable(commends) {
			var content = '';
			for (var i = 0; i < commends.length; i++) {
				var status = 'Accepted';
				if(commends[i].status!=true){
					status = 'Not Accepted';
				}
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td style="display:none">' + commends[i].id + '</td>';
				content += '<td>' + commends[i].account + '</td>';
				content += '<td>' + commends[i].product + '</td>';
				content += '<td>' + commends[i].rate + '</td>';
				content += '<td>' + status + '</td>';
				content += '<td>' + commends[i].content + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"> '
					+ '<i class="material-icons">&#xE03B;</i></a>';
				if(commends[i].status!=true){
					content += '<a href="${pageContext.request.contextPath }/admin/commend/update?id= ' + commends[i].id + '"'
						+ 'class="done-no" title="Update Status" data-toggle="tooltip"> '
						+  '<i class="material-icons">done</i></a>'
				}
				content += '<a href="${pageContext.request.contextPath }/admin/commend/delete?id=' + commends[i].id + '"'
					+ 'class="delete" title="Delete" data-toggle="tooltip"> '
					+ '<i class="material-icons">&#xE872;</i></a>'
					+ '</td>'
				content += '</tr>';
			}
			$('#commendTable tbody').html(content);
		}
	})
</script>
