<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="customerManager" class="jsp.annawa.CustomerManager" />
<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<jsp:useBean id="orderManager" class="jsp.annawa.OrderManager" />

<%
	String custom_id = (String)session.getAttribute("memberID");
	
	if (custom_id == null) {
		out.println("<script>location.href='login.jsp'</script>");
	}
	
	int custom_no = customerManager.getCustomerById(custom_id).getCustom_no();
	ArrayList<Order> orders = orderManager.getOrdersByCustom_no(custom_no);
%>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">주문 조회</h2>
			<% if (orders.size() == 0) { %>
			<div class="text-center">주문 내역이 없습니다.</div>	
			<% } else { %>
			<div class="table-responsive">
				<table id="mytable" class="table table-bordred">
					<thead>
						<th>주문 번호</th>
						<th>상품명</th>
						<th>수량</th>
						<th>상태</th>
					</thead>
					<tbody>
						<% for (Order o : orders) {
							Product p = productManager.getProduct(o.getProduct_no());
						%>
						<tr>
							<td><%= o.getNo() %></td>
							<td>
							<a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= p.getNo() %>">
								<%= p.getName() %>
							</a>
							</td>
							<td><%= o.getAmount() %></td>
							<td><%= o.getStatus() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			<div class="clearfix"></div>
			</div>
			<%	} %>
		</div>
	</div>
</div>