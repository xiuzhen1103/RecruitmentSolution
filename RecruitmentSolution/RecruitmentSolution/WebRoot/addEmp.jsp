<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>JobSeeker Register </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <form method="post" action="emp.action">
    	username:<input type="text" name="username"><br>
    	password:<input type="password" name="password"><br>
    	password:<input type="password" name="password2"><br>
    	email:<input type="email" name="email"><br>
    	phone:<input type="text" name="phone"><br>
    	contact name:<input type="text" name="contactName"><br>
    	company name:<input type="text" name="companyName"><br>
    	address:<input type="text" name="address"><br>
    	webSite:<input type="text" name="webSite"><br>
    	companySize:<input type="text" name="companySize"><br>
    	companyType:<input type="text" name="companyType"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
