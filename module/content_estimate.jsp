<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<jsp:useBean id="estimateManager" class="jsp.annawa.EstimateManager" scope="session" />

<%
	DecimalFormat fmt = new DecimalFormat("###,###");
	String type = request.getParameter("type");
	if (type == null) {
		type = "CPU";
	}
	ArrayList<Product> products = productManager.getProducts(type); 
	Hashtable hTable = estimateManager.getTable();
	int totalPrice = 0;
	
	// 품목별 가격
	ArrayList<String> types = productManager.getProductTypes();
	ArrayList<Order> lists[] = new ArrayList[types.size()];
	for (int i = 0; i < types.size(); i++)
		lists[i] = new ArrayList<Order>();
%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">PC 견적</h2>
			<div class="col-md-6 table-responsive">
				<table class="table table-bordred">
					<tr>
						<th colspan="2" class="text-center"><%= type %></th>
					</tr>
					<% for (Product p : products) { %>
					<tr>
						<td>
							<div>
								<img src="img/<%= p.getImage() %>" style="width:100px">
								<a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= p.getNo() %>"><%= p.getName() %></a>
							</div>
						</td>
						<td>
							<div class="text-center"><%= p.getPrice() %>원</div>
							<form action="module/estimateProcess.jsp">
								<input type="hidden" name="action" value="insert">
								<input type="hidden" name="product_no" value="<%=p.getNo()%>"> 
								<input type="hidden" name="amount" value="1">
								<input type="hidden" name="type" value="<%=p.getType()%>">
								<div class="text-center"><input type="submit" class="btn btn-primary" value="담기"></div>
							</form>
						</td>
					</tr>
					<% } %>
				</table>
			</div>
			<div class="col-md-6 table-responsive">
				<table class="table table-bordred">
					<tr>
						<th class="text-center">부품선택</th>
					</tr>
					<tr>
						<td>
							<div class="text-center">
								<%
									// 부품별 테이블
									Enumeration hTableKey = hTable.keys();
									while (hTableKey.hasMoreElements()) {
										Order order = (Order) hTable.get(hTableKey.nextElement());
										Product product = productManager.getProduct(order.getProduct_no());
	
										// parseInt때문에 콤마 제거
										int price = Integer.parseInt(product.getPrice().replace(",", ""));
										int amount = order.getAmount();
										int subTotal = price * amount;
										totalPrice += price * amount;
										
										// 품목별로 추가
										for (int i = 0; i < types.size(); i++)
											if (product.getType().equals(types.get(i)))
												lists[i].add(order);
									}
								%>
								<% for (int i = 0; i < types.size(); i++) { %>
								<div class="col-md-12">
									<h4>
									<a href="index.jsp?CONTENTPAGE=content_estimate.jsp?type=<%=types.get(i)%>"><%=types.get(i)%></a>
									</h4>
								</div>
								<% 
								for (Order o : lists[i]) { 
									Product p = productManager.getProduct(o.getProduct_no());
									int price = Integer.parseInt(p.getPrice().replace(",", ""));
								%>
								<div class="col-md-12" style="padding:20px;">
								<div class="col-md-5">
									<a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= p.getNo() %>"><%= p.getName() %></a>
								</div>
								<form method="post" action="module/estimateProcess.jsp?action=update">
									<input type="hidden" name="product_no" value="<%=p.getNo()%>">
									<input type="hidden" name="type" value="<%=type%>">
									<div class="col-md-2">
										<input type="number" name="amount" value="<%=o.getAmount()%>" style="width: 45px">
									</div>
									<div class="col-md-3"><%= fmt.format(price * o.getAmount()) %>원</div>
									<div class="col-md-1">
										<input type="submit" value="수정">
									</div>
								</form>
								<form method="post" action="module/estimateProcess.jsp?action=delete">
									<input type="hidden" name="product_no" value="<%=p.getNo()%>">
									<input type="hidden" name="type" value="<%=type%>">
									<div class="col-md-1">
										<input type="submit" value="삭제">
									</div>
								</form>
								</div>
								<% }
								} %>
							</div>
						</td>
					</tr>
					<tr>
						<td align="right"><h3>예상 가격 : <%= fmt.format(totalPrice) %>원</h3></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>