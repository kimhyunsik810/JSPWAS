<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>

<%
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>

<div class="container">
	<div class="row">
		<h2 class="productTitle">이벤트</h2>
		<table class="table table-striped" style="text-align: center: border: 1px solid #DDDDDD;">
			<thead>
				<tr>
					<th style="width: 10%; text-align: center; background-color: #EEEEEE;">No.</th>
					<th style="width: 10%; text-align: center; background-color: #EEEEEE;">구분</th>
					<th style="width: 50%; text-align: center; background-color: #EEEEEE;">제목</th>
					<th style="width: 10%; text-align: center; background-color: #EEEEEE;">작성자</th>
					<th style="width: 20%; text-align: center; background-color: #EEEEEE;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
					CommunityManager cmtMng = new CommunityManager();
					ArrayList<Community> list = cmtMng.getList(pageNumber, "EVENT");
					for(int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td style="text-align: center;">
						<%= list.get(i).getCmtId() %>
					</td>
					<td style="text-align: center;">
						<%= list.get(i).getCmtType() %>
					</td>
					<td>
						<%
							if(list.get(i).getCmtAvailable() == 1) {
						%>
						<a href="index.jsp?CONTENTPAGE=content_community_view.jsp?pageType=<%= "EVENT" %>-<%= list.get(i).getCmtId() %>">
							<%= list.get(i).getCmtTitle() %>
						</a>
						<%
							}
							if(list.get(i).getCmtAvailable() == 0) {
						%>
						<a>삭제된 게시글입니다.</a>
						<%
							}
						%>
					</td>
					<td style="text-align: center;">
						<%= list.get(i).getCmtUser() %>
					</td>
					<td style="text-align: center;">
						<%= list.get(i).getCmtDate().substring(0, 4) + "." +
							list.get(i).getCmtDate().substring(5, 7) + "." +
							list.get(i).getCmtDate().substring(8, 10) + " " +
							list.get(i).getCmtDate().substring(11, 13) + ":" +
							list.get(i).getCmtDate().substring(14, 16) %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if(1 < pageNumber) {
		%>
		<a class="btn btn-success btn-arraw-left" href="index.jsp?CONTENTPAGE=content_community_event.jsp?pageNumber=<%= pageNumber - 1 %>">이전</a>
		<%
			}
			
			if(cmtMng.nextPage((pageNumber + 1), "EVENT")) {
		%>
		<a class="btn btn-success btn-arraw-left" href="index.jsp?CONTENTPAGE=content_community_event.jsp?pageNumber=<%= pageNumber + 1 %>" >다음</a>
		<%
			}
		%>
	
	</div>    
</div>