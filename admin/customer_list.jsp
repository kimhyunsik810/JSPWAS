<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="customers" scope="request" class="java.util.ArrayList" />

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>회원 목록</title>
</head>
<body>
	<div align="center">
		<H2>회원 목록</H2>
		[<a href="index.jsp">관리자 페이지로</a>]
		<HR>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">
							<thead>
								<th>고객 번호</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이름</th>
								<th>닉네임</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>주소</th>
								<th>수정</th>
								<th>삭제</th>
							</thead>
							<tbody>
							<%
							for (Customer c : (ArrayList<Customer>) customers) {
							%>
							<tr>
								<td><%=c.getCustom_no()%></td>
								<td><%=c.getCustom_id()%></td>
								<td><%=c.getCustom_pw()%></td>
								<td><%=c.getCustom_name()%></td>
								<td><%=c.getCustom_nickname()%></td>
								<td><%=c.getCustom_phone()%></td>
								<td><%=c.getCustom_email()%></td>
								<td><%=c.getCustom_address()%></td>
								<td><p data-placement="top" data-toggle="tooltip" title="Edit">
										<a href="customer_control.jsp?action=edit&custom_no=<%=c.getCustom_no()%>">
										<button class="btn btn-primary btn-xs">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										</a>
									</p>
								</td>
								<td><p data-placement="top" data-toggle="tooltip" title="Delete">
										<a href="customer_control.jsp?action=delete&custom_no=<%=c.getCustom_no()%>">
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