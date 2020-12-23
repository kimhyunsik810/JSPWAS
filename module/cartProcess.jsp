<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="customerManager" class="jsp.annawa.CustomerManager" />
<jsp:useBean id="cartManager" class="jsp.annawa.CartManager" scope="session"/>
<jsp:useBean id="order" class="jsp.annawa.Order" />
<jsp:setProperty name="order" property="*" />

<%
	String action = request.getParameter("action");
	String id = (String)session.getAttribute("memberID");
	
	if (id == null) {
		response.sendRedirect("../login.jsp");
	} else {
		Customer customer = customerManager.getCustomerById(id);
		if (action.equals("insert")) {
			order.setCustom_no(customer.getCustom_no());
			cartManager.addCart(order);
			out.println("<script>alert('장바구니에 추가했습니다.');history.go(-1);</script>");
		} else if (action.equals("update")) {
			order.setCustom_no(customer.getCustom_no());
			cartManager.updateCart(order);
			response.sendRedirect("../index.jsp?CONTENTPAGE=content_cart.jsp");
		} else if (action.equals("delete")) {
			cartManager.deleteCart(order);
			response.sendRedirect("../index.jsp?CONTENTPAGE=content_cart.jsp");
		}
	}
%>