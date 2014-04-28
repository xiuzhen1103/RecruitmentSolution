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
    <title>Display all Jobs</title>

  </head>
 
  <body>

<p align="right">
Hello <s:property value="#session.jobSeeker.username"/>
<img src="upload/js/<s:property value='#session.jobSeeker.image'/>" title="profile_image" alt="profile_image" height="30" width="30" >	
<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a> 

<a href="js!logout.action">Logout</a>
</p>
<div class="banner">
</div> 
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!logged.action">Home</a></li>
  <li><a href="cv!list.action" target="_bank">Manage CV</a> </li>
   <li><a href="ir!listMySend">Interview History</a> </li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>

<h3><span class="label label-info">Display My Interview Records:</span></h3>   

 	 <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info" align="center" height="37">

		      <td width="20%"><b>Job Title</b></td>
		      <td width="10%" ><b>Interviewee Phone</b></td>
		      <td width="15%"><b>Memo</b></td>
		      <td width="20%" ><b>CV Title</b></td>
		      <td width="15%"><b>Interview Time</b></td>
		      <td width="10%"><b>Status</b></td>
          </tr>
 	
          <s:iterator value="irs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
    		
    		  <td align="center" ><a href="job!detail?job.jobId=${j.job.jobId}"><s:property value="#j.job.title" /></a></td>
    		  <td align="center" ><s:property value="#j.phone" /></td>
    		  <td align="center" ><s:property value="#j.memo" /></td>
    		  <td align="center" ><a href="downLoadCV.action?filename=<s:property value='#j.cv.cvTitle' />"><s:property value="#j.cv.cvTitle" /> </a></td>
        	  <td align="center" ><s:property value="#j.interviewTime" /></td>
        	  <td align="center" >
                <s:if test="status == 1">
                    No interview
                </s:if>
                <s:elseif test="status == 2">
                    interview success
                </s:elseif>
                <s:else>
                    interview fail
                </s:else>
              </td>
          </tr>
     </s:iterator>
    </table>
    
  </body>
</html>
