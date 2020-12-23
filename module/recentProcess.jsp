<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="recentlySeeing" class="jsp.annawa.RecentlySeeing" scope="session" />
<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />

<%
	int no = Integer.parseInt(request.getParameter("no"));
	Product product = productManager.getProduct(no);
	recentlySeeing.deleteProduct(product);
	response.sendRedirect("../index.jsp?CONTENTPAGE=content_recent.jsp");
%>