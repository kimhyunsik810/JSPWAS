<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="customer" scope="request" class="jsp.annawa.Customer" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원정보 수정</title>
</head>
<body>
	<div align="center">
		<H2>회원정보 수정</H2>
		[<a href=customer_control.jsp?action=list>회원 목록으로</a>]
		<HR>
		<p>
		<form name=form1 method=post action=customer_control.jsp>
			<input type=hidden name="custom_no" value="<%=customer.getCustom_no()%>"> 
			<input type=hidden name="action" value="update">

			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="custom_id" value="<%=customer.getCustom_id()%>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="custom_pw" value=""></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="custom_name" value="<%=customer.getCustom_name()%>"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="custom_nickname" value="<%=customer.getCustom_nickname()%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="custom_phone" value="<%=customer.getCustom_phone()%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="custom_email" value="<%=customer.getCustom_email()%>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="custom_address" value="<%=customer.getCustom_address()%>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type=submit value="저장">
						<input type=reset value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>