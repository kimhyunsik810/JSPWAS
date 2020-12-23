<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF8"); %>
<jsp:useBean id="cmtMng" class="jsp.annawa.CommunityManager"/>

<%
	String userId = null;
	if(session.getAttribute("memberID") != null) {
		userId = (String)session.getAttribute("memberID");
	}
	
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
		<%
			if(userId != null && userId.equals(cmt.getCmtUser())) {
		%>
		<a class="btn btn-primary" onclick="return confirm('게시글을 수정하시겠습니까?')"
		   href="index.jsp?CONTENTPAGE=content_community_update.jsp?pageType=<%= "ALL" %>-<%= cmt.getCmtId() %>">수정</a>
		<a class="btn btn-primary" onclick="return confirm('게시글을 삭제하시겠습니까?')"
		   href="index.jsp?CONTENTPAGE=content_community_delete_action.jsp?pageType=<%= "ALL" %>-<%= cmt.getCmtId() %>">삭제</a>
		<%
			}
		%>
		<a class="btn btn-primary"
		<%
			if(cmt.getCmtType().equals("공지사항")) {
		%>
				href="index.jsp?CONTENTPAGE=content_community_notice.jsp"
		<%
			}
			else if(cmt.getCmtType().equals("이벤트")) {
		%>
				href="index.jsp?CONTENTPAGE=content_community_event.jsp"
		<%
			}
			else {
		%>
				href="index.jsp?CONTENTPAGE=content_community.jsp"
		<%
			}
		%>>목록</a>
	</div>
</div>