<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글 관리 페이지</title>
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
				<h1>게시글 관리 페이지</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="communityNOTICE_control.jsp?action=list" role="button">
					공지사항 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="communityEVENT_control.jsp?action=list" role="button">
					이벤트 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-2">
				<a class="btn btn-default" href="communityALL_control.jsp?action=list" role="button">
					커뮤니티 관리 &raquo;
				</a>
			</div>
			<div class="col-lg-3"></div>
		</div>
		<div class="col-lg-12">
				<h5>[<a href="index.jsp">관리자 페이지로</a>]</h5>
			</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>