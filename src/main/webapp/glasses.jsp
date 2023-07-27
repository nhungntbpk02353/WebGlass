<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEBSITE BÁN HÀNG</title>
<%@include file="include/head.jsp"%>
<style>
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

<c:if test="${param.tukhoa == null}">
	    <c:set var="tuKhoa" value=""></c:set>
	</c:if>
	<c:if test="${param.tukhoa != null}">
	    <c:set var="tuKhoa" value="${(param.tukhoa)}"></c:set>
	</c:if>

	<%@include file="include/header.jsp"%>
	<br>
	
	   <div class="glasses">
         <!-- <div class="container">
            <div class="row">
               <div class="col-md-10 offset-md-1">
                  <div class="titlepage">
                     <h2>Our Glasses</h2>
                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor
                        e et dolore magna aliqua. Ut enim ad minim veniam, qui
                     </p>
                  </div>
               </div>
            </div>
         </div> -->
         
         <c:set var="soluong" value="4"></c:set>
		<c:choose>

			<c:when test="${param.vitri == null}">
				<c:set var="vitri" value="0"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="vitri" value="${(param.vitri - 1)*soluong}"></c:set>
			</c:otherwise>
		</c:choose>
		<div class="container-fluid">
			<div class="row">
			
				<c:forEach var="sanpham"
					items="${f:getAllSanPhamPhanTrang(vitri, soluong)}">
					<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
						<div class="glasses_box">

							<figure>
								<img src=${sanpham.getHinh() } alt="#" />
							</figure>
							
							<h2 style=" font-size: 20px;" >${sanpham.getTensp()}</h2>
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
				
				
			</div>
		</div>
		<c:set var="tong" value="${f:demSanPham()}"></c:set>
		
		<c:choose>
			<c:when test="${tong%soluong!=0 }">
				<c:set var="sotrang" value="${tong/soluong + 1}"></c:set>

			</c:when>
			<c:otherwise>
				<c:set var="sotrang" value="${tong/soluong}"></c:set>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="1" end="${sotrang}" step="1">
		
		<div class="pagination">
			<a  href="glasses.jsp?vitri=${i }">${i }</a>
		</div>
		
		
		</c:forEach>
         
         
      </div>
      
<br>
	<%@include file="include/footer.jsp"%>


</body>
</html>