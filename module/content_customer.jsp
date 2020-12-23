<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="customerManager" class="jsp.annawa.CustomerManager" />
<jsp:useBean id="orderManager" class="jsp.annawa.OrderManager" />
<jsp:useBean id="cmtMng" class="jsp.annawa.CommunityManager"/>

<%
	String custom_id = (String)session.getAttribute("memberID");

	if (custom_id == null) {
		out.println("<script>location.href='login.jsp'</script>");
	}
	
	Customer c = customerManager.getCustomerById(custom_id);
	ArrayList<Order> orders = orderManager.getOrdersByCustom_no(c.getCustom_no());
	ArrayList<Community> posts = cmtMng.getPostsByUser(custom_id);
	
	// 주문 내역 카운트
	int [] count = new int[4];
	for (Order o : orders) {
		if (o.getStatus().equals("결제 대기"))
			count[0]++;
		else if (o.getStatus().equals("결제 완료"))
			count[1]++;
		else if (o.getStatus().equals("배송 대기"))
			count[2]++;
		else
			count[3]++;
	}
%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">회원 정보</h2>
			<div class="col-md-3"></div>
			<div class="col-md-6 table-responsive">
				<table id="mytable" class="table table-bordred">
					<tr>
						<th>이름</th>
						<td><%= c.getCustom_name() %></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><%= c.getCustom_nickname() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%= c.getCustom_phone() %></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%= c.getCustom_email() %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%= c.getCustom_address() %></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<a href="index.jsp?CONTENTPAGE=content_edit.jsp" class="btn btn-primary">회원정보 수정</a>
						</td>
					</tr>
				</table>
				
			<div class="clearfix"></div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="col-md-12">
			<h2 class="productTitle">주문 상태</h2>
			<% if (orders.size() == 0) { %>
			<div class="text-center">주문 내역이 없습니다.</div>	
			<% } else { %>
			<div class="col-md-3"></div>
			<div class="col-md-6 table-responsive">
				<table id="mytable" class="table table-bordred">
					<thead>
						<th>결제 대기</th>
						<th>결제 완료</th>
						<th>배송 대기</th>
						<th>배송 완료</th>
					</thead>
					<tbody>
						<tr>
							<td><%= count[0] %></td>
							<td><%= count[1] %></td>
							<td><%= count[2] %></td>
							<td><%= count[3] %></td>
						</tr>
						<tr>
							<td colspan="4" align="right">
								<a href="index.jsp?CONTENTPAGE=content_order.jsp" class="btn btn-primary">주문 조회</a>
							</td>
						</tr>
					</tbody>
				</table>
			<div class="clearfix"></div>
			</div>
			<div class="col-md-3"></div>
			<% } %>
		</div>
		<div class="col-md-12">
		<h2 class="productTitle">활동 내역</h2>
			<% if (posts.size() == 0) { %>
			<div class="text-center">활동 내역이 없습니다.</div>	
			<% } else { %>
			<div class="col-md-3"></div>
			<div class="col-md-6 table-responsive">
				<table id="mytable" class="table table-bordred">
					<thead>
						<th>제목</th>
						<th>작성일</th>
					</thead>
					<tbody>
						<% for (int i = 0; i < 5; i++) { %>
						<tr>
							<td>
								<a href="index.jsp?CONTENTPAGE=content_community_view.jsp?pageType=ALL-<%= posts.get(i).getCmtId() %>">
									<%= posts.get(i).getCmtTitle() %>
								</a>
							</td>
							<td><%= posts.get(i).getCmtDate().substring(0, 10) %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			<div class="clearfix"></div>
			</div>
			<div class="col-md-3"></div>
			<% } %>
		</div>
	</div>
</div>