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
		$('#divHidden').hide();
		alert(customername);
	});
	
        </script>

</head>
<body>
	<div class="container">
	  	<h2>Medical Questions</h2>
	  	<form  action ="medicalquestions.do" method ="post">
	  
		  	<div class="row">
			  	<div class="span7">
			  		<label for="tobacco">
			  			<span style="font-size: 18px; font-weight: bold;"> Have you used tobacco in any form within the past 15 years?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="tobacco" value="yes"> yes
			  		<input type="radio" name="tobacco" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="heartdiseases">
			  			<span style="font-size: 18px; font-weight: bold;"> Coronary Artery Disease/Heart Related Diseases:</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="heartdiseases" value="yes"> yes
			  		<input type="radio" name="heartdiseases" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="diabetes">
			  			<span style="font-size: 18px; font-weight: bold;"> Diabetes:</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="diabetes" value="yes"> yes
			  		<input type="radio" name="diabetes" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="cancer">
			  			<span style="font-size: 18px; font-weight: bold;"> Cancer:</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="cancer" value="yes"> yes
			  		<input type="radio" name="cancer" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="cerebralvasculardisease">
			  			<span style="font-size: 18px; font-weight: bold;"> Cerebral Vascular Disease or Stroke?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="cerebralvasculardisease" value="yes"> yes
			  		<input type="radio" name="cerebralvasculardisease" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="hepatitis">
			  			<span style="font-size: 18px; font-weight: bold;"> Hepatitis?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="hepatitis" value="yes"> yes
			  		<input type="radio" name="hepatitis" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="alcoholtreatment">
			  			<span style="font-size: 18px; font-weight: bold;"> Alcohol/Drug Abuse Treatment in last 10yrs</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="alcoholtreatment" value="yes"> yes
			  		<input type="radio" name="alcoholtreatment" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="depressiontreatment">
			  			<span style="font-size: 18px; font-weight: bold;"> Depression/Anxiety Treatment?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="depressiontreatment" value="yes"> yes
			  		<input type="radio" name="depressiontreatment" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="abnormallabs">
			  			<span style="font-size: 18px; font-weight: bold;"> Abnormal Labs (ex. Liver or Renal Functions)?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="abnormallabs" value="yes"> yes
			  		<input type="radio" name="abnormallabs" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="gastrointestinal">
			  			<span style="font-size: 18px; font-weight: bold;"> Gastrointestinal (ex. Crohn''s, Ulcerative Colitis)?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="gastrointestinal" value="yes"> yes
			  		<input type="radio" name="gastrointestinal" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="prescriptionmedications">
			  			<span style="font-size: 18px; font-weight: bold;"> Are you currently taking and Prescription Medications?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="prescriptionmedications" value="yes"> yes
			  		<input type="radio" name="prescriptionmedications" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="deathincidence">
			  			<span style="font-size: 18px; font-weight: bold;"> Is there any incidence of or death prior to age 60 due to Heart Related Disease, Cancer or Stroke in your family?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="deathincidence" value="yes"> yes
			  		<input type="radio" name="deathincidence" value="no"> no
		  		</div>
			</div><br/>
			
			<br/>
			<br/>
			<div class="row">
		  		<div class="span7"><label for="drivingdecord"><span style="font-size: 22px; font-weight: bold;"> Driving Record:</span></label></div>
		  		<div class="span2"></div>
			</div>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="recklessdriving">
			  			<span style="font-size: 18px; font-weight: bold;"> In the last 5 years have you had a DUI or Reckless Driving?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="recklessdriving" value="yes"> yes
			  		<input type="radio" name="recklessdriving" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="accidents">
			  			<span style="font-size: 18px; font-weight: bold;"> In the last 3 years have you had 2 or more moving violation or accidents? </span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="accidents" value="yes"> yes
			  		<input type="radio" name="accidents" value="no"> no
		  		</div>
			</div><br/>
		    
			<br/>
			<div class="row">
		  		<div class="span7"><label for="deathincidence"><span style="font-size: 22px; font-weight: bold;"> Foreign Travel:</span></label></div>
		  		<div class="span2"></div>
			</div>
		    
		    <div class="row">
			  	<div class="span7">
			  		<label for="traveledoutside">
			  			<span style="font-size: 18px; font-weight: bold;"> Do you intend to travel or have you traveled outside the US (Primarily asking about last 12-24 months or next 12 months)? Actual planned trips only.?</span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="traveledoutside" value="yes"> yes
			  		<input type="radio" name="traveledoutside" value="no"> no
		  		</div>
			</div><br/>
			
			<div class="row">
			  	<div class="span7">
			  		<label for="hazardousactivities">
			  			<span style="font-size: 18px; font-weight: bold;">Avocations/, Hazardous Activities or Aviation ex. Private Pilots, Active Military/Reserves, Scuba, Auto or Motorcycle Racing, Mountain Climbing, Sky Sports) </span>
			  		</label>
			  	</div>
			  	<div class="span2">
		  			<input type="radio" name="hazardousactivities" value="yes"> yes
			  		<input type="radio" name="hazardousactivities" value="no"> no
		  		</div>
			</div><br/>
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