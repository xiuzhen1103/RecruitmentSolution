<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Employer Login Page </title>
</head>
<body>
		<s:form method="post" action="empLogin">
		
		<s:textfield label="email" name="eInfo.email"></s:textfield>
		<s:textfield label="password" name="eInfo.password"></s:textfield>
		<s:submit label="submit"/>
			</s:form>
</body>
</html>