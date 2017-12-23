<%@page import="webapp.HelperClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="models.*" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<%@ include file="/WEB-INF/views/shared/navloginbar.jsp" %>
<script type="text/javascript">

	$( document ).ready(function() {
		$("#divNoGraph").show();
		$("#divHiddenCalculate").hide();
		$("#divHidden").hide();
		if($("#hdnShowGraph").val() == "true"){
			$("#divPaymentSchedule").show();
			$("#divNoGraph").hide();
			$("#divCalculate").show();
		}
		else{
			$("#divPaymentSchedule").hide();
			$("#divNoGraph").show();
			$("#divCalculate").hide();
		}
		
		if($("#hdnMessage").val() != ""){
			alert($("#hdnMessage").val());
		}
		
	});
	
</script>
</head>
<body>

<% String usertype = request.getParameter("usertype"); %>
<%! ArrayList<PaymentSchedule> dataList = null; %>
<%dataList = new HelperClass().GetScheduleGraphInfo(); %>
<input type="hidden" id="hdnShowGraph" name="hdnShowGraph" value="${showgraph}">
<input type="hidden" id="hdnMessage" name="hdnMessage" value="${message}">
<div id = "divNoGraph">
	<h3>No approved application</h3>
</div>
<div>
	
	<form action ="paymentschedule.do" method ="post">
	  	<div class="row" id = "divHiddenCalculate" >
				<div class="span8"><input class="input-block-level" id="applid" name="applid" value = "${applid}"></div>
				<div class="span8"><input class="input-block-level" id="showgraph" name="showgraph" value = "${showgraph}"></div>
				<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "${usertype}"></div>
			</div>
	  	<div id= "divCalculate">
				<button type="submit" class="btn btn-default">Calculate Installment</button>
		</div>
	</form>
</div>
<div id = "divPaymentSchedule">
	<table class="table table-striped">
	<thead>
	<tr>
	<th># Installment No</th>
	<th>Due Date</th>
	<th>Due amount</th>
	<th>Paid Amount </th>
	<th>Paid Flag </th>
	</tr>
	</thead>
	<!-- For dynamically inserting data -->
	<%for(int i = 0; i < dataList.size(); i++) {%>
	<tr>
	<td scope="row"><%= dataList.get(i).installmentNo %></td>
	<td><%= dataList.get(i).dueDate %></td>
	<td><%= dataList.get(i).dueAmount %></td>
	<td><%= dataList.get(i).paidAmount %></td>
	<td><%= dataList.get(i).paidFlag %></td>
	</tr>
	<%} %>
	</table>
	<form action ="payment.do" method ="post">
	<div class="row" id = "divHidden" >
		<div class="span8"><input class="input-block-level" id="usertype" name="usertype" value = "<%= usertype %>"></div>
		
	</div><br/>
</form>
</div>
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>
</html>