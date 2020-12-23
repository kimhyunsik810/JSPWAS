<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="posts" scope="request" class="java.util.ArrayList" />

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>커뮤니티 목록</title>
</head>
<body>
	<div align="center">
		<H2>커뮤니티 목록</H2>
		[<a href="community.jsp">게시글 관리 페이지로</a>]
		<HR>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="table-responsive">
						<table id="mytable" class="table table-bordred table-striped">
							<thead>
								<th>번호</th>
								<th>구분</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>상태</th>
								<th>수정</th>
								<th>삭제</th>
							</thead>
							<tbody>
							<%
							for (Community c : (ArrayList<Community>) posts) {
							%>
							<tr>
								<td><%= c.getCmtId() %> </td>
								<td><%= c.getCmtType() %> </td>
								<td>
									<a href="community_view.jsp?pageType=ALL-<%=c.getCmtId()%>">
										<%= c.getCmtTitle() %>
									</a>
								</td>
								<td><%= c.getCmtUser() %> </td>
								<td><%= c.getCmtDate().substring(0, 4) + "." +
										c.getCmtDate().substring(5, 7) + "." +
										c.getCmtDate().substring(8, 10) + " " +
										c.getCmtDate().substring(11, 13) + ":" +
										c.getCmtDate().substring(14, 16) %> </td>
								<td>
									<%
										if(c.getCmtAvailable() == 1) {
									%>
									표시
									<%
										}
										else if(c.getCmtAvailable() == 0) {
									%>
									제거
									<%
										}
									%>
								</td>
								<td><p data-placement="top" data-toggle="tooltip" title="Edit">
										<a href="communityALL_control.jsp?action=edit&cmtId=<%= c.getCmtId() %>">
										<button class="btn btn-primary btn-xs">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										</a>
									</p>
								</td>
								<td><p data-placement="top" data-toggle="tooltip" title="Delete">
										<a href="communityALL_control.jsp?action=delete&cmtId=<%= c.getCmtId() %>">
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