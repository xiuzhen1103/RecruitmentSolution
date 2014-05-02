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
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <title>Display All Jobs</title>
   
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
  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
    <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
     <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	

<h3><span class="label label-info">Display All Jobs:</span></h3>
<div id="reg">
<a href="job!registerJob.action"><img src="images/add.png" title="add" alt="add" height="30" width="30" ></a>
</div>
<br />
<div class="panel-body">
 	 <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left"
							cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info"  height="37" align="center">
		      <td width="10%"><b>Job Title</b></td>
              <td width="10%"><b>Job Category</b></td>
              <td width="10%"><b>Skill Category</b></td>
              <td width="10%"><b>Skill</b></td>
		      <td width="5%"><b>Salary</b></td>
		      <td  width="5%"><b>Area</b></td>
              <td width="10%"><b>Create Time</b></td>
              
		       <td width="5%"><b>Update</b></td>
		      <td width="5%"><b>Delete</b></td>
		      <td width="5%"><b>View applied</b></td>
          </tr>
 	
          <s:iterator value="jobs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><a href="job!detail?job.jobId=${j.jobId}"><s:property value="#j.title" /></a></td>

          <td align="center" >
            <s:property value="#j.jobCategory.name" />
          </td>
          <td align="center" >
            <s:property value="#j.skillCategory.name" />
          </td>
    	  <td align="center" >
            <s:iterator value="#j.jobSkills" var="js" status="st">
                ${js.skill.name}<s:if test="!#st.last">,</s:if>
            </s:iterator>
          </td>
    	  <td align="center" ><s:property value="#j.salary" /></td>
        <td align="center" ><s:property value="#j.districtId.areaName" />,<s:property value="#j.countyId.areaName" /></td>
          <td align="center" ><s:property value="#j.createTime" /></td>
    	  <td><a href="job!load?job.jobId=<s:property value="#j.jobId" />"><img src="images/edit.png" title="edit" alt="edit" height="25" width="30" ></a></td>
    	  <td><a href="job!delete?job.jobId=<s:property value="#j.jobId" />"><img src="images/delete.png" title="delete" alt="delete" height="25" width="20" ></a></td>
    	  <td><a href="job!listAppliedJs?job.jobId=<s:property value="#j.jobId" />">Applied</a></td>
    	  
        </tr>
     </s:iterator>
    </table>
  </div>
  </body>
</html>
