<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>
<jsp:useBean id="productManager" class="jsp.annawa.ProductManager" />

<%
	String memLogin = (String) session.getAttribute("memberLogin");
	String memID = (String) session.getAttribute("memberID");
	
	// 상단 상품 3개 랜덤 노출
	ArrayList<Product> products = productManager.getProducts(GetType.ALL);
	Set<Integer> set = new HashSet<>();
	while (set.size() < 3)
		set.add((int)(Math.random() * products.size()));
	Integer[] idx = new Integer[3];
	set.toArray(idx);
%>

<!-- PC 메뉴 -->

<div id="annawa-navbar">
	<div class="container">
		<div class="row row1">
			<%
				// 최소 상품개수가 3개여야 상단 링크가 작동함
				if (idx.length < 3) {
			%>
			<ul class="largenav col-md-4 col-md-offset-5">
				<li class="upper-links">상품을 3개 이상 등록 해주세요</li>
			</ul>
			<%
				} else {
			%>
			<ul class="largenav col-md-6 col-md-offset-4">
			<%
					for (int i : idx) {
						Product p = products.get(i);
			%>
				<li class="upper-links">
					<a class="links" href="index.jsp?CONTENTPAGE=content_detail.jsp?no=<%=p.getNo()%>">
						<%= p.getName() %>
					</a>
				</li>
			<% 		} %>
			</ul>
			<%	}  %>
			<ul class="largenav pull-right">
				<li class="upper-links dropdown">
					<a class="links" href="#">
						<%
							if (memLogin == null) {
								out.print("로그인");
							} else {
								out.print(memID + "님");
							}
						%>
						<span class='caret'></span>
					</a>
					<ul class="dropdown-menu">
						<%
							if (memLogin == null) {
								out.print("<li><a class='profile-links' href='login.jsp'>로그인</a></li>");
							} else {
								out.print("<li><a class='profile-links' href='module/logoutProcess.jsp'>로그아웃</a></li>");
							}
						%>
						<li class="profile-li"><a class="profile-links" href="signup.jsp">회원가입</a></li>
						<li class="profile-li"><a class="profile-links" href="index.jsp?CONTENTPAGE=content_customer.jsp">마이 페이지</a></li>
						<li class="profile-li"><a class="profile-links" href="index.jsp?CONTENTPAGE=content_order.jsp">주문조회</a></li>
						<li class="profile-li"><a class="profile-links" href="index.jsp?CONTENTPAGE=content_recent.jsp">최근 본 상품</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="row row2">
			<div class="col-sm-2">
				<!-- 모바일 타이틀 -->
				<h2 style="margin: 0px;">
					<span class="smallnav">
						<span class="menu" onclick="openNav()">☰</span> 
						<a href="index.jsp?CONTENTPAGE=content.jsp">안나와</a>
					</span>
				</h2>
				<!-- 데스크톱 타이틀 -->
				<h1 style="margin: 0px;">
					<span class="largenav">
						<a href="index.jsp?CONTENTPAGE=content.jsp">
							<span class="glyphicon glyphicon-leaf" aria-hidden="true" />안나와
						</a>
					</span>
				</h1>
			</div>
			<div class="annawa-navbar-search smallsearch col-sm-8 col-xs-11">
				<div class="row">
					<form method="post" action="module/searchProcess.jsp">
						<input type="text" class="annawa-navbar-input col-xs-11" name="query">
						<input type="submit" class="annawa-navbar-button col-xs-1" value="검색">
					</form>
				</div>
			</div>
			<div class="cart largenav col-sm-2">
				<a href="index.jsp?CONTENTPAGE=content_cart.jsp" class="cart-button">
					<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" /> 장바구니
				</a>
			</div>
		</div>
	</div>
</div>

<!-- 모바일 메뉴 -->

<div id="mySidenav" class="sidenav">
	<div class="container" style="padding-top: 10px;">
		<span class="sidenav-heading">
		<%
 			if (memLogin == null) {
 				out.print("로그인 해주세요");
 			} else {
 				out.print(memID + "님");
 			}
 		%>
		</span>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
	</div>
	<hr>
	<%
		if (memLogin == null) {
			out.print("<a href='login.jsp'>로그인</a>");
		} else {
			out.print("<a href='module/logoutProcess.jsp'>로그아웃</a>");
		}
	%>
	<a href="signup.jsp">회원가입</a>
	<a href="index.jsp?CONTENTPAGE=content_customer.jsp">마이 페이지</a>
	<a href="index.jsp?CONTENTPAGE=content_cart.jsp">장바구니</a>
	<a href="index.jsp?CONTENTPAGE=content_order.jsp">주문조회</a>
	<a href="index.jsp?CONTENTPAGE=content_recent.jsp">최근본상품</a>
</div>