<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEBSITE BÁN HÀNG</title>
<%@include file="/include/head.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<c:if test="${userrole!='admin' }">
	<c:redirect url="index.jsp"></c:redirect>
</c:if>
<style>
.btn:hover {
	background-color: #F1F1F1;
}

.btn {
	background-color: white;
	border: 2px solid #F1F1F1;
	font-family: times new roman;
	color: black;
	padding: -17px 16px;
	cursor: pointer;
	border-radius: 20px
}

.main {
	margin-left: 550px;
}
</style>
</head>
<body>
	<%@include file="/include/header.jsp"%>


	<div class="main">
		<a href="userManager.jsp">
			<button
				style="width: auto; height: 200px; font-size: 40px; margin-top: 150px; margin-bottom: 150px; margin-left: 20px;"
				class="btn">
				<i class="fa fa-people-roof"></i> UserManager
				<p style="width: auto;; font-size: 40px;">
					<i class="fa fa-arrow-right"></i>
				</p>
			</button>
		</a> <a href="productManager.jsp">
			<button
				style="width: auto; height: 200px; font-size: 40px; margin-top: 150px; margin-bottom: 150px; margin-left: 20px;"
				class="btn">
				<i class="fa fa-glasses"> </i> ProductManager
				<p style="width: auto;; font-size: 40px;">
					<i class="fa fa-arrow-right"></i>
				</p>
			</button>
		</a>
	</div>



	<!-- <a href="userManager.jsp">	
<button style="width:auto; height:200px;font-size:40px;margin-top:150px;margin-bottom:150px;margin-left:20px;  " class="btn"><i class="fa fa-home"> </i>Home</button>
</a> -->
	<%@include file="include/footer.jsp"%>
	<script src="https://kit.fontawesome.com/af4b63cb01.js"
		crossorigin="anonymous"></script>
</body>
</html>
