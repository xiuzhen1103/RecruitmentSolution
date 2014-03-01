<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Update Job</title>
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
    <form method="post" action="updateJob">
    	job Id: <input type="text" name="jInfo.jobId"><br>
    	jobDesc:<input type="text" name="jInfo.jobDesc"><br>
    	startDate:<input type="text" name="jInfo.startDate"><br>
    	address:<input type="text" name="jInfo.address"><br>
    	phone:<input type="text" name="jInfo.phone"><br>
    	numPosition:<input type="text" name="jInfo.numPosition"><br>
    	requirement:<input type="text" name="jInfo.requirement"><br>
    	salary:<input type="text" name="jInfo.salary"><br>
    	empId:<input type="text" name="jInfo.employer.empId"><br>
    	areaId:<input type="text" name="jInfo.area.areaId"><br>
    	jobCategoryId: <input type="text" name="jInfo.jobCategory.jobCategoryId"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
