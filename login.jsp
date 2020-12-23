<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("memberID");
	String pw = (String)session.getAttribute("memberPW");
	String check = (String)session.getAttribute("memberSave");
	String idStr = null, pwStr = null, checkStr = null;
	
	if (check == null) {
		idStr = ""; pwStr = ""; checkStr = "";
	}
	else {
		idStr = id; pwStr = pw; checkStr = "checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/login.css?after">
<title>로그인 페이지</title>
</head>
<body>
	<div class="container">
		<form action="module/loginProcess.jsp" method="post" class="form-signin">
			<h2 class="form-signin-heading">로그인</h2>
			<input type="text" name="memberID" class="form-control" placeholder="아이디" required autofocus value=<%= idStr %>>
			<input type="password" name="memberPW" class="form-control" placeholder="비밀번호" required value=<%= pwStr %>>
			<div class="checkbox">
				<label><input type="checkbox" name="saveCheck" <%= checkStr %>>아이디 / 비밀번호 저장</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>