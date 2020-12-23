<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="cmt" scope="request" class="jsp.annawa.Community" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글 수정</title>
</head>
<body>
	<div align="center">
		<H2>게시글 수정</H2>
		[<a href=communityALL_control.jsp?action=list>게시글 목록으로</a>]
		<hr>
		<p>
		<form name=form1 method=post action=communityALL_control.jsp>
			<input type=hidden name="cmtId" value="<%= cmt.getCmtId() %>"> 
			<input type=hidden name="action" value="update">

			<table class="table table-striped" style="text-align: center; border: 1px solid #DDDDDD;">
			<thead>
					<tr>
						<th colspan="8"
							style="text-align: center; background-color: #E9E9E9">게시글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 5%; background-color: #EEEEEE;">No.</td>
						<td style="witdh: 5%"><%= cmt.getCmtId() %></td>
						<td style="width: 10%; background-color: #EEEEEE;">구분</td>
						<td style="width: 10%; background-color: #FFFFFF;">
						<select class="form-control" name="cmtType">
							<option value="AS문의" <% if(cmt.getCmtType().equals("AS문의")) { %> selected <% } %> >AS문의</option>
							<option value="상품문의" <% if(cmt.getCmtType().equals("상품문의")) { %> selected <% } %> >상품문의</option>
							<option value="견적문의" <% if(cmt.getCmtType().equals("견적문의")) { %> selected <% } %> >견적문의</option>
							<option value="기타사항" <% if(cmt.getCmtType().equals("기타사항")) { %> selected <% } %> >기타사항</option>
						</select>
						</td>
						<td style="width: 10%; background-color: #EEEEEE;">상태</td>
						<td style="width: 10%; background-color: #FFFFFF;">
							<select class="form-control" name="cmtAvailable">
								<option value="1" <% if(cmt.getCmtAvailable() == 1) { %> selected <% } %> >표시</option>
								<option value="0" <% if(cmt.getCmtAvailable() == 0) { %> selected <% } %> >제거</option>
							</select>
						</td>
						<td style="width: 10%; background-color: #EEEEEE;">제목</td>
						<td style="width: 40%; background-color: #FFFFFF;">
							<input class="form-control" type="text" placeholder="게시글 제목" name="cmtTitle" maxlength="50" value="<%= cmt.getCmtTitle() %>">
						</td>
					</tr>
					<tr>
						<td colspan="8"><textarea class="form-control" placeholder="게시글 내용" name="cmtContent" maxlength="2048" style="min-height: 350px; resize: none;"><%= cmt.getCmtContent() %></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			
			<input class="btn btn-primary pull-right" type="submit" value="저장">
			<input class="btn btn-primary pull-right" type="reset" value="취소">
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>