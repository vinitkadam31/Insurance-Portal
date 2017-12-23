<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<%@ include file="/WEB-INF/views/shared/navloginbar.jsp" %>
</head>
<body>
Hello ${name} = ${usertype}
<form action = "viewpolicy.do" method = "post">
</form>
	<button class="btn btn-large btn-primary" type="submit">View Policy</button>
</body>
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>
</html>