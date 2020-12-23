<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<jsp:useBean id="cartManager" class="jsp.annawa.CartManager" scope="session" />

<%
	DecimalFormat fmt = new DecimalFormat("###,###");
	if (session.getAttribute("memberID") == null) {
		out.println("<script>location.href='login.jsp'</script>");
	}
	Hashtable hCart = cartManager.getCartList();
	int totalPrice = 0;
%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">장바구니</h2>
			<% if (hCart.size() == 0) { %>
			<div class="text-center">장바구니가 비어있습니다.</div>	
			<% } else { %>
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred">
					<thead>
						<th>제품</th>
						<th>수량</th>
						<th>가격</th>
						<th>수정</th>
						<th>삭제</th>
					</thead>
					<tbody>
						<%
							Enumeration hCartKey = hCart.keys();
							while (hCartKey.hasMoreElements()) {
								Order order = (Order) hCart.get(hCartKey.nextElement());
								Product product = productManager.getProduct(order.getProduct_no());

								// parseInt때문에 콤마 제거
								int price = Integer.parseInt(product.getPrice().replace(",", ""));
								int amount = order.getAmount();
								int subTotal = price * amount;
								totalPrice += price * amount;
						%>
						<tr>
							<td><a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%=product.getNo()%>"><%=product.getName()%></a></td>
							<form method="post" action="module/cartProcess.jsp?action=update">
							<td><input type="number" name="amount" value="<%=order.getAmount()%>" min="1" max="<%=product.getAmount()%>" step="1">개</td>
							<td><%=fmt.format(subTotal)%>원</td>
							<td>
								<input type="hidden" name="product_no" value="<%=product.getNo()%>">
								<input type="submit" class="btn btn-primary btn-xs" value="수정">
							</td>
							</form>
							<form method="post" action="module/cartProcess.jsp?action=delete">
							<td>
								<input type="hidden" name="product_no" value="<%=product.getNo()%>">
								<input type="submit" class="btn btn-danger btn-xs" value="삭제">
							</td>
							</form>
						</tr>
				<%	}  %>
					<tr> 
						<td colspan="5" align="right">총 금액 : <%=fmt.format(totalPrice)%>원</td>
					</tr>
					<tr>
						<td colspan="5" align="right"><a href="module/orderProcess.jsp">주문하기</a></td>
					</tr>
					</tbody>
				</table>
			<div class="clearfix"></div>
			</div>
			<%	} %>
		</div>
	</div>
</div>