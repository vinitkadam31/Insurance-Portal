<%@page import="webapp.HelperClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="models.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LIC Home</title>
<%@ include file="./shared/navbar.jsp" %>
<script type="text/javascript">

	
	$( document ).ready(function() {
		$('#divHidden').hide();
	});
	
        </script>

</head>
<body>
	<%! ArrayList<Product> dataList = new HelperClass().GetAllProducts(); %>
	<div id = "divErrorMsg" class = "isa_error" style="font-size:20px;">
	<i class="fa fa-times-circle"></i>
		${message}
	</div>
	<div class="container">
	  	<h2>General Questions</h2>
	  	<form  action ="generalquestions.do" method ="post">
	  		
	  		<div class="row">
			  	<div class="span3"><label for="policy"><span style="font-size: 18px; font-weight: bold;"> Policy:</span></label></div>
			  	<div class="dropdown">
			  		<select name="policy">
			  		<option value="-1">Select Policy</option>
			  			<%for(int i = 0; i < dataList.size(); i++) {%>
							<option value="<%= dataList.get(i).getProductId() %>"><%= dataList.get(i).getProductName() %></option>
						<%} %>
			  		</select>
					  
				</div>
			</div><br/>
	  		
		  	<div class="row">
			  	<div class="span3"><label for="sumassured"><span style="font-size: 18px; font-weight: bold;"> Sum assured:</span></label></div>
			  	<div class="span8"><input class="input-block-level" id="sumassured" placeholder="Enter Sum assured" name="sumassured"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="policyterm"><span style="font-size: 18px; font-weight: bold;"> Policy Term:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="policyterm" placeholder="Enter Policy Term" name="policyterm"></div>
			</div><br/>
			
			<div class="row">
			  	<div class="span3"><label for="frequency"><span style="font-size: 18px; font-weight: bold;"> Frequency:</span></label></div>
			  	<div class="dropdown">
			  		<select name="frequency">
			  		<option value="S">Select frequency</option>
							<option value="M">Monthly</option>
							<option value="Q">Quaterly</option>
							<option value="Y">Yearly</option>
							<option value="H">Half Yearly</option>
			  		</select>
					  
				</div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="annualincome"><span style="font-size: 18px; font-weight: bold;"> Anual Income:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="annualincome" placeholder="Enter Anual Income" name="annualincome"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="smoke"><span style="font-size: 18px; font-weight: bold;"> Smoke:</span></label></div>
		  		<div class="span8">
		  			<input type="radio" name="smoke" value="yes"> yes
			  		<input type="radio" name="smoke" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="weight"><span style="font-size: 18px; font-weight: bold;"> Current Weight:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="weight" placeholder="Enter Weight" name="weight"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="height"><span style="font-size: 18px; font-weight: bold;"> Height:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="height" placeholder="Enter height" name="height"></div>
			</div><br/>
			
			<br/>
			<div class="row">
		  		<div class="span3"></div>
		  		<div class="span8"></div>
			</div>
		    <div class="row" id = "divHidden" >
				<div class="span8"><input class="input-block-level" id="contactpr" placeholder="Enter contact no" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="contactpr" placeholder="Enter contact no" name="customername" value = "${customername}"></div>
			</div><br/>
		    <button type="submit" class="btn btn-default">Submit</button>
	  	</form>
	</div>

</body>
<%@ include file="./shared/footer.jsp" %>
</html>