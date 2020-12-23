<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<jsp:useBean id="estimateManager" class="jsp.annawa.EstimateManager" scope="session" />
<jsp:useBean id="order" class="jsp.annawa.Order" />
<jsp:setProperty name="order" property="*" />

<%
	String action = request.getParameter("action");
	String type = request.getParameter("type");
	
	if (action.equals("insert")) {
		estimateManager.addTable(order);
		response.sendRedirect("../index.jsp?CONTENTPAGE=content_estimate.jsp?type="+type);
	} else if (action.equals("update")) {
		estimateManager.updateTable(order);
		response.sendRedirect("../index.jsp?CONTENTPAGE=content_estimate.jsp?type="+type);
	} else if (action.equals("delete")) {
		estimateManager.deleteTable(order);
		response.sendRedirect("../index.jsp?CONTENTPAGE=content_estimate.jsp?type="+type);
	}
%>