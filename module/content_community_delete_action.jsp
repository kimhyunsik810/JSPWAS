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
	
	int result = cmtMng.delete(cmtId, type);
	
	if(result == -1) {
		out.println("<script>");
		out.println("alert('삭제에 실패했습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("location.replace('index.jsp?CONTENTPAGE=content_community.jsp')");
		out.println("</script>");
	}
%>