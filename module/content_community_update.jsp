<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF8"); %>
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
	
	Community cmt = cmtMng.getCmt(cmtId, type);
%>

<div class="container">
	<div class="row">
		<form method="post" action="module/content_community_update_action.jsp?pageNumber=<%= cmtId %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #DDDDDD;">
				<thead>
					<tr>
						<th colspan="6"
							style="text-align: center; background-color: #E9E9E9">게시글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 5%; background-color: #EEEEEE;">No.</td>
						<td style="witdh: 15%"><%= cmt.getCmtId() %></td>
						<td style="width: 10%; background-color: #EEEEEE;">제목</td>
						<td style="width: 40%; background-color: #FFFFFF;">
							<input class="form-control" type="text" placeholder="게시글 제목" name="cmtTitle" maxlength="50" value="<%= cmt.getCmtTitle() %>">
						</td>
						<td style="width: 10%; background-color: #EEEEEE;">구분</td>
						<td style="width: 20%; background-color: #FFFFFF;">
						<select class="form-control" name="cmtType">
							<option value="AS문의" <% if(cmt.getCmtType().equals("AS문의")) { %> selected <% } %> >AS문의</option>
							<option value="상품문의" <% if(cmt.getCmtType().equals("상품문의")) { %> selected <% } %> >상품문의</option>
							<option value="견적문의" <% if(cmt.getCmtType().equals("견적문의")) { %> selected <% } %> >견적문의</option>
							<option value="기타사항" <% if(cmt.getCmtType().equals("기타사항")) { %> selected <% } %> >기타사항</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="6"><textarea class="form-control" placeholder="게시글 내용" name="cmtContent" maxlength="2048" style="min-height: 350px; resize: none;"><%= cmt.getCmtContent() %></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input class="btn btn-primary pull-right" type="submit" value="저장">
		</form>
	</div>
</div>