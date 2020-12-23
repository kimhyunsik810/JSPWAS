<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />
<%
	// 조회수가 높은 제품 최대 8개까지
	ArrayList<Product> products = productManager.getProducts(GetType.COUNT);
%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="carouselTitle">인기 제품</h2>
			<% if (products.size() < 4) { %>
			<div class="text-center">제품이 최소 4개 있어야 합니다.</div>
			<% } else { %>
			<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
			<ol class="carousel-indicators">
			<% 
				for (int i = 0; i < products.size() / 4; i++) {
					out.print("<li data-target='#myCarousel' data-slide-to='" + i + "'");
					if (i == 0) out.print("class='active'");
					out.println("></li>");
				}
			%>
			</ol>   
			<div class="carousel-inner">
			<%
				int idx = 0;
				for (int i = 0; i < products.size() / 4; i++) {
					if (i == 0) {
			%>
				<div class="item carousel-item active">
				<% } else { %>
				<div class="item carousel-item">
				<% } %>
					<div class="row">
						<% for (int j = 0; j < 4; j++) { %>
						<div class="col-sm-3">
							<div class="thumb-wrapper">
								<div class="img-box">
									<img src="img/<%= products.get(idx).getImage() %>" class="img-responsive img-fluid" alt="">
								</div>
								<div class="thumb-content">
									<h4><%= products.get(idx).getName() %></h4>
									<p class="item-price"><span><%= products.get(idx).getPrice() %>원</span></p>
									<a href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%= products.get(idx++).getNo() %>" class="btn btn-primary">상품 페이지</a>
								</div>
							</div>
						</div>
						<% } %>
					</div>
				</div>
				<% } %>
				</div>
				<!-- 슬라이드 컨트롤 -->
				<a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true" />
				</a>
				<a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true" />
				</a>
			<% } %>
			</div>
			</div>
	</div>
	</div>
	<div class="row">
		<h2 class="carouselTitle">이벤트 & 공지</h2>
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-6 table-responsive">
				<table class="table table-bordred">
					<tr>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
					</tr>
					<% 
						CommunityManager cmtMng = new CommunityManager();
						ArrayList<Community> list = cmtMng.getPosts("EVENT");
						int idx = 0;
						for (Community cmt : list) {
							if (cmt.getCmtAvailable() == 1) {
								idx++;
					%>
					<tr align="center">
						<td>
							<a href="index.jsp?CONTENTPAGE=content_community_view.jsp?pageType=EVENT-<%= cmt.getCmtId() %>"><%= cmt.getCmtTitle() %></a>
						</td>
						<td><%= cmt.getCmtDate().substring(0, 10) %></td>
					</tr>
					<% 
							}
							if (idx > 4)
								break;
						}	 
					%>
				</table>
			</div>
			<div class="col-md-6 table-responsive">
				<table class="table table-bordred">
					<tr>
						<th class="text-center">제목</th>
						<th class="text-center">작성일</th>
					</tr>
					<% 
						list = cmtMng.getPosts("NOTICE");
						idx = 0;
						for (Community cmt : list) {
							if (cmt.getCmtAvailable() == 1) {
								idx++;
					%>
					<tr align="center">
						<td>
							<a href="index.jsp?CONTENTPAGE=content_community_view.jsp?pageType=NOTICE-<%= cmt.getCmtId() %>"><%= cmt.getCmtTitle() %></a>
						</td>
						<td><%= cmt.getCmtDate().substring(0, 10) %></td>
					</tr>
					<% 
							}
							if (idx > 4)
								break;
						}	 
					%>
				</table>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>