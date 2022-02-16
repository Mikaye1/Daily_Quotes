<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&family=Open+Sans+Condensed:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&family=Open+Sans+Condensed:wght@300&display=swap');
body{
		width:100%;
		margin: 0 auto;
		background-color: #3aafa9;
		color: #ffffff;
		font-family:helvetica;
		
		}
	
	a, a:hover{
	color:white;
	text-decoration:none;}
	a:hover{
	font-size 20px;
		
	}

	.wrapper{
	width:50%;
	margin:0 auto;

		}
	.quoteStyling{
	text-align:center;
	width: 24%;
	margin:5px auto;

	
	}	
	.bottomButtons{
		text-align:center;
	width: 100%;
	margin:0px auto;
	
	
	}	

	
	
		.quoteBody {
    font-size: 25px;
    font-family: 'Open Sans Condensed', sans-serif;
    text-align:center;
    
}
	span.quoteAuthor {
	text-decoration: overline;
    font-size: 15px;
    font-family: 'Open Sans Condensed', sans-serif;
    
}
	span.quoteCountry {
    font-size: 15px;
    font-family: 'Open Sans Condensed', sans-serif;
    
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


</style>
<title>Put a New Quote</title>
</head>
<body>



<div class="wrapper">
<h1>Create a Quote</h1>  
<form:form method="POST" action="/newQuote" modelAttribute="newQuote">


<form:label path="qText" class="col-sm-2 col-form-label">Quote:</form:label>

<form:textarea type="textarea" path="qText" class="form-control"></form:textarea>

<form:errors path="qText" class="text-danger"/>


<form:label path="author" class="col-sm-2 col-form-label">Author:</form:label>

<form:input type="text" path="author" class="form-control"></form:input>

<form:errors path="author" class="text-danger"/>

<form:label path="country" class="col-sm-2 col-form-label">Country:</form:label>

<form:input type="text" path="country" class="form-control"></form:input>

<form:errors path="country" class="text-danger"/>

<!-- Hidden input -->
<%-- <form:input type="hidden" value="${userId} path="user" /> --%>
 
<button type="submit" value="Add" class="btn btn-outline-primary">Add New Quote</button>
</form:form>
<div class="quoteStyling">
<form action="/allQuotes">
    <button type="goToDash" value="goToDash" class="btn btn-outline-primary">Go Back to Main Page</button>
</form>
<form action="/logout">
    <button type="submit" value="Log Out" class="btn btn-outline-primary">Log Out</button>
</form>
</div>

</div>
</body>
</html>