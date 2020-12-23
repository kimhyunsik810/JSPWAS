<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="product" scope="request" class="jsp.annawa.Product" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>상품정보 수정</title>
</head>
<body>
	<div align="center">
		<H2>상품정보 수정</H2>
		[<a href=product_control.jsp?action=list>상품 목록으로</a>]
		<HR>
		<p>
		<form name="form1" method="post" action="product_control.jsp?action=update" enctype="multipart/form-data">
			<input type=hidden name="no" value="<%=product.getNo()%>"> 

			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=product.getName()%>" size=30 required></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" value="<%=product.getPrice()%>" size=30 required></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="image" value="<%=product.getImage()%>"></td>
				</tr>
				<tr>
					<th>정보</th>
					<td><textarea rows="20" cols="30" name="info" required><%=product.getInfo()%></textarea></td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<select name="status">
						<%
							if (product.getStatus().equals("새 상품")) {
								out.println("<option value='새 상품' selected>새 상품</option>");
								out.println("<option value='중고'>중고</option>");
							} else {
								out.println("<option value='새 상품'>새 상품</option>");
								out.println("<option value='중고' selected>중고</option>");
							}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
						<input type="number" name="amount" value="<%=product.getAmount()%>" min="0" max="100" step="1" required >
					</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>
						<select name="type">
						<%
							if (product.getType().equals("CPU")) {
								out.println("<option value='CPU' selected>CPU</option>");
								out.println("<option value='GPU'>GPU</option>");
								out.println("<option value='RAM'>RAM</option>");
							} else if (product.getType().equals("GPU")) {
								out.println("<option value='CPU'>CPU</option>");
								out.println("<option value='GPU' selected>GPU</option>");
								out.println("<option value='RAM'>RAM</option>");
							} else {
								out.println("<option value='CPU'>CPU</option>");
								out.println("<option value='GPU'>GPU</option>");
								out.println("<option value='RAM' selected>RAM</option>");
							}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
						<input type="date" name="date" value="<%= product.getDate() %>">
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="submit" value="저장">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>