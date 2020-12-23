<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String query = (String) request.getParameter("query");
	response.sendRedirect("../index.jsp?CONTENTPAGE=content_search.jsp?query=" + query);
%>