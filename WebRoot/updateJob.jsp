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
    	Job Id: <input type="text" name="job.jobId" ><br>
    	Job Desc:<input type="text" name="job.jobDesc"><br>
    	Start Date:<input name="job.startDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  /><br>	
    	Address:<input type="text" name="job.address"><br>
    	Phone:<input type="text" name="job.phone"><br>
    	Num Position:<input type="text" name="job.numPosition"><br>
    	Requirement:<input type="text" name="job.requirement"><br>
    	Salary:<input type="text" name="job.salary"><br>
    	EmpId:<input type="text" name="job.employer.empId"><br>
    	Area Id:<input type="text" name="job.area.areaId"><br>
    	JobCategory Id: <input type="text" name="job.jobCategory.jobCaId"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
