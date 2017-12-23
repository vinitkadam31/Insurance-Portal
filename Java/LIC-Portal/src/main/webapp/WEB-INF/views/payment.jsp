<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LIC Home</title>
<%
String name1 = request.getParameter("name");
%>
<%@ include file="./shared/navloginbar.jsp" %>
<script type="text/javascript">

	$( document ).ready(function() {
    	$("#divHiddenFields").hide();
    	
    	if($("#hiddenMessage").val() != ""){
    		alert($("#hiddenMessage").val());
    	}
	});

	$(function () {
		<!--$('#datetimepicker1').datetimepicker();-->
    });
        </script>

</head>
<body>
<input type="hidden" id="hiddenMessage" name="inputName" value="${message}">
	<div class="container">
	  	<h2>Payment Window</h2>
	  	<form action ="payment.do" method ="post">
	  
		  	<div class="row">
			  	<div class="span3"><label for="customername"><span style="font-size: 18px; font-weight: bold;"> Customer Name:</span></label></div>
			  	<div class="span8"><input class="input-block-level" id="customername" placeholder="Enter full name" name="customername" value = "${customername}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="amount"><span style="font-size: 18px; font-weight: bold;"> Amount:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="amount" placeholder="Enter amount" name="amount" value = "${amount}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="paymentmode"><span style="font-size: 18px; font-weight: bold;"> Payment Mode:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="paymentmode" placeholder="Enter Payment Mode" name="paymentmode" value = "${paymentmode}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="checknumber"><span style="font-size: 18px; font-weight: bold;"> Check Number:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="checknumber" placeholder="Enter Check Number" name="amount" value = "${checknumber}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="comments"><span style="font-size: 18px; font-weight: bold;"> Comments:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="comments" placeholder="Enter Comments" name="comments" value = "${comments}"></div>
			</div><br/>
			
			<br/>
			<div class="row" id ="divHiddenFields">
		  		<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "${usertype}"></div>
		  		<div class="span8"><input class="input-block-level" id="applid" name="applid" value = "${applid}"></div>
			</div>
		    
		    <button type="submit" class="btn btn-default">Submit</button>
	  	</form>
	</div>

</body>
<%@ include file="./shared/footer.jsp" %>
</html>