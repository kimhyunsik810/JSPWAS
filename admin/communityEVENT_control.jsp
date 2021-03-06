<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "jsp.annawa.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="cmtMng" class="jsp.annawa.CommunityManager"/> 
<jsp:useBean id="cmt" class="jsp.annawa.Community"/>
<jsp:setProperty name="cmt" property="*"/>

<% 
	String action = request.getParameter("action");
	
	if(action.equals("list")) {
		ArrayList<Community> posts = cmtMng.getPosts("EVENT");
		request.setAttribute("posts", posts);
		pageContext.forward("communityEVENT_list.jsp");
	}
	else if(action.equals("edit")) {
		Community c = cmtMng.getPost(cmt.getCmtId(), "EVENT");
		request.setAttribute("cmt", c);
		pageContext.forward("communityEVENT_edit.jsp");
	}
	else if (action.equals("update")) {
		if (cmtMng.adminUpdate(cmt, "EVENT")) {
			response.sendRedirect("communityEVENT_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	else if(action.equals("delete")) {
		if (cmtMng.delete(cmt.getCmtId(), "EVENT") != -1) {
			response.sendRedirect("communityEVENT_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>