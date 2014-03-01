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
  Update Employer:
    <form method="post" action="updateEmp">
  	    employer id:<input type="text" name="emInfo.empId"><br>
    	phone:<input type="text" name="emInfo.phone"><br>
    	contact: name:<input type="text" name="emInfo.contactName"><br>
    	company name:<input type="text" name="emInfo.companyName"><br>
    	address:<input type="text" name="emInfo.address"><br>
    	website: <input type="text" name="emInfo.webSite"><br>
    	company size: <input type="text" name="emInfo.companySize"><br>
    	company type: <input type="text" name="emInfo.companyType"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
