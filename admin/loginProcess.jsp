<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<jsp:useBean id="adminManager" class="jsp.annawa.AdminManager"/>
<%
	String id = request.getParameter("adminID");
	String pw = request.getParameter("adminPW");
	Admin admin = adminManager.getAdmin(id);
	
	if (id.equals(admin.getId()) && pw.equals(admin.getPw())) {
		session.setAttribute("adminLogin", "ok");
		response.sendRedirect("index.jsp");
	} else {
		out.println("<script>alert('아이디 혹은 비밀번호가 틀렸거나 없는 관리자입니다.');history.go(-1);</script>");
	}
%>