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
<title>상품 등록</title>
</head>
<body>
	<div align="center">
		<H2>상품 등록</H2>
		[<a href=product_control.jsp?action=list>상품 목록으로</a>]
		<HR>
		<p>
		<form name=form1 method=post action=product_control.jsp?action=insert enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" size=30 required></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" size=30 required></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="image"></td>
				</tr>
				<tr>
					<th>정보</th>
					<td><textarea rows="20" cols="30" name="info" required></textarea></td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<select name="status">
							<option value="새 상품">새 상품</option>
							<option value="중고">중고</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
						<input type="number" name="amount" value="0" min="0" max="100" step="1" required>
					</td>
				</tr>
				<tr>
					<th>종류</th>
					<td>
						<select name="type">
							<option value="CPU">CPU</option>
							<option value="RAM">GPU</option>
							<option value="RAM">RAM</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>
						<input type="date" name="date">
					</td>
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