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
  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
  <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
   <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	

<h3><span class="label label-info">Display All Interview Records:</span></h3>

<br />
<div class="panel-body">
 	 <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left"	cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info" height="37" align="center">
		      <td width="15%"><b>Job Title</b></td>
		      <td width="15%"><b>Job Seeker Name</b></td>
		      <td width="15%"><b>Job Seeker Phone</b></td>
		      <td width="15%"><b>CV Title</b></td>
		      <td width="15%"><b>Interview Time</b></td>
		      <td width="15%"><b>Status</b></td>
		      <td width="5%"><b>Update</b></td>
		      <td width="5%"><b>Delete</b></td>
          </tr>
 	
          <s:iterator value="irs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
    		  <td align="center" ><a href="job!detail?job.jobId=${j.job.jobId}"><s:property value="#j.job.title" /></a></td>
    		  <td align="center" ><a href="js!detail?js.jsId=${j.js.jsId}"><s:property value="#j.js.username" /></a></td>
    		  <td align="center" ><s:property value="#j.js.phone" /></td>
    		  <td align="center" ><a href="downLoadCV.action?filename=<s:property value='#j.cv.cvTitle' />"><s:property value="#j.cv.cvTitle" /></a></td>
        	  <td align="center" ><s:property value="#j.interviewTime" /></td>
        	  <td align="center" >
                <s:if test="status == 1">
                    No interview
                </s:if>
                <s:elseif test="status == 2">
                    Interview Success
                </s:elseif>
                <s:else>
                    Interview Fail
                </s:else>
              </td>
        	  <td><a href="ir!preUpdate?ir.interviewId=<s:property value="#j.interviewId" />"><img src="images/edit.png" title="edit" alt="edit" height="25" width="30" ></a></td>
        	  <td><a href="ir!delete?ir.interviewId=<s:property value="#j.interviewId" />"><img src="images/delete.png" title="delete" alt="delete" height="20" width="25" ></a></td>
          </tr>
     </s:iterator>
    </table>
    </div>
  </body>
</html>
