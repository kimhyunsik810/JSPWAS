<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<jsp:useBean id="cartManager" class="jsp.annawa.CartManager" scope="session" />
<jsp:useBean id="orderManager" class="jsp.annawa.OrderManager" />

<%
	Hashtable hCart = cartManager.getCartList();
	Enumeration hCartKey = hCart.keys();
	if (hCart.size() != 0) {
		while (hCartKey.hasMoreElements()) {
			Order order = (Order) hCart.get(hCartKey.nextElement());
			order.setStatus("결제 대기");
			orderManager.insertOrder(order);
			productManager.reduceProduct(order);
			cartManager.deleteCart(order);
	}
%>
<script>
	alert("주문처리 하였습니다");
	location.href = "../index.jsp?CONTENTPAGE=content_cart.jsp";
</script>
<%
	} else {
%>
<script>
	alert("장바구니가 비어있습니다.");
	location.href = "../index.jsp?CONTENTPAGE=content_cart.jsp";
</script>
<%
	}
%>

