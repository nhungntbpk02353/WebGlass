<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<title>WEBSITE BÁN HÀNG</title>
<%@include file="include/head.jsp"%>
<style>
/* .detail {
	margin: 120px;
	color: #666666;
	font-size: 14px;
	font-family: 'Poppins', sans-serif;
	line-height: 1.80857;
	font-weight: normal;
	
}

.img-fluid mb-4 {
	width: 1500px;
}
 */



body {
  background-color: #F3F3F3;
}

.wrapper {
  height: 420px;
  width: 654px;
  margin: 50px auto;
  border-radius: 7px 7px 7px 7px;
  /* VIA CSS MATIC https://goo.gl/cIbnS */
  -webkit-box-shadow: 0px 14px 32px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 14px 32px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 14px 32px 0px rgba(0, 0, 0, 0.15);
}

.product-img {
  float: left;
  height: 420px;
  width: 327px;
}

.product-img img {
  border-radius: 7px 0 0 7px;
}

.product-info {
  float: left;
  height: 420px;
  width: 327px;
  border-radius: 0 7px 10px 7px;
  background-color: #ffffff;
}

.product-text {
  height: 300px;
  width: 327px;
}

.product-text h1 {
  margin: 0 0 0 38px;
  padding-top: 52px;
  font-size: 34px;
  color: #474747;
}

.product-text h1,
.product-price-btn p {
  font-family: 'Bentham', serif;
}

.product-text h2 {
  margin: 0 0 47px 38px;
  font-size: 13px;
  font-family: 'Raleway', sans-serif;
  font-weight: 400;
  text-transform: uppercase;
  color: #d2d2d2;
  letter-spacing: 0.2em;
}

.product-text p {
  height: 125px;
  margin: 0 0 0 38px;
  font-family: 'Playfair Display', serif;
  color: #8d8d8d;
  line-height: 1.7em;
  font-size: 15px;
  font-weight: lighter;
  overflow: hidden;
}

.product-price-btn {
  height: 103px;
  width: 327px;
  margin-top: 17px;
  position: relative;
}

.product-price-btn p {
  display: inline-block;
  position: absolute;
  top: -13px;
  height: 50px;
  font-family: 'Trocchi', serif;
  margin: 23px 0 0 30px;
  font-size: 28px;
  font-weight: lighter;
  color: #474747;
}

span {
  display: inline-block;
  height: 50px;
  font-family: 'Suranna', serif;
  font-size: 34px;
}

.product-price-btn button {
  float: right;
  display: inline-block;
  height: 50px;
  width: 176px;
  margin: 0 17px 0 16px;
  box-sizing: border-box;
  border: transparent;
  border-radius: 60px;
  font-family: 'Raleway', sans-serif;
  font-size: 14px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.2em;
  color: #F3F3F3;
  background-color: #9cebd5;
  cursor: pointer;
  outline: none;
}

.product-price-btn button:hover {
  background-color: #79b0a1;
}
</style>
</head>
<body>
	<div><%@include file="include/header.jsp"%>
	</div>


	<c:if test="${param.id == null}">
		<c:redirect url="index.jsp"></c:redirect>
	</c:if>


	<c:set var="sanpham" value="${f:findByIdsp(param.id)}"></c:set>
	
	
	
	<div class="wrapper">
    <div class="product-img">
      <img src="${sanpham.getHinh()}" style="margin-top: 100px " height="420" width="327">
    </div>
    <div class="product-info">
      <div class="product-text">
        <h1>${sanpham.getTensp()}</h1>
        <h2>by studio Sungla</h2>
        <p>${sanpham.getMotangan()}</p>
      </div>
      <div class="product-price-btn">
        <p style="color: red; font-weight: bold; font-size: 20px;"><fmt:formatNumber type="number" maxIntegerDigits="8"
						value="${sanpham.getGia()}" />
					<span style="color: red; font-weight: bold; font-size: 20px;"> Đ</span></p>
        <button type="button">buy now</button>
      </div>
    </div>
  </div>

	<%@include file="include/footer.jsp"%>
</body>
</html>