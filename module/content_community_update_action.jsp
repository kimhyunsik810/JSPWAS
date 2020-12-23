<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF8"); %>

<jsp:useBean id="cmt" class="jsp.annawa.Community" />
<jsp:setProperty name="cmt" property="*" />

<%
	int cmtId = 0;
	if (request.getParameter("pageNumber") != null) {
		cmtId = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	if((cmt.getCmtTitle() == null) || (cmt.getCmtContent() == null)) {
		out.println("<script>");
		out.println("alert('입력이 안 된 항목이 있습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	else {
		CommunityManager cmtMng = new CommunityManager();
		int result = cmtMng.update(cmtId, cmt.getCmtType(), cmt.getCmtTitle(), cmt.getCmtContent());
		
		if(result == -1) {
			out.println("<script>");
			out.println("alert('저장에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		else {
			response.sendRedirect("../index.jsp?CONTENTPAGE=content_community.jsp");
			//out.println("<script>");
			//out.println("location.href='index.jsp?CONTENTPAGE=community.jsp'");
			//out.println("</script>");
		}
	}
%>