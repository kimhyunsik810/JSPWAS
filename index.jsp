<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
	if (contentPage == null)
		contentPage = "content.jsp";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/header.css?after">
<link rel="stylesheet" type="text/css" href="css/nav.css?after">
<link rel="stylesheet" type="text/css" href="css/content.css">
<link rel="stylesheet" type="text/css" href="css/content_product.css?a">
<title>안나와</title>
</head>
<body>
	<header>
		<jsp:include page="module/header.jsp" flush="false" />
	</header>
	<nav>
		<jsp:include page="module/nav.jsp" flush="false" />
	</nav>
	<section>
		<jsp:include page='<%= "module/" + contentPage %>' flush="false" />
	</section>
	<hr>
	<footer>
		<jsp:include page="module/footer.jsp" flush="false" />
	</footer>
	<script src="js/header.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
