<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF8"); %>

<jsp:useBean id="cmt" class="jsp.annawa.Community" />
<jsp:setProperty name="cmt" property="*" />

<%
	String cmtType = null;
	if(request.getParameter("cmtType") != null) {
		cmtType = request.getParameter("cmtType");
	}

	if((cmt.getCmtTitle() == null) || (cmt.getCmtContent() == null)) {
		out.println("<script>");
		out.println("alert('입력이 안 된 항목이 있습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	else {
		CommunityManager cmtMng = new CommunityManager();
		int result = 0;
		
		if(cmtType.equals("공지사항")) {
			cmtMng.write(cmt.getCmtType(), cmt.getCmtTitle(), "관리자", cmt.getCmtContent(), "NOTICE");
		}
		if(cmtType.equals("이벤트")) {
			cmtMng.write(cmt.getCmtType(), cmt.getCmtTitle(), "관리자", cmt.getCmtContent(), "EVENT");
		}
		
		if(result == -1) {
			out.println("</script>");
			out.println("alert('저장에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		else {
			if(cmtType.equals("공지사항")) {
				response.sendRedirect("communityNOTICE_control.jsp?action=list");
			}
			if(cmtType.equals("이벤트")) {
				response.sendRedirect("communityEVENT_control.jsp?action=list");
			}
			//out.println("<script>");
			//out.println("location.href='index.jsp?CONTENTPAGE=community.jsp'");
			//out.println("</script>");
		}
	}
%>