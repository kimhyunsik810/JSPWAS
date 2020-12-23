<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "jsp.annawa.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="customerManager" class="jsp.annawa.CustomerManager"/> 
<jsp:useBean id="customer" class="jsp.annawa.Customer"/>
<jsp:setProperty name="customer" property="*"/>

<% 
	String action = request.getParameter("action");

	if (action.equals("list")) {
		ArrayList<Customer> customers = customerManager.getCustomers();
		request.setAttribute("customers", customers);
		pageContext.forward("customer_list.jsp");
	}
	else if (action.equals("insert")) {
		if (customerManager.insertCustomer(customer)) 
			response.sendRedirect("../index.jsp");
		else
			throw new Exception("DB 입력오류");
	}
	else if(action.equals("edit")) {
		Customer c = customerManager.getCustomer(customer.getCustom_no());

		request.setAttribute("customer", c);
		pageContext.forward("customer_edit.jsp");
	}
	else if (action.equals("update")) {
		if (customerManager.updateCustomer(customer)) {
			response.sendRedirect("customer_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	else if (action.equals("update_user")) {
		if (customerManager.updateCustomer(customer)) {
			response.sendRedirect("../index.jsp?CONTENTPAGE=content_customer.jsp");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	else if (action.equals("delete")) {
		if (customerManager.deleteCustomer(customer.getCustom_no())) {
			response.sendRedirect("customer_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>