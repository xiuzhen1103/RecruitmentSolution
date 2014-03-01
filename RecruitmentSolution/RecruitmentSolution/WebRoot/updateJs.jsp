<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Update jobSeeker</title>
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
    <form method="post" action="updateJs">
  	    jobSeeker id:<input type="text" name="info.jsId"><br>
    	name:<input type="name" name="info.name"><br>
    	address:<input type="address" name="info.address"><br>
    	phone:<input type="phone" name="info.phone"><br>
    	expected Salary<input type="expectedSalary" name="info.expectedSalary"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
