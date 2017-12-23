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
		$("#divHiddenSubmit").hide();
		$("#divHiddenVerify").hide();
		$("#divRecalculate").hide();
		
		$("#divHiddenReject").hide();
		$("#divHiddenHold").hide();
		$("#divRecalculate").hide();
		$("#divHiddenRecalculate").hide();
		
    	if($("#hiddenIsemployee").val() == "true"){
    		//$("#divHiddenVerify").show();
    	}
    	else{
    		//$("#divHiddenSubmit").show();
    	}
    	//alert($("#hiddenNewSumAssured").val());
    	if($("#hiddenNewSumAssured").val() > 0){
    		
    		var newSumAssuredVal = $("#hiddenNewSumAssured").val();
    		alert("New Sum assured amount after revaluation is " + newSumAssuredVal);
    		$("#sumassured").val(newSumAssuredVal);
    	}
    	
    	if($("#hiddenusertype").val() == "C"){
    		$("#divHold").hide();
    		$("#divCustomerSubmit").hide();
    	}
    	
    	if($("#hiddenusertype").val() != "" && $("#hiddenusertype").val() != null){
    		$("#divCustomerSubmit").hide();
    	}
    	
    	if($("#hiddenusertype").val() == "L1MEDAPPR"){
    		//alert("Inside L1MEDAPPR");
    		$("#divRecalculate").show();
    	}
    	
    	if($("#hiddenIsNewApplication").val() == "true"){
    		$("#divHold").hide();
    		$("#divReject").hide();
    		$("#divVerify").hide();
    		$("#divRecalculate").hide();
    	}
    	
    	//alert($("#hiddenusertype").val());
	});

	$(function () {
		<!--$('#datetimepicker1').datetimepicker();-->
    });
        </script>

