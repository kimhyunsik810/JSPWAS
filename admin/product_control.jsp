<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "jsp.annawa.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager"/> 
<jsp:useBean id="product" class="jsp.annawa.Product"/>
<jsp:setProperty name="product" property="*"/>

<% 
	String action = request.getParameter("action");

	if (action.equals("list")) {
		ArrayList<Product> products = productManager.getProducts(GetType.ALL);
		request.setAttribute("products", products);
		pageContext.forward("product_list.jsp");
	}
	else if (action.equals("insert")) {
		if (productManager.insertProduct(request)) 
			response.sendRedirect("product_control.jsp?action=list");
		else
			throw new Exception("DB 입력오류");
	}
	else if(action.equals("edit")) {
		Product p = productManager.getProduct(product.getNo());

		request.setAttribute("product", p);
		pageContext.forward("product_edit.jsp");
	}
	else if (action.equals("update")) {
		if (productManager.updateProduct(request)) {
			response.sendRedirect("product_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	else if (action.equals("delete")) {
		if (productManager.deleteProduct(product.getNo())) {
			response.sendRedirect("product_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>