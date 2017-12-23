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
<%@ include file="./shared/navbar.jsp" %>
<script type="text/javascript">

	$( document ).ready(function() {
    	
	});

	$(function () {
		<!--$('#datetimepicker1').datetimepicker();-->
    });
        </script>

</head>
<body>
	<div id = "divErrorMsg" class = "isa_error" style="font-size:20px;">
	<i class="fa fa-times-circle"></i>
		${message}
	</div>
	<div class="container">
	  	<h2>Vertical (basic) form</h2>
	  	<form action ="register.do" method ="post">
	  
		  	<div class="row">
			  	<div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Name:</span></label></div>
			  	<div class="span8"><input class="input-block-level" id="name" placeholder="Enter full name" name="name" value = "${name}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="email"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="email" placeholder="Enter email" name="email" value = "${email}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="password"><span style="font-size: 18px; font-weight: bold;"> Password:</span></label></div>
		  		<div class="span8"><input type="password" class="input-block-level" name = "password" placeholder="Password"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="confirmpassword"><span style="font-size: 18px; font-weight: bold;"> Confirm Password:</span></label></div>
		  		<div class="span8"><input type="password" class="input-block-level" name = "confirmpassword" placeholder="Confirm Password"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="dob"><span style="font-size: 18px; font-weight: bold;"> DOB:</span></label></div>
		  		<div class="span8"><input type = "date" class="input-block-level" id="dob" placeholder="Enter dob" name="dob" value = "${dob}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="contact"><span style="font-size: 18px; font-weight: bold;"> Contact:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="contact" placeholder="Enter contact no" name="contact" value = "${contact}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="gender"><span style="font-size: 18px; font-weight: bold;"> Gender:</span></label></div>
		  		<div class="span8">
		  			<input type="radio" name="gender" value="male"> Male
			  		<input type="radio" name="gender" value="female"> Female
			 		<input type="radio" name="gender" value="other"> Other
		  		</div>
			</div><br>
			
			<div class="row">
		  		<div class="span3"><label for="address1"><span style="font-size: 18px; font-weight: bold;"> Address 1:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="address1" placeholder="Enter address 1" name="address1" value = "${address1}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="address2"><span style="font-size: 18px; font-weight: bold;"> Address 2:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="address2" placeholder="Enter address 2" name="address2" value = "${address2}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="city"><span style="font-size: 18px; font-weight: bold;"> City:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="city" placeholder="Enter City" name="city" value = "${city}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="state"><span style="font-size: 18px; font-weight: bold;"> State:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="state" placeholder="Enter State" name="state" value = "${state}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="country"><span style="font-size: 18px; font-weight: bold;"> Country:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="country" placeholder="Enter country" name="country" value = "${country}"></div>
			</div><br/>
			
			<div class="row">
		  		<div class="span3"><label for="pincode"><span style="font-size: 18px; font-weight: bold;"> Pincode:</span></label></div>
		  		<div class="span8"><input class="input-block-level" id="pincode" placeholder="Enter pincode" name="pincode" value = "${pincode}"></div>
			</div><br/>
			
			<br/>
			<div class="row">
		  		<div class="span3"></div>
		  		<div class="span8"></div>
			</div>
		    
		    <button type="submit" class="btn btn-default">Submit</button>
	  	</form>
	</div>

</body>
<%@ include file="./shared/footer.jsp" %>
</html>