<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>
    <base href="<%=basePath%>">
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Display all Jobs</title>
    
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
    	<li><a href="empLog.action">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>

    </ul>
</div>
  </div>
    <b>Display all Jobs:</b>  
 <br> <br />
 <s:form method="post" action="job!list.action">
<!-- <s:textfield label="Please enter Job id" name="job.jobId"></s:textfield>  -->
  		<s:textfield label="Please Enter Job Title" name="job.title"></s:textfield>
  
  		<s:submit label="submit"/>
  			</s:form>

 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Job Id</b></td>
		      <td width="10%" height="37" align="center"><b>Job Title</b></td>
		      <td width="10%" height="37" align="center"><b>Job Description</b></td>
		      <td width="15%" height="37" align="center"><b>Start Date</b></td>
		      <td width="20%" height="37" align="center"><b>Address</b></td>
		      <td width="10%" height="37" align="center"><b>Phone</b></td>
		      <td width="5%" height="37" align="center"><b>Number of Position</b></td>
		      <td width="20%" height="37" align="center"><b>Requirement</b></td>
		      <td width="5%" height="37" align="center"><b>Salary</b></td>
		      <td width="5%" height="37" align="center"><b>Company Name</b></td>
		      <td width="5%" height="37" align="center"><b>Country</b></td>
		      <td width="5%" height="37" align="center"><b>County</b></td>
		      <td width="5%" height="37" align="center"><b>District</b></td>
		      <td width="5%" height="37" align="center"><b>Employer Id</b></td>
		       <td width="5%" height="37" align="center"><b>Update</b></td>
		      <td width="5%" height="37" align="center"><b>Delete</b></td>
		      <td width="5%" height="37" align="center"><b>View applied</b></td>
          </tr>
 	
          <s:iterator value="jobs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#j.jobId" /></td>
		  <td align="center" ><s:property value="#j.title" /></td>
		  <td align="center" ><s:property value="#j.jobDesc" /></td>
		  <td align="center" ><s:property value="#j.startDate" /></td>
		  <td align="center" ><s:property value="#j.address" /></td>
    	  <td align="center" ><s:property value="#j.phone" /></td>
    	  <td align="center" ><s:property value="#j.numPosition" /></td>
    	  <td align="center" ><s:property value="#j.requirement" /></td>
    	  <td align="center" ><s:property value="#j.salary" /></td>
    	  <td align="center" ><s:property value="#j.employer.companyName" /></td>
    	  <td align="center" ><s:property value="#j.countryId.areaName" /></td> 
    	 <td align="center" ><s:property value="#j.countyId.areaName" /></td>
    	 <td align="center" ><s:property value="#j.districtId.areaName" /></td> 
    	  <td align="center" ><s:property value="#j.employer.empId" /></td>
    	  <td><a href="job!load?job.jobId=<s:property value="#j.jobId" />">Update</a></td>
    	  <td><a href="job!delete?job.jobId=<s:property value="#j.jobId" />">Delete</a></td>
    	  <td><a href="job!listAppliedJs?job.jobId=<s:property value="#j.jobId" />">Applied</a></td>
    	  
        </tr>
     </s:iterator>
    </table>

  </body>
</html>
