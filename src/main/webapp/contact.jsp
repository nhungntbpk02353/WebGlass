<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEBSITE BÁN HÀNG</title>
<%@include file="include/head.jsp"%>
<style >
.main_form{
	margin-top: 40px;
	position: unset;
}


</style>
</head>

<body>

	<%@include file="include/header.jsp"%>
	
	<div>
	
	</div>
	<div id="contact" class="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<form action="/Web/sendMailServlet" method="post" id="request" class="main_form">
						<div class="row">
							<div class="col-md-12 ">
								<h3>Contact Us</h3>
							</div>
							<!-- <div class="col-md-12 ">
								<input class="contactus" placeholder="Name" 
									name="Name">
							</div>
							<div class="col-md-12">
								<input class="contactus" placeholder="Phone Number" 
									name="Phone Number">
							</div> -->
							<div class="col-md-12">
								<input type="email" class="contactus" placeholder="Email" 
									name="Email" >
							</div>
							<div class="col-md-12">
								<input class="contactusmess" placeholder="Subject" 
									name="Subject" >
							</div>
							<div class="col-md-12">
								<input class="contactusmess" placeholder="Content" 
									name="Content" ">
							</div>
							<div class="col-md-12">
								<button type="submit" class="send_btn">Send</button>
							</div>
						</div>
					</form>
					<br>
					<mark class="p-0">${message }</mark>
				</div>
			</div>
		</div>

	</div>
	
	<br>
	<%@include file="include/footer.jsp"%>


</body>
</html>