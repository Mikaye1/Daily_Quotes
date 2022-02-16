<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&family=Open+Sans+Condensed:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&family=Open+Sans+Condensed:wght@300&display=swap');
html {    
  
}
body{
		width:100%;
		margin: 0 auto;
		  background: url('https://thecultureprojectblog.files.wordpress.com/2016/11/raphael-school-at-athens.jpg') no-repeat center fixed;     
    background-size: cover;
		color: #ffffff;
		
		
		}
	
	a, a:hover{
	color:white;
	text-decoration:none;}
	a:hover{
	font-size 20px;
		
	}

	.wrapper{
	    width: 60%;
    padding: 20px;
    margin: 0 auto;
    background-color: #0000007d;
	
		}
	.quoteStyling{
	text-align:center;
	width: 24%;
	margin:5px auto;
	outline:3px solid #2b7a773b;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);
  transition: box-shadow 0.3s ease-in-out;
	
	}	

	
.toggleButton{
font-family:helvetica;
font-size: 20px;
      
}
.toggleButton:hover{
	font-size:25px;
	color:white;
	  transition: 0.3s ease-in-out;
}
	
.btn-outline-primary{
padding:3px 8px !important;
	color:white !important;
    background-color: #3aafa9 !important;
    border-color: white !important;
}	
.btn-outline-primary:hover{
	
    background-color: white !important;
    border-color: #3aafa9 !important;
    color: #192429 !important; 	
}
button{
margin:20px 0px;	
}

h1{
	padding-top:20px;
}
::selection {
  background: #ffffff;
}

</style>
<title>Home Page</title>
</head>
<body>

<div class="wrapper">

<!-- LogIn -->
<h1>Login</h1>  
<form method="post" action="/login">
<p>
<c:out value="${error}"/>
</p>
<label for="email" class="">Email:</label>
<input type="text" class="form-control" id="email" name="email">
<label for="password" class="col-sm-2 col-form-label">Password:</label>
<input type="password" class="form-control" id="password" name="password">
<button type="submit" value="Login!" class="btn btn-outline-primary">Login</button>
</form>

<hr class="hr-danger" />

<!-- Registration -->
<h1 class="register">Register</h1>  

<form:form method="POST" action="/registration" modelAttribute="user">
<form:label path="userName" class="col-sm-2 col-form-label">Username:</form:label>
<form:input type="userName" path="userName" class="form-control"></form:input>
<p>
<form:errors path="userName" class="text-danger"/>
</p>
<form:label path="email" class="col-sm-2 col-form-label">Email:</form:label>
<form:input type="email" path="email" class="form-control"></form:input>
<p>
<form:errors path="email" class="text-danger"/>
</p>
<form:label path="password" class="col-sm-2 col-form-label">Password:</form:label>
<form:input type="password" path="password" class="form-control"></form:input>
<p>
<form:errors path="password" class="text-danger"/>
</p>
<form:label path="passwordConfirmation" class="col-sm-2 col-form-label">Password Confirmation:</form:label>
<form:input type="password" path="passwordConfirmation" class="form-control"></form:input>
<p>
<form:errors path="passwordConfirmation" class="text-danger"/>
</p>
<button type="submit" value="Register!" class="btn btn-outline-primary">Register</button>
</form:form>

</div>
</body>
</html>