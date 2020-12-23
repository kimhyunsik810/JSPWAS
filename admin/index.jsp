<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% 
	if (session.getAttribute("adminLogin") == null) {
		response.sendRedirect("login.jsp");
	}
%>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>관리자 페이지</title>
<style>
.col-lg-12 {
	margin-top: 150px;
	margin-bottom: 100px;
	text-align: center;

}
.col-lg-2 {
	margin-bottom: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>관리자 페이지</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="customer_control.jsp?action=list" role="button">
					회원 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="product_control.jsp?action=list" role="button">
					상품 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="order_control.jsp?action=list" role="button">
					주문 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="community.jsp?action=list" role="button">
					게시글 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>