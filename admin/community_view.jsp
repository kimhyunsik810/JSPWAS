<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="cmt" scope="request" class="jsp.annawa.Community" />
<jsp:useBean id="cmtMng" class="jsp.annawa.CommunityManager"/>

<%
	String pageType = null;
	if (request.getParameter("pageType") != null) {
		pageType = request.getParameter("pageType");
	}
	
	String[] pageSplit = pageType.split("-");
	String type = pageSplit[0];
	int cmtId = Integer.parseInt(pageSplit[1]);
	
	if (cmtId == 0) {
		out.println("<script>");
		out.println("alert('유효하지 않은 게시글입니다.')");
		out.println("location.href='index.jsp?CONTENTPAGE=content_community.jsp");
		out.println("</script>");
	}
	
	cmt = cmtMng.getCmt(cmtId, type);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글</title>
</head>
<body>
	<div align="center">
		<H2>게시글</H2>
		<hr>
		<p>
		<table class="table table-striped" style="text-align: center; border: 1px solid #DDDDDD;">
			<thead>
				<tr>
					<th colspan="6" style="text-align: center; background-color: #E9E9E9;">게시글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 5%; background-color: #EEEEEE;">No.</td>
					<td style="width: 15%; background-color: #FFFFFF;"><%= cmt.getCmtId() %></td>
					<td style="width: 10%; background-color: #EEEEEE;">제목</td>
					<td colspan="3" style="width: 65%; background-color: #FFFFFF;">
					<%= cmt.getCmtTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
				<tr>
					<td style="width: 5%; background-color: #EEEEEE;">구분</td>
					<td style="width: 15%; background-color: #FFFFFF;"><%= cmt.getCmtType() %></td>
					<td style="width: 10%; background-color: #EEEEEE;">작성자</td>
					<td style="width: 20%; background-color: #FFFFFF;"><%= cmt.getCmtUser() %></td>
					<td style="width: 10%; background-color: #EEEEEE;">작성일</td>
					<td style="width: 20%; background-color: #FFFFFF;"><%= cmt.getCmtDate().substring(0, 4) + "." +
																		   cmt.getCmtDate().substring(5, 7) + "." +
																		   cmt.getCmtDate().substring(8, 10) + " " +
																		   cmt.getCmtDate().substring(11, 13) + ":" +
																		   cmt.getCmtDate().substring(14, 16) %></td>
				</tr>
				<tr>
					<td style="width: 5%; min-height: 350px; background-color: #EEEEEE;">내용</td>
					<td colspan="5" style="text-align: left; width: 95%; height: 350px; background-color: #FFFFFF;">
					<%= cmt.getCmtContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-primary"
		<%
			if(type.equals("NOTICE")) {
		%>
				href="communityNOTICE_control.jsp?action=list"
		<%
			}
			else if(type.equals("EVENT")) {
		%>
				href="communityEVENT_control.jsp?action=list"
		<%
			}
			else {
		%>
				href="communityALL_control.jsp?action=list"
		<%
			}
		%>>목록</a>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>