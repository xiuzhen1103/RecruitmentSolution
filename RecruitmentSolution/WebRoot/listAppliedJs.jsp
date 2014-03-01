<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Display all jobSeeker</title>
 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

  <body>
  <p align="right">
Hello <s:property value="#session.employer.username"/><br/>
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a> <br/>
</p> 
<div align="center" id="header">
<h1><i>Recruitment Solution</i></h1>
<div class="menu_20124162">
	<ul>
    	<li><a href="emp!logged.action">Main</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>

    </ul>
</div>
</div><br />
    <b>Display All JobSeeker:<b/>  
 <br> <br />

 
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>JobSeeker Id</b></td>
		      <td width="10%" height="37" align="center"><b>User Name</B></td>
		      <td width="10%" height="37" align="center"><b>Name</b></td>
		      <td width="20%" height="37" align="center"><b>Address</b></td>
		      <td width="20%" height="37" align="center"><b>Email</b></td>
		      <td width="15%" height="37" align="center"><b>Phone</b></td>
		      <td width="15%" height="37" align="center"><b>Expected Salary</b></td>
		      <td width="15%" height="37" align="center"><b>View CV</b></td>
          </tr>
      
          <s:iterator value="listJobseekers" id="seekers">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		      <td align="center" ><s:property value="#seekers.jsId"/>   </td>
	          <td align="center"><s:property value="#seekers.username"/></td>
	          <td align="center"><s:property value="#seekers.name"/></td>
	          <td align="center"><s:property value="#seekers.address"/></td>
	          <td align="center"><s:property value="#seekers.email"/></td>
	          <td align="center"><s:property value="#seekers.phone"/></td>
	          <td align="center"><s:property value="#seekers.expectedSalary"/></td>
	          <td align="center"> <a href="job!listCVByJsId.action?job.jobId=<s:property value='job.jobId' />&js.jsId=<s:property value='#seekers.jsId' />">View</a></td>
        </tr>
         </s:iterator>
    </table>
    

  </body>
</html>
