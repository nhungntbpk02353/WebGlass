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
	
	var uname=document.myForm.username.value;
	var pass=document.myForm.password.value;
	var fullname=document.myForm.fullname.value;
	var email=document.myForm.email.value;
	var userole=document.myForm.userole.value;
	if (uname==""){
	 alert("Please Enter Username");
	document.myForm.username.focus();
	return false;
	}
	
	if (pass==""){
	 alert("Please Enter Password");
	document.myForm.password.focus();
	return false;
	}
	if (fullname==""){
		 alert("Please Enter Fulname");
		document.myForm.fullname.focus();
		return false;
		}
	if (email==""){
		 alert("Please Enter Email");
		document.myForm.email.focus();
		return false;
	}
	if (userole==""){
		 alert("Please Enter Userole");
		document.myForm.userole.focus();
		return false;
	}
}
</script>
<title>WEBSITE BÁN HÀNG</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	width: 660px;
	margin-left: 930px;
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
					<th>Username</th>
					<th>Password</th>
					<th>Fullname</th>
					<th>Email</th>
					<th>Userole</th>
					<th>Delete/Update</th>
					
				</tr>
				<c:forEach var="users" items="${f:getAllUsers()}">
					<tr>
						<td>${users.getId() }</td>
						<td>${users.getUsername() }</td>
						<td>${users.getPassword() }</td>
						<td>${users.getFullname() }</td>
						<td>${users.getEmail() }</td>
						<td>${users.getUserole() }</td>
						<td><button style="font-size: 20px" class="btn">
								<a href="deleteUser?id=${users.getId() }" ><i class="fa fa-trash"></i></a>
							</button>
							
							
							<button style="margin-left: 5px; font-size: 20px" class="btn">
								<a href="userManager.jsp?id=${users.getId() }" ><i class="fa fa-edit"></i></a>
							</button></td>
					</tr>
				</c:forEach>
			</table>

		</div>

		<div class="div_right">
		<c:if test="${param.id==null }">
			<form name="myForm" action="/Web/userServlet" method="post">
				<label for="id">ID</label> <input type="text"
					id="id" name="id" placeholder="ID...">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" placeholder="Username.." > 
					<label
					for="password">Password</label> <input type="text" id="password"
					name="password" placeholder="Password.." > 
					<label
					for="fullname">Fullname</label> <input type="text" id="fullname"
					name="fullname" placeholder="Fullname.." > 
					<label
					for="email">Email</label> <input type="email" id="email"
					name="email" placeholder="Email..." > 
					<br>
					<label
					for="role">Userole</label> <input type="text" id="role"
					name="userole" placeholder="Userole..." > 
					<button onclick="return validate();" type="submit">Create</button>
			</form>
		</c:if>
		<c:if test="${param.id>0 }">
		<c:set var="usedit" value="${f:findByIdusers(param.id) }"></c:set>
			<form name="myForm" action="/Web/userEdit" method="post">
				<label for="id">ID</label> <input type="text"
					id="id" name="id" placeholder="ID..." value="${usedit.getId()}" disable readonly>
				<label for="username">Username</label> <input type="text"
					id="username" name="username" placeholder="Username.." value="${usedit.getUsername()}" > 
					<label
					for="password">Password</label> <input type="text" id="password"
					name="password" placeholder="Password.." value="${usedit.getPassword()}" >
					<label
					for="fullname">Fullname</label> <input type="text" id="fullname"
					name="fullname" placeholder="Fullname.." value="${usedit.getFullname()}" > 
					<label
					for="email">Email</label> <input type="email" id="email"
					name="email" placeholder="Email..." value="${usedit.getEmail()}" > 
								<br>
					<label
					for="role">Userole</label> <input type="text" id="role"
					name="role" placeholder="Userole..." value="${usedit.getUserole()}" > 
					<button onclick="return validate();" type="submit">Update</button>
			</form>
</c:if>

		</div>
		
<!--modal  -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div style="width: 700px;" class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">CREATE USER</h4>
					</div>
					
		
					<label style="margin-left: 10px;"username"> Username</label> <input
						type="text" id="username" name="username" placeholder="Username..">
						
					<label style="margin-left: 10px;"password"> Password</label> <input
						type="text" id="password" name="password" placeholder="Password..">
						
					<label style="margin-left: 10px;"fullname"> Fullname</label> <input
						type="text" id="fullname" name="fullname" placeholder="Fullname.	.">
						
					<label style="margin-left: 10px;"email"> Email</label> <input
						type="text" id="email" name="email" placeholder="Email...">
						
					<label style="margin-left: 10px;"userole"> Role</label> <input
						type="text" id="userole" name="userole" placeholder="userole...">
						
						<div class="modal-footer">
						<button type="submit" class="btn btn-submit" data-dismiss="modal">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
						
						
				</div>

			</div>
		</div>

	</div>
	<%@include file="include/footer.jsp"%>
	<script src="https://kit.fontawesome.com/af4b63cb01.js"
		crossorigin="anonymous"></script>
</body>
</html>