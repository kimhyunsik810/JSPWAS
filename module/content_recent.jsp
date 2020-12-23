<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="recentlySeeing" class="jsp.annawa.RecentlySeeing" scope="session" />

<% Hashtable products = recentlySeeing.getProducts(); %>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">최근 본 상품</h2>
			<% if (products.isEmpty()) { %>
			<div class="text-center">최근 본 상품이 없습니다.</div>
			<% } else { %>
			<table class="table">
			<% 
				Enumeration pKey = products.keys();
				while (pKey.hasMoreElements()) { 
					Product p = (Product) products.get(pKey.nextElement());
			%>
				<tr>
					<td class="col-sm-10 col-md-8">
						<div class="media">
							<a class="pull-left" href="#">
								<img src="<%= "img/" + p.getImage() %>" style="width: 160px">
							</a>
							<div class="media-body">
								<h4 class="media-heading">
									<a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= p.getNo() %>"><%= p.getName() %></a>
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
						<a href='module/recentProcess.jsp?no=<%= p.getNo() %>' class='btn btn-danger'>삭제</a>
					</td>
					<td class="col-sm-1 col-md-1 text-center"></td>
				</tr>
			<% } %>
		<% } %>
			</table>
		</div>
	</div>
</div>