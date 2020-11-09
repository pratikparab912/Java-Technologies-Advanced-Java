<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<title>Login Page</title>
</head>

<%
	String unm = "";
	Cookie arr[] = request.getCookies();
	if(arr!=null){
		for(Cookie a : arr){
			String cname = a.getName();
			if(cname.equals("user_name")){
				unm = a.getValue();
				break;
			}
		}
	}
%>   

<body>

<div class="container">
<div class="row d-flex justify-content-center">
	<div class="col col-6">
		<form action="login_validate.jsp">
		<h1>Login Form</h1>
  		
  		<div class="form-group">
    		<label for="exampleInputEmail1">Usernmae</label>
    		<input type="txt" class="form-control" name="userName" id="exampleInputEmail1" aria-describedby="emailHelp">
    		
  		</div>
  			<div class="form-group">
    		<label for="exampleInputPassword1">Password</label>
    		<input type="password" class="form-control" name="userPass" id="exampleInputPassword1">
  		</div>
  		
 		 <button type="submit" class="btn btn-primary">Submit</button>
 		 
 		 
 		 <div style="color: red;font-size: 15;text-align: center;" >
					<%=(request.getParameter("error_msg")!=null)? request.getParameter("error_msg"):"" %>
		 </div>
		</form>
		
	</div>
</div>


</div>
</body>
</html>