<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

    <title>Add Past Experience</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <b> Add Past Experience </b>
    <form method="post" action="pe.action">
    	Job Description:<input type="text" name="pe.jobDescription"><br> 
    	Duty:<input type="text" name="pe.duty"><br>
    	Employer Name:<input type="text" name="pe.empName"><br>
    	Email:<input type="email" name="pe.email"><br>
    	Phone:<input type="text" name="pe.phone"><br>
    	Address:<input type="text" name="pe.address"><br>
    	Start Date:<input name="pe.startDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  /><br>	
    	End Date:<input name="pe.endDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"  /><br>	
    	Reason For Leave:<input type="text" name="pe.reasonForLeave"><br>
    	JobSeeker Id:<input type="text" name="pe.jobSeeker.jsId" value="<s:property value='#session.jobSeeker.jsId'/>"readonly><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
