<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> JobSeeker Register</title>
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
  <b> Add Area </b>
    <form method="post" action="area.action">
    	ParentId:<input type="text" name="area.parentArea"><br>
    	Area Name:<input type="text" name="area.areaName"><br>
		Level:<input type="text" name="area.level"><br>
    	Latitude:<input type="text" name="area.latitude"><br>
    	Longitude:<input type="text" name="area.longitude"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
