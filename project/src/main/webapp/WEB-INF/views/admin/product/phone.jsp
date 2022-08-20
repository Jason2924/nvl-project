<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
						<b>Phones List:</b>
					</h2>
				</div>
				<div class="col-sm-4">
					<!-- Button to Open the Modal -->
					<button type="button" class="btn btn-primary float-right"
						data-toggle="modal" data-target="#Modal-1">Add Product</button>
				</div>
			</div>
		</div>
		<table class="table table-striped" id="productTable">
			<thead>
				<tr>
					<th>No</th>
					<th><a href="#" id="thName">Name</a></th>
					<th><a href="#" id="thPrice">Price</a></th>
					<th><a href="#" id="thQuantity">Quantity</a></th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="phone" items="${phones }" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td style="display: none">${phone.id }</td>
						<td>
							<img src="${pageContext.request.contextPath }/resources/upload/images/products/${phone.photo }"
							alt="${phone.photo }" class="img-size-32 mr-2">
							${phone.name }
						</td>
						<td><c:forEach var="price" items="${phone.prices }">
							<c:if test="${price.status==true }">
									$${price.price }
							</c:if>
						</c:forEach></td>
						<td>${phone.quantity==0?'Out Of Stock':phone.quantity }</td>
						<td>
							<a class="add" title="Add" data-toggle="tooltip"> 
								<i class="material-icons">&#xE03B;</i></a> 
							<a href="#" data-productId="${phone.id }"
								class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-2"> 
								<i class="material-icons">&#xE254;</i></a>
							<a href="${pageContext.request.contextPath }/admin/product/delete?id=${phone.id}"
								class="delete" title="Delete" data-toggle="tooltip"> 
								<i class="material-icons">&#xE872;</i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- The Modal-1 Create-->
<div class="modal fade container" id="Modal-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Add Product</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="productTotal"
					enctype="multipart/form-data"
					action="${pageContext.request.contextPath }/admin/product/create">
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Product Name:</label>
							<form:input type="text" class="form-control" path="product.name"
								placeholder="Enter Product Name" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Product Brand Name:</label>
							<form:select class="form-control" path="product.brand"
								items="${brands }" itemLabel="name" itemValue="id" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Product Price:</label>
							<form:input type="text" class="form-control" path="price"
								placeholder="Enter Product Price" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Product Quantity:</label>
							<form:input type="text" class="form-control" path="product.quantity"
								placeholder="Enter Product Quantity" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12">
							<label>Product Description:</label>
							<form:textarea class="form-control" path="product.description" rows="2" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<label>Product Image 1 (Front): </label>
							<img src=""
								id="addProductFPhoto" width="120" height="100"/>
							<input type="file" class="form-control-file border uploadPhoto"
								data-class="modal1" name="multipartFiles[0]" accept="image/*" />
						</div>
						<div class="col-sm-4">
							<label>Product Image 2 (Rear): </label>
							<img src=""
								id="addProductRPhoto" width="120" height="100"/>
							<input type="file" class="form-control-file border uploadPhoto"
								data-class="modal1" name="multipartFiles[1]" accept="image/*" />
						</div>
						<div class="col-sm-4">
							<label>Product Image 3 (Back): </label>
							<img src=""
								id="addProductBPhoto" width="120" height="100"/>
							<input type="file" class="form-control-file border uploadPhoto"
								data-class="modal1" name="multipartFiles[2]" accept="image/*" />
						</div>
					</div>
					<h4 class="modal-title">Configuration:</h4>
					<hr>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>OS:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter OS" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Front Camera:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter Front Camera" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Size:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter Size" require="required" />						
						</div>
						<div class="col-sm-6">
							<label>Battery:</label>
							<form:input type="text" class="form-control"  path="product.configuration"
								placeholder="Enter Battery" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Back Camera:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter Back Camera" require="required" />
						</div>
						<div class="col-sm-6">
							<label>RAM:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter RAM" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Display:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter Display" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Resolution:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								placeholder="Enter Resolution" require="required" />
						</div>
					</div>
					<input type="hidden" name="isPhone" value="1" />
					<input type="hidden" name="newId" id="newId" value="${newId }" />
					<button id="test" type="submit" class="btn btn-primary float-right">Add Product</button>
				</form:form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button id="createTest" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<!-- The Modal-2 Edit -->
