<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF8"); %>

<jsp:useBean id="cmt" class="jsp.annawa.Community" />
<jsp:setProperty name="cmt" property="*" />

<%
	String userId = null;
	if(session.getAttribute("memberID") != null) {
		userId = (String)session.getAttribute("memberID");
	}
	
	if((cmt.getCmtTitle() == null) || (cmt.getCmtContent() == null)) {
		out.println("<script>");
		out.println("alert('입력이 안 된 항목이 있습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	else {
		CommunityManager cmtMng = new CommunityManager();
		int result = cmtMng.write(cmt.getCmtType(), cmt.getCmtTitle(), userId, cmt.getCmtContent(),"ALL");
		
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