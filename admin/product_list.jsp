<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="products" scope="request" class="java.util.ArrayList" />

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>상품 목록</title>
<style type="text/css">
img {
	width: 100px;
}
</style>
</head>
<body>
	<div align="center">
		<H2>상품 목록</H2>
		[<a href="index.jsp">관리자 페이지로</a>]
		[<a href=product_insert.jsp>상품 추가</a>]
		<HR>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">
							<thead>
								<th>상품 번호</th>
								<th>조회 수</th>
								<th>이름</th>
								<th>가격</th>
								<th>이미지</th>
								<th>정보</th>
								<th>상태</th>
								<th>수량</th>
								<th>종류</th>
								<th>등록일</th>
								<th>수정</th>
								<th>삭제</th>
							</thead>
							<tbody>
							<%
								for (Product p : (ArrayList<Product>) products) {
							%>
							<tr>
								<td><%=p.getNo()%></td>
								<td><%=p.getViewCount()%></td>
								<td>
									<a href="../index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= p.getNo() %>"><%=p.getName()%></a>
								</td>
								<td><%=p.getPrice()%>원</td>
								<td><img src=<%="../img/" + p.getImage()%>></td>
								<td><%=p.getInfo()%></td>
								<td><%=p.getStatus()%></td>
								<td><%=p.getAmount()%></td>
								<td><%=p.getType()%></td>
								<td><%=p.getDate()%></td>
								<td><p data-placement="top" data-toggle="tooltip" title="Edit">
										<a href="product_control.jsp?action=edit&no=<%=p.getNo()%>">
										<button class="btn btn-primary btn-xs">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										</a>
									</p>
								</td>
								<td><p data-placement="top" data-toggle="tooltip" title="Delete">
										<a href="product_control.jsp?action=delete&no=<%=p.getNo()%>">
										<button class="btn btn-danger btn-xs">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
										</a>
									</p>
								</td>
							</tr>
							<%
								}
							%>
							</tbody>
						</table>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>