<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../css/login.css?after">
<title>관리자 페이지</title>
</head>
<body>
	<div class="container">
		<form action="loginProcess.jsp" method="post" class="form-signin">
			<h2 class="form-signin-heading">관리자 로그인</h2>
			<input type="text" name="adminID" class="form-control" placeholder="아이디" required autofocus>
			<input type="password" name="adminPW" class="form-control" placeholder="비밀번호" required >
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>