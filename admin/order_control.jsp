<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "jsp.annawa.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="orderManager" class="jsp.annawa.OrderManager"/> 
<jsp:useBean id="order" class="jsp.annawa.Order"/>
<jsp:setProperty name="order" property="*"/>

<% 
	String action = request.getParameter("action");

	if (action.equals("list")) {
		ArrayList<Order> orders = orderManager.getOrders();
		request.setAttribute("orders", orders);
		pageContext.forward("order_list.jsp");
	}
	else if (action.equals("insert")) {
		if (orderManager.insertOrder(order)) 
			response.sendRedirect("../index.jsp");
		else
			throw new Exception("DB 입력오류");
	}
	else if (action.equals("edit")) {
		Order o = orderManager.getOrder(order.getNo());

		request.setAttribute("order", o);
		pageContext.forward("order_edit.jsp");
	}
	else if (action.equals("update")) {
		if (orderManager.updateOrder(order)) {
			response.sendRedirect("order_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	else if (action.equals("delete")) {
		if (orderManager.deleteOrder(order.getNo())) {
			response.sendRedirect("order_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>