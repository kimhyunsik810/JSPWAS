<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="cmt" scope="request" class="jsp.annawa.Community" />

<%
	String pageType = null;
	if(request.getParameter("pageType") != null) {
		pageType = request.getParameter("pageType");
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
<title>게시글 작성</title>
</head>
<body>
	<div align="center">
		<H2>게시글 작성</H2>
		<%
			if(pageType.equals("NOTICE")) {
		%>
			[<a href=communityNOTICE_control.jsp?action=list>공지사항 목록으로</a>]
		<%
			}
			if(pageType.equals("EVENT")) {
		%>
			[<a href=communityEVENT_control.jsp?action=list>이벤트 목록으로</a>]
		<%
			}
		%>
		<hr>
		<p>
		<form method="post" action="community_write_action.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #DDDDDD;">
				<thead>
					<tr>
						<th colspan="2"
							style="text-align: center; background-color: #EEEEEE">게시글 작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input class="form-control" type="text" placeholder="게시글 제목" name="cmtTitle" maxlength="50">
						</td>
						<td>
						<select class="form-control" name="cmtType">
							<%
								if(pageType.equals("NOTICE")) {
							%>
							<option value="공지사항">공지사항</option>
							<%
								}
								if(pageType.equals("EVENT")) {
							%>
							<option value="이벤트">이벤트</option>
							<%
								}
							%>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" placeholder="게시글 내용" name="cmtContent" maxlength="2048" style="min-height: 350px; resize: none"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input class="btn btn-primary pull-right" type="submit" value="저장">
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>