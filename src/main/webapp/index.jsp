<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEBSITE BÁN HÀNG</title>
<%@include file="include/head.jsp"%>
<style>
.main_form {
	margin-top: 40px;
	position: unset;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border: 2px solid #F1F1F1;
}
</style>
</head>

<body>

	<%@include file="include/header.jsp"%>

	<!-- phân trang -->


	<section class="banner_main">
		<div id="banner1" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#banner1" data-slide-to="0" class="active"></li>
				<li data-target="#banner1" data-slide-to="1"></li>
				<li data-target="#banner1" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="container">
						<div class="carousel-caption">
							<div class="text-bg">
								<h1>
									<span class="blu">Welcome <br></span>To Our Sunglasses
								</h1>
								<figure>
									<img src="img/banner_img.png" alt="#" />
								</figure>
								<a class="read_more" href="#">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<div class="carousel-caption">
							<div class="text-bg">
								<h1>
									<span class="blu">Welcome <br></span>To Our Sunglasses
								</h1>
								<figure>
									<img src="img/banner_img.png" alt="#" />
								</figure>
								<a class="read_more" href="#">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="container">
						<div class="carousel-caption">
							<div class="text-bg">
								<h1>
									<span class="blu">Welcome <br></span>To Our Sunglasses
								</h1>
								<figure>
									<img src="img/banner_img.png" alt="#" />
								</figure>
								<a class="read_more" href="#">Shop Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#banner1" role="button"
				data-slide="prev"> <i class="fa fa-arrow-left"
				aria-hidden="true"></i>
			</a> <a class="carousel-control-next" href="#banner1" role="button"
				data-slide="next"> <i class="fa fa-arrow-right"
				aria-hidden="true"></i>
			</a>
		</div>
	</section>

	<div class="about">
		<div class="container">
			<div class="row d_flex">
				<div class="col-md-5">
					<div class="about_img">
						<figure>
							<img src="img/about_img.png" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-7">
					<div class="titlepage">
						<h2>About Our Shop</h2>
						<p>There are many variations of passages of Lorem Ipsum
							available, but the majority have suffered alteration in some
							form, by injected humour, or randomised words which don't look
							even slightly believable. If you are going to use a passage of
							Lorem Ipsum, you need to be sure there isn't anything
							embarrassing hidden in the middle of text.</p>
					</div>
					<a class="read_more" href="#">Read More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- about section -->
	<!-- Our  Glasses section -->
	<div class="glasses">
		<div class="container">
			<div class="row">
				<div class="col-md-10 offset-md-1">
					<div class="titlepage">
						<h2>Our Glasses</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labor e et dolore magna
							aliqua. Ut enim ad minim veniam, qui</p>
					</div>
				</div>
			</div>
		</div>
		
		<c:if test="${param.tukhoa == null}">
			<c:set var="tuKhoa" value=""></c:set>
		</c:if>
		<c:if test="${param.tukhoa != null}">
			<c:set var="tuKhoa" value="${(param.tukhoa)}"></c:set>
		</c:if>


		<div class="container-fluid">
			<div class="row">
				<c:forEach var="sanpham" items="${f:timKiemsp(tuKhoa)}">

					<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
						<div class="glasses_box">

							<figure>
								<img src=${sanpham.getHinh() } alt="#" />
							</figure>
							<h2 style="font-size: 20px;">${sanpham.getTensp()}</h2>
							<h2 style="color: red; font-weight: bold; font-size: 20px;">
								<fmt:formatNumber type="number" maxIntegerDigits="8"
									value="${sanpham.getGia()}" />
								<span style="color: red; font-weight: bold; font-size: 20px;">
									Đ</span>
							</h2>

							<a class="read_more" href="detail.jsp?id=${sanpham.getId() }">View</a>
						</div>
					</div>
				</c:forEach>
				<div class="col-md-12">
					<a class="read_more" href="glasses.jsp">Read More</a>
				</div>
			</div>
		</div>








	</div>

	<!-- Our shop section -->
	<div id="about" class="shop">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-5">
					<div class="shop_img">
						<figure>
							<img src="img/shop_img.png" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-7 padding_right0">
					<div class="max_width">
						<div class="titlepage">
							<h2>Best SunGlasses At Our shop</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
								aute irure dolor in reprehenderit in voluptate velit esse cillum
								dolore</p>
							<a class="read_more" href="">Shop Now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end Our shop section -->

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
								<input class="contactus" placeholder="Email" 
									name="Email">
							</div>
							<div class="col-md-12">
								<input class="contactusmess" placeholder="Subject" 
									name="Subject">
							</div>
							<div class="col-md-12">
								<input class="contactusmess" placeholder="Content" 
									name="Content">
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


	<%@include file="include/footer.jsp"%>
</body>
</html>