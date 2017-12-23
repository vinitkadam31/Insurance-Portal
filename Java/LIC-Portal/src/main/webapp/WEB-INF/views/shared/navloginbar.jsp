<%@page import="webapp.HelperClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>

<html>
<head>
<style>
body {margin:0;}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
<title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
$( document ).ready(function() {
	//alert("Hello in nav login bar");
	//alert($("#thisField").val());
	$("#hrefE").hide();
	$("#hrefM").hide();
	$("#hrefI").hide();
	$("#hrefC").hide();
	if($("#thisField").val() == "VER"){
		$("#hrefE").show();
	}
	if($("#thisField").val() == "L1MEDAPPR" || $("#thisField").val() == "L1NMEDAPPR"){
		$("#hrefM").show();
	}
	if($("#thisField").val() == "ISSUE"){
		$("#hrefI").show();
	}
	if($("#thisField").val() == "C"){
		$("#hrefC").show();
	}
		
});

    </script>
</head>
<body>
<input type="hidden" id="thisField" name="inputName" value="${usertype}">
<% String usertype1 = request.getParameter("usertype"); //System.out.println("UserType in nav login bar script tag =" + usertype1); 
%>

<div class="topnav">
  <a class="active" href="../forms/home.jsp">Home</a>
  <a href="../forms/contact.jsp">Contact</a>
  <a href="../forms/about.jsp">About</a>
  <a href="viewpolicy.do?usertype=${usertype}" id = "hrefE">Verifier</a>
  <a class="active" href="../forms/welcome.jsp" id = "hrefM">Non Medical</a>
  <a class="active" href="../forms/welcome.jsp" id = "hrefI">Issuer</a>
  <a class="active" href="../forms/welcome.jsp" id = "hrefC">Customer</a>
  <%if(usertype1 != null && usertype1.equalsIgnoreCase("VER")) {%>
  	<a class="active" href="viewpolicy.do?usertype=${usertype}" id = "hrefE">Verifier</a>
  <%} %>
  
  <%if(usertype1 != null && (usertype1.equalsIgnoreCase("L1MEDAPPR") || usertype1.equalsIgnoreCase("L1NMEDAPPR") )) {%>
  	<a class="active" href="../forms/welcome.jsp?usertype=${usertype}" id = "hrefM">Non Medical</a>
  <%} %>
  
  <%if(usertype1 != null && usertype1.equalsIgnoreCase("ISSUE")) {%>
  	<a class="active" href="../forms/welcome.jsp?usertype=${usertype}" id = "hrefI">Issuer</a>
  <%} %>
  
  <%if(usertype1 != null && usertype1.equalsIgnoreCase("C")) {%>
  <a class="active" href="../forms/welcome.jsp?usertype=${usertype}" id = "hrefC">Customer</a>
  <%} %>
</div>
<a href="login.do" class="btn btn-info btn-lg">
   <span class="glyphicon glyphicon-log-out"></span> Log out
</a>
<h1>Welcome to Life Insurance Portal!</h1>

 <%-- 
<div style="padding-left:16px">
  <h2>Top Navigation Example</h2>
  <p>Some content..</p>
</div>
--%>
</body>
</html>