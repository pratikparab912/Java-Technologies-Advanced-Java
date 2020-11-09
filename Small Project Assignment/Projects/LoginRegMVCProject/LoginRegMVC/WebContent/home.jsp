<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="user" class="com.dto.User" scope="session"></jsp:useBean>
<%@ include file="cache_control.jsp" %>
<%
	if(user != null && user.getUserId()>0){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
</head>
<body>
	
	<h5 style="text-align: right;" ><a href="logout.jsp" >logout</a></h5>
	
	<h3>Home page</h3>
	<h1>Welcome <%= user.getUserFullName() %></h1>
	
</body>
</html>
<%
	}else{
		response.sendRedirect("login_form.jsp");
	}
%>