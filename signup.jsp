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
<link rel="stylesheet" type="text/css" href="css/signup.css?after">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="admin/customer_control.jsp" method="post" class="form-signin">
			<input type="hidden" name="action" value="insert">
			<h2 class="form-signin-heading">회원가입</h2>
			<input type="text" name="custom_id" class="form-control" placeholder="* 아이디" required autofocus>
			<input type="password" name="custom_pw" class="form-control" placeholder="* 비밀번호" required>
			<input type="password" class="form-control" placeholder="* 비밀번호 확인" required>
			<input type="text" name="custom_name" class="form-control" placeholder="* 이름" required>
			<input type="text" name="custom_nickname" class="form-control" placeholder="* 닉네임" required>
			<input type="text" name="custom_phone" class="form-control" placeholder="* 전화번호" required>
			<input type="text" name="custom_email" class="form-control" placeholder="* 이메일" required>
			<input type="text" name="custom_address" class="form-control" placeholder="* 주소" required>
			<div class="checkbox">
				<label><input type="checkbox" name="agree"><a href="#">이용 약관</a>에 동의합니다.</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">회원가입</button>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>