<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/laydulieu.tld" prefix="f"%>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript">
function validate() {
	
	
	var masp=document.myForm.masp.value;
	var tensp=document.myForm.tensp.value;
	var gia=document.myForm.gia.value;
	var hinh=document.myForm.hinh.value;
	var danhmuc=document.myForm.danhmuc.value;
	if (masp==""){
	 alert("Please Enter MaSP");
	document.myForm.masp.focus();
	return false;
	}
	
	if (tensp==""){
	 alert("Please Enter Tensp");
	document.myForm.tensp.focus();
	return false;
	}
	if (gia==""){
		 alert("Please Enter GiaSP");
		document.myForm.gia.focus();
		return false;
		}
	if (hinh==""){
		 alert("Please Enter HinhAnh");
		document.myForm.hinh.focus();
		return false;
	}
	if (danhmuc==""){
		 alert("Please Enter DanhMuc");
		document.myForm.danhmuc.focus();
		return false;
	}
}
</script>
<title>WEBSITE BÁN HÀNG</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style>
.container_swap {
	width: 400px;
	height: auto;
	margin-bottom: 300px;
}

.div_left {
	width: 200px;
	float: left;
}

.div_right {
	width: 400px;
	margin-left: 1350px;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	margin-left: 50px;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 15px;
	width: 22px
}

tr:nth-child(even) {
	background-color: #dddddd;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #dddddd;
	color: black;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #F1F1F1;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.btn:hover {
	background-color: #F1F1F1;
}
</style>
<%@include file="/include/head.jsp"%>
</head>
<body>
	<%@include file="/include/header.jsp"%>



	<div class="container_swap">

		<div class="div_left">

			<table>
				<tr>
					<th>ID</th>
					<th>MaSP</th>
					<th>TenSP</th>
					<th>GiaSP</th>
					<th>Mota</th>
					<th>HinhAnh</th>
					<th>DanhMuc</th>
					<th>GhiChu</th>
					<th style="padding: 50px">Delete/Edit</th>
				</tr>
				<c:forEach var="sanpham" items="${f:getAllSanPham()}">
					<tr>
						<td>${sanpham.getId() }</td>
						<td>${sanpham.getMasp() }</td>
						<td>${sanpham.getTensp() }</td>
						<td>${sanpham.getGia() }</td>
						<td>${sanpham.getMotangan() }</td>
						<td>${sanpham.getHinh() }</td>
						<td>${sanpham.getDanhmuc() }</td>
						<td>${sanpham.getGhichu() }</td>
						<td><button style="font-size: 20px" class="btn">
								<a href="deleteProduct?id=${sanpham.getId() }"><i
									class="fa fa-trash"></i></a>
							</button>


							<button style="margin-left: 5px; font-size: 20px" class="btn">
								<a href="productManager.jsp?id=${sanpham.getId() }"><i
									class="fa fa-edit"></i></a>
							</button></td>
					</tr>
				</c:forEach>
			</table>

		</div>

		<div class="div_right">
			<c:if test="${param.id==null }">
				<form name="myForm" action="/Web/sanpham" method="post">
					<label for="id">ID</label> <input type="text" id="id" name="id"
						placeholder="ID..."> <label for="masp">Mã sản phẩm</label>
					<input type="text" id="masp" name="masp"
						placeholder="Ma san pham...">
					<label for="tensp">Tên sản phẩm</label> <input type="text"
						id="tensp" name="tensp" placeholder="Ten san pham..."
						>
					<label for="gia">Giá</label> <input type="text" id="gia" name="gia"
						placeholder="Gia san pham..." >
					<label for="motangan"> Mô tả</label> <input type="text" id="motangan"
						name="motangan" placeholder="Mo ta..."> <label for="hinh">Hình
						ảnh</label> <input type="text" id="hinh" name="hinh"
						placeholder="Hinh anh..."> <label for="danhmuc">Danh
						mục</label> <input type="text" id="danhmuc" name="danhmuc"
						placeholder="Danh mục..." >
					<label for="ghichu">Ghi chú</label> <input type="text" id="ghichu"
						name="ghichu" placeholder="Ghi chu...">
					<button onclick="return validate();" type="submit">Create</button>
				</form>
			</c:if>
			<c:if test="${param.id>0 }">
				<c:set var="spedit" value="${f:findByIdsp(param.id) }"></c:set>
				<form name="myForm" action="/Web/editsp" method="post">
					<label for="id">ID</label> <input type="text" id="id" name="id"
						placeholder="ID..." value="${spedit.getId()}" disable readonly>
					<label for="masp">Mã sản phẩm</label> <input type="text" id="masp"
						name="masp" placeholder="Ma san pham..."
						value="${spedit.getMasp()}" >
					<label for="tensp">Tên sản phẩm</label> <input type="text"
						id="tensp" name="tensp" placeholder="Ten san pham..."
						value="${spedit.getTensp()}">
					<label for="gia">Giá</label> <input type="text" id="gia" name="gia"
						placeholder="Gia san pham..." value="${spedit.getGia()}"
						>
					<label for="mota"> Mô tả</label> <input type="text" id="motangan"
						name="motangan" placeholder="Mo ta..." value="${spedit.getMotangan()}">
					<label for="hinh">Hình ảnh</label> <input type="text" id="hinh"
						name="hinh" placeholder="Hinh anh..." value="${spedit.getHinh()}">
					<label for="danhmuc">Danh mục</label> <input type="text"
						id="danhmuc" name="danhmuc" placeholder="Danh mục..."
						value="${spedit.getDanhmuc()}" >
					<label for="ghichu">Ghi chú</label> <input type="text" id="ghichu"
						name="ghichu" placeholder="Ghi chu..."
						value="${spedit.getGhichu()}">
					<button onclick="return validate();" type="submit">Update</button>
				</form>
			</c:if>

		</div>

		<!--modal  -->


	</div>

	<script src="https://kit.fontawesome.com/af4b63cb01.js"
		crossorigin="anonymous"></script>
</body>
</html>