<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Administrator Login Page </title>
</head>
<body>
		<s:form method="post" action="adminLogin">
		<s:textfield label="username" name="adminInfo.username"></s:textfield>
		<s:textfield label="password" name="adminInfo.password"></s:textfield>
		<s:submit label="submit"/>
		</s:form>
</body>
</html>