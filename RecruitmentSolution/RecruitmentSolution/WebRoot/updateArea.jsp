<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Update CV</title>
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
    <form method="post" action="updateArea">
    	area id: <input type="text" name="areaInfo.areaId"><br>
     	county:<input type="text" name="areaInfo.county"><br>
    	area:<input type="text" name="areaInfo.area"><br>
    	country:<input type="text" name="areaInfo.country"><br>
    	latitude:<input type="text" name="areaInfo.latitude"><br>
    	longitude:<input type="text" name="areaInfo.longitude"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>