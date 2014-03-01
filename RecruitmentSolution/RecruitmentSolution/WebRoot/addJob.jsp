<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

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
  <b> Add Job </b>
    <form method="post" action="job.action">
    	jobDesc:<input type="text" name="info.jobDesc"><br>
    	start date:<input name="info.startDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  /><br>	
    	<!--startDate:<input type="date" name="jInfo.startDate"><br> -->
    	address:<input type="text" name="info.address"><br>
    	phone:<input type="text" name="info.phone"><br>
    	numPosition:<input type="text" name="info.numPosition"><br>
    	requirement:<input type="text" name="info.requirement"><br>
    	salary:<input type="text" name="info.salary"><br>
    	empId:<input type="text" name="info.employer.empId"><br>
    	areaId:<input type="text" name="info.area.areaId"><br>
    	jobCategoryId: <input type="text" name="info.jobCategory.jobCategoryId"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
