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
  	    Employer Id:<input type="text" name="emp.empId"><br>
    	phone:<input type="text" name="emp.phone"><br>
    	Contact Name:<input type="text" name="emp.contactName"><br>
    	Company Name:<input type="text" name="emp.companyName"><br>
    	Address:<input type="text" name="emp.address"><br>
    	Website: <input type="text" name="emp.webSite"><br>
    	Company Size: <input type="text" name="emp.companySize"><br>
    	Company Type: <input type="text" name="emp.companyType"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