<div class="modal fade container" id="Modal-2">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Edit Product</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form:form method="post" modelAttribute="productTotal"
					enctype="multipart/form-data"
					action="${pageContext.request.contextPath }/admin/product/update">
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Product Name:</label>
							<form:input type="text" class="form-control" path="product.name"
								id="editProductName" placeholder="Enter Product Name" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Product Brand Name:</label>
							<form:select class="form-control" path="product.brand"
								id="editBrand" items="${brands }" itemLabel="name" itemValue="id" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Product Price:</label>
							<form:input type="text" class="form-control" path="price"
								id="editPrice" placeholder="Enter Product Price" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Product Quantity:</label>
							<form:input type="text" class="form-control" path="product.quantity"
								id="editProductQuantity" placeholder="Enter Product Quantity" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-12">
							<label>Product Description:</label>
							<form:textarea class="form-control" path="product.description"
								id="editProductDescription"  rows="2" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-4">
							<label>Product Image 1 (Front): </label>
							<img src=""
								id="editProductFPhoto" width="120" height="100"/>
							<input type="file" class="form-control-file border uploadPhoto"
								name="multipartFiles[0]" accept="image/*" />
						</div>
						<div class="col-sm-4">
							<label>Product Image 2 (Rear): </label>
							<img src=""
								id="editProductRPhoto" width="120" height="100"/>
							<input type="file" class="form-control-file border uploadPhoto"
								name="multipartFiles[1]" accept="image/*" />
						</div>
						<div class="col-sm-4">
							<label>Product Image 3 (Back): </label>
							<img src=""
								id="editProductBPhoto" width="120" height="100"/>
							<input type="file" class="form-control-file border uploadPhoto"
								name="multipartFiles[2]" accept="image/*" />
						</div>
					</div>
					<h4 class="modal-title">Configuration:</h4>
					<hr>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>OS:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigOs" placeholder="Enter OS" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Front Camera:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigFCamera" placeholder="Enter Front Camera" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Size:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigSize" placeholder="Enter Size" require="required" />						
						</div>
						<div class="col-sm-6">
							<label>Battery:</label>
							<form:input type="text" class="form-control"  path="product.configuration"
								id="editConfigBattery" placeholder="Enter Battery" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Back Camera:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigBCamera" placeholder="Enter Back Camera" require="required" />
						</div>
						<div class="col-sm-6">
							<label>RAM:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigRam" placeholder="Enter RAM" require="required" />
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-6">
							<label>Display:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigDisplay" placeholder="Enter Display" require="required" />
						</div>
						<div class="col-sm-6">
							<label>Resolution:</label>
							<form:input type="text" class="form-control" path="product.configuration"
								id="editConfigResolution" placeholder="Enter Resolution" require="required" />
						</div>
					</div>
					<form:input type="hidden" id="productId" path="product.id" />
					<input type="hidden" name="isPhone" value="1" />
					<button id="test" type="submit" class="btn btn-primary float-right">Update Product</button>
				</form:form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button id="editTest" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function() {
		// productTable sort
		var turn = 0;
		$(document).on('click','#productTable thead a',function() {
			if (turn == 0) {
				turn = 1;
			} else {
				turn = 0;
			}
			$.getJSON(
				'${pageContext.request.contextPath}/admin/product/ajaxProductSort',
				{
					header: $(this).attr('id'),
					turn: turn,
					isPhone: 1
				},
				function(data) {
					loadTable(data);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
		//function load table
		function loadTable(products) {
			var content = '';
			for (var i = 0; i < products.length; i++) {
				var no = i + 1;
				content += '<tr>';
				content += '<td>' + no + '</td>';
				content += '<td style="display:none">' + products[i].id + '</td>';
				content += '<td>'
					+ '<img src="${pageContext.request.contextPath }/resources/upload/images/products/' + products[i].photo + '"'
					+ 'alt="' + products[i].photo + '" class="img-size-32 mr-2">'
					+ products[i].name
					+ '</td>';
				content += '<td>' + '$' + products[i].price + '</td>';
				content += '<td>' + products[i].quantity + '</td>';
				content += '<td>'
					+ '<a class="add" title="Add" data-toggle="tooltip"> '
					+ '<i class="material-icons">&#xE03B;</i></a>'
					+ '<a href="#" data-productId="' + products[i].id + '" '
					+ 'class="edit-no" title="Edit" data-toggle="modal" data-target="#Modal-2"> '
					+ '<i class="material-icons">&#xE254;</i></a>'
					+ '<a href="${pageContext.request.contextPath }/admin/product/delete?id=' + products[i].id + '" '
					+ 'class="delete" title="Delete" data-toggle="tooltip"> '
					+ '<i class="material-icons">&#xE872;</i></a>'
					+ '</td>'
				content += '</tr>';
			}
			$('#productTable tbody').html(content);
		}
		//function convert string to datetime
		function getDateTime(inputDate) {
			var date = new Date(inputDate);
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hour = date.getHours();
			var minute = date.getMinutes();
			var second = date.getSeconds();
			return output = date.getFullYear() + '-'
				+ (('' + month).length < 2 ? '0' : '')
				+ month + '-'
				+ (('' + day).length < 2 ? '0' : '') + day;
		}
		// load data to form edit
		$(document).on('click','#productTable tbody .edit-no',function(){
			$.getJSON(
				'${pageContext.request.contextPath}/admin/product/update',
				{
					productId: $(this).attr('data-productId'),
					isPhone: 1
				},
				function(data){
					$('#editProductName').val(data.product.name);
					$('#editBrand').val(data.brandId);
					$('#editPrice').val(data.price);
					$('#editProductQuantity').val(data.product.quantity);
					$('#editProductDescription').val(data.product.description);
					$('#editProductFPhoto').attr('src',
							'${pageContext.request.contextPath }/resources/upload/images/products/' + data.photos[1]);
					$('#editProductRPhoto').attr('src',
							'${pageContext.request.contextPath }/resources/upload/images/products/' + data.photos[2]);
					$('#editProductBPhoto').attr('src',
							'${pageContext.request.contextPath }/resources/upload/images/products/' + data.photos[0]);
					$('#editConfigOs').val(data.configs[0]);
					$('#editConfigFCamera').val(data.configs[1]);
					$('#editConfigSize').val(data.configs[2]);
					$('#editConfigBattery').val(data.configs[3]);
					$('#editConfigBCamera').val(data.configs[4]);
					$('#editConfigRam').val(data.configs[5]);
					$('#editConfigDisplay').val(data.configs[6]);
					$('#editConfigResolution').val(data.configs[7]);
					$('#productId').val(data.product.id);
				}
			).fail(function(jqXHR, status, error){
				console.log(error);
				console.log(status)
			});
		});
		// catch changing images event
		$(document).on('change','.uploadPhoto',function(){
			var dataClass = $(this).data('class');
			var name = $(this).attr('name');
			readURL(this, name, dataClass);
		});
		// read url
		function readURL(input, name, dataClass) {
  			if (input.files && input.files[0]){
    			var reader = new FileReader();
    			reader.onload = function(e) {
        			if(dataClass == 'modal1'){
        				if(name == 'multipartFiles[0]'){
        					$('#addProductFPhoto').attr('src', e.target.result);
        				}else if(name == 'multipartFiles[1]'){
        					$('#addProductRPhoto').attr('src', e.target.result);
        				}else if(name == 'multipartFiles[2]'){
        					$('#addProductBPhoto').attr('src', e.target.result);
        				}
            		}else{
            			if(name == 'multipartFiles[0]'){
        					$('#editProductFPhoto').attr('src', e.target.result);
        				}else if(name == 'multipartFiles[1]'){
        					$('#editProductRPhoto').attr('src', e.target.result);
        				}else if(name == 'multipartFiles[2]'){
        					$('#editProductBPhoto').attr('src', e.target.result);
        				}
                	}
    			}
			reader.readAsDataURL(input.files[0]); // convert to base64 string
  			}
		}
	});
</script>