</head>
<body>
<input type="hidden" id="hiddenIsemployee" name="inputName" value="${isemployee}">
<input type="hidden" id="hiddenusertype" name="inputName" value="${usertype}">
<input type="hidden" id="hiddenNewSumAssured" name="newsumassured" value="${newsumassured}">
<input type="hidden" id="hiddenIsNewApplication" name="inputName" value="${newapplication}">
	<div class="container">
	  	<h2>Summary</h2>
	  	<form action ="personaldetails.do" method ="post">
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Personal Details:</span></label></div></div>
		    <div class="col-4"><div class="span4"><button type="submit" id="btnEditPersonal" class="btn btn-default">Edit</button></div></div>
			</div><br/>
	  		
	  		<div class="row">
		        <div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Name:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" name="name" value = "${name}" readonly></div></div>
      		</div><br/>
      		
		  	<div class="row">
		        <div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="email" name="email" value = "${email}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> DOB:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="dob" name="dob" value = "${dob}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Contact:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="contact" name="contact" value = "${contact}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Gender:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="gender" name="gender" value = "${gender}" readonly></div></div>
      		</div><br/>
			
			<br/>
			<br/>
	  	</form>
	  	
	  	<form action ="editregistrationdetails.do" method ="post">
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Proposal and Payer Details:</span></label></div></div>
		    <div class="col-4"><div class="span4"><button type="submit" id="btnEditProposalPayer" class="btn btn-default">Edit</button></div></div>
			</div><br/>
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="sameproposer"><span style="font-size: 18px; font-weight: bold;"> Is Proposer Same as LA:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="sameproposer" name="sameproposer" value = "${sameproposer}" readonly></div></div>
			</div><br/>
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="emailpr"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="namepr" name="namepr" value = "${namepr}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="emailpr"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="emailpr" name="emailpr" value = "${emailpr}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="dobpr"><span style="font-size: 18px; font-weight: bold;"> DOB:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="dobpr" name="dobpr" value = "${dobpr}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="contactpr"><span style="font-size: 18px; font-weight: bold;"> Contact:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="contactpr" name="contactpr" value = "${contactpr}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="genderpr"><span style="font-size: 18px; font-weight: bold;"> Gender:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="genderpr" name="genderpr" value = "${genderpr}" readonly></div></div>
			</div><br/>
	  		
	  		<!-- Section -->
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="sameproposer"><span style="font-size: 18px; font-weight: bold;"> Is Payer Same as LA:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="samepayer" name="samepayer" value = "${samepayer}" readonly></div></div>
			</div><br/>
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="emailpa"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="namepa" name="namepa" value = "${namepa}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="emailpa"><span style="font-size: 18px; font-weight: bold;"> Email:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="emailpa" name="emailpa" value = "${emailpa}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="dobpa"><span style="font-size: 18px; font-weight: bold;"> DOB:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="dobpa" name="dobpa" value = "${dobpa}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="contactpa"><span style="font-size: 18px; font-weight: bold;"> Contact:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="contactpa" name="contactpa" value = "${contactpa}" readonly></div></div>
			</div><br/>
			
			<div class="row">
	  		<div class="col-4"><div class="span3"><label for="genderpa"><span style="font-size: 18px; font-weight: bold;"> Gender:</span></label></div></div>
		    <div class="col-4"><div class="span8"><input class="input-block-level" id="genderpa" name="genderpa" value = "${genderpa}" readonly></div></div>
			</div><br/>
	  		
			<br/>
			<br/>
	  	</form>
	  	
	  	<form action ="editpolicydetails.do" method ="post">
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span3"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Policy Details:</span></label></div></div>
		    <div class="col-4"><div class="span4"><button type="submit" id="btnEditPersonal" class="btn btn-default">Edit</button></div></div>
			</div><br/>
	  		
	  		<div class="row">
		        <div class="col-4"><div class="span3"><label for="policy"><span style="font-size: 18px; font-weight: bold;"> Policy:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" name="policy" value = "${policy}" readonly></div></div>
      		</div><br/>
      		
		  	<div class="row">
		        <div class="col-4"><div class="span3"><label for="sumassured"><span style="font-size: 18px; font-weight: bold;"> Sum assured:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="sumassured" name="sumassured" value = "${sumassured}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span3"><label for="oldsumassured"><span style="font-size: 18px; font-weight: bold;"> Previous Sum assured:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="oldsumassured" name="oldsumassured" value = "${oldsumassured}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span3"><label for="policyterm"><span style="font-size: 18px; font-weight: bold;"> Policy Term:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="policyterm" name="policyterm" value = "${policyterm}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span3"><label for="frequency"><span style="font-size: 18px; font-weight: bold;"> Frequency:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="frequency" name="frequency" value = "${frequency}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span3"><label for="annualincome"><span style="font-size: 18px; font-weight: bold;"> Anual Income:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="annualincome" name="annualincome" value = "${annualincome}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span3"><label for="smoke"><span style="font-size: 18px; font-weight: bold;"> Smoke:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="smoke" name="smoke" value = "${smoke}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span3"><label for="weight"><span style="font-size: 18px; font-weight: bold;"> Current Weight:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="weight" name="weight" value = "${weight}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span3"><label for="Height"><span style="font-size: 18px; font-weight: bold;"> Height:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="Height" name="Height" value = "${height}" readonly></div></div>
      		</div><br/>
			
			<br/>
			<br/>
	  	</form>
	  	
	  	<form action ="editmedicaldetails.do" method ="post">
	  		
	  		<div class="row">
	  		<div class="col-4"><div class="span7"><label for="name"><span style="font-size: 18px; font-weight: bold;"> Medical Details:</span></label></div></div>
		    <div class="col-4"><div class="span4"><button type="submit" id="btnEditPersonal" class="btn btn-default">Edit</button></div></div>
			</div><br/>
	  		
	  		<div class="row">
		        <div class="col-4"><div class="span7"><label for="tobacco"><span style="font-size: 18px; font-weight: bold;"> Have you used tobacco in any form within the past 15 years?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" name="tobacco" value = "${tobacco}" readonly></div></div>
      		</div><br/>
      		
		  	<div class="row">
		        <div class="col-4"><div class="span7"><label for="heartdiseases"><span style="font-size: 18px; font-weight: bold;"> Coronary Artery Disease/Heart Related Diseases</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="heartdiseases" name="heartdiseases" value = "${heartdiseases}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span7"><label for="diabetes"><span style="font-size: 18px; font-weight: bold;"> Diabetes:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="diabetes" name="diabetes" value = "${diabetes}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span7"><label for="cancer"><span style="font-size: 18px; font-weight: bold;"> Cancer:</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="cancer" name="cancer" value = "${cancer}" readonly></div></div>
      		</div><br/>
			
			<div class="row">
		        <div class="col-4"><div class="span7"><label for="cerebralvasculardisease"><span style="font-size: 18px; font-weight: bold;"> Cerebral Vascular Disease or Stroke?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="cerebralvasculardisease" name="cerebralvasculardisease" value = "${cerebralvasculardisease}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="hepatitis"><span style="font-size: 18px; font-weight: bold;"> Hepatitis?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="hepatitis" name="hepatitis" value = "${hepatitis}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="alcoholtreatment"><span style="font-size: 18px; font-weight: bold;"> Alcohol/Drug Abuse Treatment in last 10yrs</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="alcoholtreatment" name="alcoholtreatment" value = "${alcoholtreatment}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="depressiontreatment"><span style="font-size: 18px; font-weight: bold;"> Depression/Anxiety Treatment?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="depressiontreatment" name="depressiontreatment" value = "${depressiontreatment}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="abnormallabs"><span style="font-size: 18px; font-weight: bold;"> Abnormal Labs (ex. Liver or Renal Functions)?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="abnormallabs" name="abnormallabs" value = "${abnormallabs}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="gastrointestinal"><span style="font-size: 18px; font-weight: bold;"> Gastrointestinal (ex. Crohn''s, Ulcerative Colitis)?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="gastrointestinal" name="gastrointestinal" value = "${gastrointestinal}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="prescriptionmedications"><span style="font-size: 18px; font-weight: bold;"> Are you currently taking and Prescription Medications?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="prescriptionmedications" name="prescriptionmedications" value = "${prescriptionmedications}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="deathincidence"><span style="font-size: 18px; font-weight: bold;"> Is there any incidence of or death prior to age 60 due to Heart Related Disease, Cancer or Stroke in your family?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="deathincidence" name="deathincidence" value = "${deathincidence}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		  		<div class="span7"><label for="drivingdecord"><span style="font-size: 22px; font-weight: bold;"> Driving Record:</span></label></div>
		  		<div class="span2"></div>
			</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="recklessdriving"><span style="font-size: 18px; font-weight: bold;"> In the last 5 years have you had a DUI or Reckless Driving?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="recklessdriving" name="recklessdriving" value = "${recklessdriving}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="accidents"><span style="font-size: 18px; font-weight: bold;"> In the last 3 years have you had 2 or more moving violation or accidents?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="accidents" name="accidents" value = "${accidents}" readonly></div></div>
      		</div><br/><br/>
      		
      		<div class="row">
		  		<div class="span7"><label for="deathincidence"><span style="font-size: 22px; font-weight: bold;"> Foreign Travel:</span></label></div>
		  		<div class="span2"></div>
			</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="traveledoutside"><span style="font-size: 18px; font-weight: bold;"> Do you intend to travel or have you traveled outside the US (Primarily asking about last 12-24 months or next 12 months)? Actual planned trips only.?</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="traveledoutside" name="traveledoutside" value = "${traveledoutside}" readonly></div></div>
      		</div><br/>
      		
      		<div class="row">
		        <div class="col-4"><div class="span7"><label for="hazardousactivities"><span style="font-size: 18px; font-weight: bold;"> Avocations/, Hazardous Activities or Aviation ex. Private Pilots, Active Military/Reserves, Scuba, Auto or Motorcycle Racing, Mountain Climbing, Sky Sports)</span></label></div></div>
		        <div class="col-4"><div class="span4"><input class="input-block-level" id="acchazardousactivitiesidents" name="hazardousactivities" value = "${hazardousactivities}" readonly></div></div>
      		</div><br/>
      		
			
			<br/>
			<br/>
	  	</form>
	  	
	  	<form action ="summary.do" method ="post">
	  	<div class="row" id = "divHiddenSubmit" >
				<div class="span8"><input class="input-block-level" id="contactpr" placeholder="Enter contact no" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="contactpr" placeholder="Enter contact no" name="customername" value = "${customername}"></div>
				<div class="span8"><input class="input-block-level" id="actiontype" name="actiontype" value = "submit"></div>
			</div>
	  	<div id= "divCustomerSubmit">
				<button type="submit" class="btn btn-default">Submit</button>
		</div>
	  	</form>
	  	
	  	<form action ="summary.do" method ="post">
	  	<div class="row" id = "divHiddenRecalculate" >
				<div class="span8"><input class="input-block-level" id="applid" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="customername" name="customername" value = "${customername}"></div>
				<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "${usertype}"></div>
				<div class="span8"><input class="input-block-level" id="actiontype" name="actiontype" value = "recalculate"></div>
				<div class="span8"><input class="input-block-level" id="hdnsumassured" name="hdnsumassured" value = "${sumassured}"></div>
				<div class="span8"><input class="input-block-level" id="oldsumassured" name="oldsumassured" value = "${oldsumassured}"></div>
				<div class="span8"><input class="input-block-level" id="yesCount" name="yesCount" value = "${yesCount}"></div>
				<div class="span8"><input class="input-block-level" id="yesnoString" name="yesnoString" value = "${yesnoString}"></div>
			</div>
	  	<div id= "divRecalculate">
				<button type="submit" class="btn btn-default">Recalculate Sum Assured</button>
		</div>
	  	</form>
	  	
	  	<form action ="viewpolicy.do" method ="post">
	  	<div class="row" id = "divHiddenVerify" >
				<div class="span8"><input class="input-block-level" id="applid" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="customername" name="customername" value = "${customername}"></div>
				<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "${usertype}"></div>
				<div class="span8"><input class="input-block-level" id="actiontype" name="usertype" value = "verify"></div>
			</div>
		<div id= "divDescription">
			<div class="col-4"><div class="span7"><input class="input-block-level" id="description" placeholder="Description" name="description" value = "${description}"></div></div>
		</div>
	  	<div id= "divVerify">
				<button type="submit" class="btn btn-default">Verify</button>
		</div>
	  	</form>
	  	
	  	<form action ="summary.do" method ="post">
	  	<div class="row" id = "divHiddenHold" >
				<div class="span8"><input class="input-block-level" id="applid" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="customername" name="customername" value = "${customername}"></div>
				<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "${usertype}"></div>
				<div class="span8"><input class="input-block-level" id="actiontype" name="actiontype" value = "hold"></div>
			</div>
	  	<div id= "divHold">
				<button type="submit" class="btn btn-default">Hold</button>
		</div>
	  	</form>
	  	<form action ="summary.do" method ="post">
	  	<div class="row" id = "divHiddenReject" >
				<div class="span8"><input class="input-block-level" id="applid" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="customername" name="customername" value = "${customername}"></div>
				<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "${usertype}"></div>
				<div class="span8"><input class="input-block-level" id="actiontype" name="actiontype" value = "reject"></div>
			</div>
	  	<div id= "divReject">
				<button type="submit" class="btn btn-default">Reject</button>
		</div>
	  	</form>
	  	
	</div>

</body>
<%@ include file="./shared/footer.jsp" %>
</html>