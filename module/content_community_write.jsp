<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.annawa.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF8"); %>

<div class="container">
	<div class="row">
		<form method="post" action="module/content_community_write_action.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #DDDDDD;">
				<thead>
					<tr>
						<th colspan="2"
							style="text-align: center; background-color: #EEEEEE">게시글 작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input class="form-control" type="text" placeholder="게시글 제목" name="cmtTitle" maxlength="50">
						</td>
						<td>
						<select class="form-control" name="cmtType">
							<option value="AS문의">AS문의</option>
							<option value="상품문의">상품문의</option>
							<option value="견적문의">견적문의</option>
							<option value="기타사항">기타사항</option>
						</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" placeholder="게시글 내용" name="cmtContent" maxlength="2048" style="min-height: 350px; resize: none"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input class="btn btn-primary pull-right" type="submit" value="저장">
		</form>
	</div>
</div>