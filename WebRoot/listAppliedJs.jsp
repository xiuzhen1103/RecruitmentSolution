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
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
  </head>

  <body>
  <p align="right">
Hello <s:property value="#session.employer.username"/>
<img src="upload/emp/<s:property value='#session.employer.image'/>" title="profile_image" alt="profile_image" height="50" width="50" >
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a>
</p>
	<div class="banner" >	

</div>

		
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="empLog.action">Home</a></li>
  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Post Job</a></li>
  <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
   <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	

 
 	 <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left"
							cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info">

		      <td width="10%" height="37" align="center"><b>Image Profile</B></td>
		      <td width="10%" height="37" align="center"><b>Name</b></td>
		      <td width="20%" height="37" align="center"><b>Address</b></td>
		      <td width="20%" height="37" align="center"><b>Email</b></td>
		      <td width="15%" height="37" align="center"><b>Phone</b></td>
		      <td width="15%" height="37" align="center"><b>Expected Salary</b></td>
		      <td width="15%" height="37" align="center"><b>View CV</b></td>
          </tr>
      
          <s:iterator value="listJobseekers" id="seekers">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		
	          <td align="center"> <img src=upload/js/<s:property value="#seekers.image" /> height="50" width="50"/></td>
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
