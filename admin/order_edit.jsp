<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="order" scope="request" class="jsp.annawa.Order" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>주문정보 수정</title>
</head>
<body>
	<div align="center">
		<H2>주문정보 수정</H2>
		[<a href=order_control.jsp?action=list>주문 목록으로</a>]
		<HR>
		<p>
		<form name=form1 method=post action=order_control.jsp>
			<input type=hidden name="no" value="<%=order.getNo()%>"> 
			<input type=hidden name="action" value="update">

			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custom_no" value="<%=order.getCustom_no()%>"></td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td><input type="text" name="product_no" value="<%=order.getProduct_no()%>"></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="amount" value="<%=order.getAmount()%>"></td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<select name="status">
						<%
							if (order.getStatus().equals("결제 대기")) {
								out.println("<option value='결제 대기' selected>결제 대기</option>");
								out.println("<option value='결제 완료'>결제 완료</option>");
								out.println("<option value='배송 대기'>배송 대기</option>");
								out.println("<option value='배송 완료'>배송 완료</option>");
							} else if (order.getStatus().equals("결제 완료")) {
								out.println("<option value='결제 대기'>결제 대기</option>");
								out.println("<option value='결제 완료' selected>결제 완료</option>");
								out.println("<option value='배송 대기'>배송 대기</option>");
								out.println("<option value='배송 완료'>배송 완료</option>");
							} else if (order.getStatus().equals("배송 대기")) {
								out.println("<option value='결제 대기'>결제 대기</option>");
								out.println("<option value='결제 완료'>결제 완료</option>");
								out.println("<option value='배송 대기' selected>배송 대기</option>");
								out.println("<option value='배송 완료'>배송 완료</option>");
							} else {
								out.println("<option value='결제 대기'>결제 대기</option>");
								out.println("<option value='결제 완료'>결제 완료</option>");
								out.println("<option value='배송 대기'>배송 대기</option>");
								out.println("<option value='배송 완료' selected>배송 완료</option>");
							}
						%>
						</select>
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