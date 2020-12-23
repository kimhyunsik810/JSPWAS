<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<jsp:useBean id="recentlySeeing" class="jsp.annawa.RecentlySeeing" scope="session" />

<% 
	int no = Integer.parseInt(request.getParameter("no"));
	Product product = productManager.getProduct(no);
	String status = product.getStatus().equals("중고") ? " (중고)" : "";
	productManager.updateViewCount(product);	// 상품 조회수 증가
	recentlySeeing.addProduct(product);			// 최근 본 상품에 추가
%>

<div class="container">
	<div class="row">
		<h2 class="productTitle">제품 정보</h2>
		<div class="col-md-2"></div>
		<div class="col-md-4 item-photo">
			<img style="max-width:300px;" src="<%= "img/"+product.getImage() %>" />
		</div>
		<div class="col-md-5" style="border: 0px solid gray">
			<form action="module/cartProcess.jsp">
				<input type=hidden name="product_no" value="<%=product.getNo()%>"> 
				<input type=hidden name="action" value="insert">
				<h3><%= product.getName() + status %></h3>
				<h5><%= product.getInfo() %></h5>
				<h6>재고 상태</h6>
				<% 
					if (product.getAmount() > 0)
						out.println("<h4 class='text-success'><b>재고 있음</b></h4>");
					else
						out.println("<h4 class='text-warning'><b>재고 없음</b></h4>");
				%>
				<h6>가격</h6>
				<h3 style="margin-top: 0px;"><%= product.getPrice() %>원</h3>
	
				<div class="section" style="padding-bottom: 20px;">
				<% if (product.getAmount() > 0) { %>
					<h6>주문 수량</h6>
					<div>
						<input type="number" name="amount" value="1" min="1" max="<%=product.getAmount()%>" step="1" required>
					</div>
				<% } %>
				</div>
	
				<div class="section" style="padding-bottom: 20px;">
				<% 
					if (product.getAmount() > 0)
						out.println("<input type='submit' class='btn btn-primary' value='장바구니에 넣기'>");
					else
						out.println("<a href='#' class='btn btn-danger'>구매 불가</a>");
				%>
				</div>
			</form>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>
