
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<style>
</style>
</head>
<body>


	<!-- header inner -->
	<div style="padding: 6px 25px;" class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
					<div class="full">
						<div class="center-desk">
							<div class="logo">
								<a href="index.jsp"><img src="img/logo.png" alt="#" /></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
					<nav class="navigation navbar navbar-expand-md navbar-dark ">
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarsExample04"
							aria-controls="navbarsExample04" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>


						<form style="width: 400px; border: none;" class="card" action=""
							method="get">
							<div class="card-body row no-gutters align-items-center">

								<!--end of col-->
								<div class="col">
									<input
										class="form-control form-control-lg form-control-borderless"
										type="search" placeholder="Search " name="tukhoa">
								</div>
								<!--end of col-->
								<div class="col-auto">
									<button
										style="width: auto; border: none; font-size: 20px; margin-left: 10px"
										class="btn btn-lg " type="submit">
										<i class="fas fa-search h4 text-body"></i>
									</button>
								</div>
								<!--end of col-->
							</div>
						</form>
						<!-- <form class="timKiem" action="" method="get">
							<div style="width: 500px; margin-bottom: 20px; margin-left: 20px"
								class="input-group rounded">
								<input type="text" placeholder="Search" name="tukhoa" /> <input
									type="submit" value="tìm kiếm">

							</div>

						</form> -->
						
						<div class="collapse navbar-collapse" id="navbarsExample04">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item "><a class="nav-link" href="index.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="glasses.jsp">
										Glasses</a></li>
								<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
								</a></li>

								<!--                               <li class="nav-item d_none login_btn"> -->
								<!--                                  <a class="nav-link" href="login.jsp">Login</a> -->
								<!--                               </li> -->

								<!--                               <li class="nav-item d_none sea_icon"> -->
								<!--                                  <a class="nav-link" href="#"><i class="fa fa-shopping-bag" aria-hidden="true"></i><i class="fa fa-search" aria-hidden="true"></i></a> -->
								<!--                               </li> -->

								<c:choose>
									<c:when test="${userlogin != 'true' }">
										<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
										</li>
										<!-- <li class="nav-item d_none"><a class="nav-link"
									href="register.jsp">Register</a></li> -->
									</c:when>
									
									<c:otherwise>
									
										<li class="nav-item">
											<a class="nav-link"
											href="homeAdmin.jsp">${username}
											</a>
										</li>
										<%-- 										<li class="tm-nav-li"><a href="#" class="tm-nav-link">${username}</a></li> --%>
										<li class="nav-item"><a class="nav-link"
											href="logout.jsp">Logout</a></li>
										<!-- 										<li class="tm-nav-li"><a href="logout.jsp" -->
										<!-- 											class="tm-nav-link">Logout</a></li> -->
									</c:otherwise>
								</c:choose>


							</ul>
						</div>

					</nav>
				</div>
			</div>
		</div>
	</div>


	<script src="https://kit.fontawesome.com/af4b63cb01.js"
		crossorigin="anonymous"></script>
</body>