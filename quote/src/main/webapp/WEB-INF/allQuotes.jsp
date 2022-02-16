<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&family=Open+Sans+Condensed:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script&family=Open+Sans+Condensed:wght@300&display=swap');
body{
		width:100%;
		margin: 0 auto;
		background-color: #3aafa9;
		color: #ffffff;
		
		}
	
	a, a:hover{
	color:white;
	text-decoration:none;}
	a:hover{
	font-size 20px;
		
	}

	.wrapper{
	width:100%;
	margin:0 auto;
	display: flex;
	flex-wrap:wrap;
	flex-direction:row;
		}
	.quoteStyling{
	text-align:center;
	width: 24%;
	margin:5px auto;
	outline:3px solid #2b7a773b;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);
  transition: box-shadow 0.3s ease-in-out;
	
	}	
	.bottomButtons{
		text-align:center;
	width: 100%;
	margin:0px auto;
	
	
	}	
	
	.quoteStyling:hover{
		
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.8);
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
::selection {
  background: #ffffff;
}

</style>
<title>Dashboard</title>
</head>
<body>

<div align="center">
<h1>Welcome ${user.userName}!</h1>
<form action="/newQuote">
<button type="submit" value="Add a Quote" class="btn btn-outline-primary">Add a Quote</button>
</form>
</div>
<!-- API -->
<div align="center">
<h3>Quote of the Day</h3>
${qOfTheDay}
</div>

<div class="wrapper">
<c:forEach items="${allQuotes}" var="allQ">
<div class="quoteStyling p-2 bd-highlight">
<div class="quoteBody"> "${allQ.qText}"</div><br/>
<span class="quoteAuthor">Author: ${allQ.author}</span><br/>
<span class="quoteCountry">Country of Origin:  ${allQ.country}</span><br/>
<span class="toggleButton">


<c:choose>
<c:when test="${allQ.likers.contains(user)}">
<a href="/quotes/unLike/${allQ.id}" >Unlike</a>
</c:when>
<c:otherwise>
<a href="/quotes/like/${allQ.id}">Like</a>
</c:otherwise>
</c:choose>

<c:out value="${allQ.likers.size()}"/>
</span>

<!-- TEST -->
<%-- <c:set var="id" value="${user.id}"/> --%>
<%-- <% session.setAttribute("someUser", "${user.id}"); %> --%>

<%-- <c:if test = "${someUser == allQ.user.id}">

</c:if> --%>

<%-- <% if(user.id == allQ.user.id){ %>

<% } %> --%>

<form action="/edit/${allQ.id}">
<button type="submit" value="Edit/Delete" class="btn btn-outline-primary">Edit/Delete</button>
</form>



</div>
</c:forEach>
</div>
<div class="bottomButtons">
<form action="/logout">
<button type="submit" value="Log Out" class="btn btn-outline-primary">Log Out</button>
</form>
</div>
</body>
</html>