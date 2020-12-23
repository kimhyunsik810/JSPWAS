<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<jsp:useBean id="customerManager" class="jsp.annawa.CustomerManager"/>
<%
	String id = request.getParameter("memberID");
	String pw = Security.encryptSHA256(request.getParameter("memberPW"));
	Customer c = customerManager.getCustomerById(id);
	
	if (id.equals(c.getCustom_id()) && pw.equals(c.getCustom_pw())) {
		session.setAttribute("memberLogin", "ok");
		
		if (request.getParameter("saveCheck") == null) {
			session.removeAttribute("memberSave");
		} else {
			session.setAttribute("memberSave", "check");
		}
		
		session.setAttribute("memberID", id);
		session.setAttribute("memberPW", pw);
		
		response.sendRedirect("../index.jsp");
	} else {
		out.println("<script>alert('아이디 혹은 비밀번호가 틀렸거나 없는 회원입니다.');history.go(-1);</script>");
	}
%>