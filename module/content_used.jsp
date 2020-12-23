<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<% ArrayList<Product> products = productManager.getProducts(GetType.USED); %>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">중고 제품</h2>
			<% if (products.isEmpty()) { %>
			<div class="text-center">제품이 없습니다!</div>
			<% } else { %>
			<table class="table">
			<% 
				for (Product p : (ArrayList<Product>) products) { 
					if (p.getStatus().equals("중고")) {
			%>
				<tr>
					<td class="col-sm-10 col-md-8">
						<div class="media">
							<a class="pull-left" href="#">
								<img src="<%= "img/" + p.getImage() %>" style="width: 160px">
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									<a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= p.getNo() %>"><%= p.getName() + " (중고)" %></a>
								</h4>
								<h5 class="media-heading">
									<%= p.getInfo() %>
								</h5>
								<span>재고 상태: </span>
								<% 
									if (p.getAmount() > 0)
										out.println("<span class='text-success'><b>재고 있음</b></span>");
									else
										out.println("<span class='text-warning'><b>재고 없음</b></span>");
								%>
								
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1 text-center"></td>
					<td class="col-sm-1 col-md-1 text-center"></td>
					<td class="col-sm-1 col-md-1 text-center">
						<strong><%= p.getPrice() %>원</strong>
					</td>
					<td class="col-sm-1 col-md-1 text-center"></td>
				</tr>
				<% } %>
			<% } %>
		<% } %>
			</table>
		</div>
	</div>
</div>