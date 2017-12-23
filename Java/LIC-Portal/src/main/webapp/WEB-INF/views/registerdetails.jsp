<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LIC Home</title>
<%@ include file="./shared/navbar.jsp" %>
<script type="text/javascript">

	$( document ).ready(function() {
		$("#divPrSection").hide();
		$("#divPaSection").hide();
		$('#divHidden').hide();
		$("input[name='sameproposer']").on("change", function () {
		    if(this.value == "yes"){
		    	$("#divPrSection").hide();
		    }
		    else{
		    	$("#divPrSection").show();
		    }
		});
		
		$("input[name='samepayer']").on("change", function () {
		    if(this.value == "yes"){
		    	$("#divPaSection").hide();
		    }
		    else{
		    	$("#divPaSection").show();
		    }
		});
	});
	
        </script>

</head>
<body>
<input type="hidden" id="thisField" name="inputName" value="${applid}">
	<div class="container">
	  	<h2>Proposer and Payer Details</h2>
	  	<form  action ="registrationDetails.do" method ="post">
		  	<div id ="divPr">
		  		<div class="row">
				  	<div class="span3"><label for="sameproposer"><span style="font-size: 18px; font-weight: bold;"> Is Proposer Same as LA:</span></label></div>
				  	<div class="span8">
			  			<input type="radio" name="sameproposer" value="yes"> yes
				  		<input type="radio" name="sameproposer" value="no"> no
			  		</div>
				</div><br/>
		  		
		  		<div id ="divPrSection">
				  	<div class="row">
					  	<div class="span3"><label for="namepr"><span style="font-size: 18px; font-weight: bold;"> Name:</span></label></div>
					  	<div class="span8"><input class="input-block-level" id="namepr" placeholder="Enter full name" name="namepr" value = "${namepr}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="emaiprl"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div>
				  		<div class="span8"><input class="input-block-level" id="emailpr" placeholder="Enter email" name="emailpr" value = "${emailpr}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="dobpr"><span style="font-size: 18px; font-weight: bold;"> DOB:</span></label></div>
				  		<div class="span8"><input type = "date" class="input-block-level" id="dobpr" placeholder="Enter dob" name="dobpr" value = "${dobpr}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="contactpr"><span style="font-size: 18px; font-weight: bold;"> Contact:</span></label></div>
				  		<div class="span8"><input class="input-block-level" id="contactpr" placeholder="Enter contact no" name="contactpr" value = "${contactpr}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="genderpr"><span style="font-size: 18px; font-weight: bold;"> Gender:</span></label></div>
				  		<div class="span8">
				  			<input type="radio" name="genderpr" value="male"> Male
					  		<input type="radio" name="genderpr" value="female"> Female
					 		<input type="radio" name="genderpr" value="other"> Other
				  		</div>
					</div>
					
					<br/>
					<div class="row">
				  		<div class="span3"></div>
				  		<div class="span8"></div>
					</div>
				</div>
			  </div>  
			  
			  <div id ="divPa">
		  		<div class="row">
				  	<div class="span3"><label for="samepayer"><span style="font-size: 18px; font-weight: bold;"> Is Payer Same as LA:</span></label></div>
				  	<div class="span8">
			  			<input type="radio" name="samepayer" value="yes"> yes
				  		<input type="radio" name="samepayer" value="no"> no
			  		</div>
				</div><br/>
		  		
		  		<div id ="divPaSection">
				  	<div class="row">
					  	<div class="span3"><label for="namepa"><span style="font-size: 18px; font-weight: bold;"> Name:</span></label></div>
					  	<div class="span8"><input class="input-block-level" id="namepa" placeholder="Enter full name" name="namepa" value = "${namepa}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="emailpa"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div>
				  		<div class="span8"><input class="input-block-level" id="emailpa" placeholder="Enter email" name="emailpa" value = "${emailpa}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="dobpa"><span style="font-size: 18px; font-weight: bold;"> DOB:</span></label></div>
				  		<div class="span8"><input type = "date" class="input-block-level" id="dobpa" placeholder="Enter dob" name="dobpa" value = "${dobpa}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="contactpa"><span style="font-size: 18px; font-weight: bold;"> Contact:</span></label></div>
				  		<div class="span8"><input class="input-block-level" id="contactpa" placeholder="Enter contact no" name="contactpa" value = "${contactpa}"></div>
					</div><br/>
					
					<div class="row">
				  		<div class="span3"><label for="genderpa"><span style="font-size: 18px; font-weight: bold;"> Gender:</span></label></div>
				  		<div class="span8">
				  			<input type="radio" name="genderpa" value="male"> Male
					  		<input type="radio" name="genderpa" value="female"> Female
					 		<input type="radio" name="genderpa" value="other"> Other
				  		</div>
					</div>
					<br/>
					<div class="row">
				  		<div class="span3"></div>
				  		<div class="span8"></div>
					</div>
				</div>
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