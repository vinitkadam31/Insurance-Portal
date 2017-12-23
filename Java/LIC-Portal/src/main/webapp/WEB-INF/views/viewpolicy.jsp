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
		$("#divHidden").hide();
		//alert($("#hiddenPolicyCount").val());
		if($("#hiddenPolicyCount").val()=="0"){
			//hide policy table and display no plicies present message
		}
	});
	
</script>
</head>
<body>

<% String usertype = request.getParameter("usertype"); %>
<%! ArrayList<ViewPolicyData> dataList = null;//new HelperClass().GetAllPolicies(); %>
<%dataList = new HelperClass().GetAllPolicies(); %>
<input type="hidden" id="hiddenPolicyCount" name="inputName" value="<%= dataList.size() %>">
<div id = "divViewPolicy">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>#</th>
				<th>Name</th>
				<th>Product Name</th>
				<th> Stage Description </th>
				<th> Is Verified </th>
				<th> Remarks </th>
				<th> Details </th>
				<th> Link </th>
				<% if(usertype.equalsIgnoreCase("PAY")) {%>
				<th> Payment </th>
				<%} %>
			</tr>
		</thead>
		<!-- For dynamically inserting data -->
		<%for(int i = 0; i < dataList.size(); i++) {%>
		<tr>
			<td scope="row"><%= (i+1) %></td>
			<td><%= dataList.get(i).getCustomerName() %></td>
			<td><%= dataList.get(i).getProductName() %></td>
			<td><%= dataList.get(i).getStageDesc() %></td>
			<td><%= dataList.get(i).getIsVerified() %></td>
			<td><%= dataList.get(i).getRemarks() %></td>
			<td><a href="summary.do?applid=<%=dataList.get(i).getApplicationId()%>&isemployee=true&usertype=<%= usertype %>">Details</a></td>
			<td><a href="approveapplication.do?applid=<%=dataList.get(i).getApplicationId()%>&usertype=<%= usertype %>">Submit</a></td>
			<% if(usertype.equalsIgnoreCase("PAY")) {%>
			<td><a href="payment.do?applid=<%=dataList.get(i).getApplicationId()%>&usertype=<%= usertype %>&customername=<%= dataList.get(i).getCustomerName() %>">Pay</a></td>
			<%} %>
			<!-- <td><a href="summary.jsp?key=<%=dataList.get(i).getApplicationId()%>"><%=dataList.get(i).getProductName()%></a></td> -->
		</tr>
		<%} %>
	</table>
</div>
<div class="row" id = "divHidden" >
	<div class="span8"><input class="input-block-level" id="usertype" placeholder="Enter contact no" name="usertype" value = "<%= usertype %>"></div>
	
</div><br/>

<%@ include file="/WEB-INF/views/shared/footer.jsp" %>
</html>