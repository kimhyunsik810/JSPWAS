<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.annawa.*"%>

<jsp:useBean id="customerManager" class="jsp.annawa.CustomerManager" />
<jsp:useBean id="orderManager" class="jsp.annawa.OrderManager" />

<%
	String custom_id = (String)session.getAttribute("memberID");

	if (custom_id == null) {
		out.println("<script>location.href='login.jsp'</script>");
	}
	
	Customer c = customerManager.getCustomerById(custom_id);
%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="productTitle">회원 정보</h2>
			<div class="col-md-3"></div>
			<div class="col-md-6 table-responsive">
			<form method="post" action="admin/customer_control.jsp">
				<input type="hidden" name="custom_no" value="<%=c.getCustom_no()%>"> 
				<input type="hidden" name="action" value="update_user">
				<table id="mytable" class="table table-bordred">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="custom_id" value="<%=c.getCustom_id()%>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="custom_pw" value=""></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="custom_name" value="<%=c.getCustom_name()%>"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="custom_nickname" value="<%=c.getCustom_nickname()%>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="custom_phone" value="<%=c.getCustom_phone()%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="custom_email" value="<%=c.getCustom_email()%>"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="custom_address" value="<%=c.getCustom_address()%>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input class="btn btn-primary" type=submit value="저장">
						<input class="btn btn-danger" type=reset value="취소">
					</td>
				</tr>
				</table>
			</form>
			<div class="clearfix"></div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</div>