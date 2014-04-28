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
    <title>Display CV</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  
<div id="reg">
<a href="addCV.jsp"><img src="images/add.png" title="add" alt="add" height="40" width="40" ></a> 
  <s:form method="post" action="cv!list.action"> 
   <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info"> 
 	 	 	<td width="30%" height="37" align="center" ><b>Cover Letter</b></td>
		      <td width="5%" height="37" align="center" ><b>My CVs</b></td>

		     <td width="5%" height="37" align="center" ><b>Delete</b></td>
		     <td width="5%" height="37" align="center" ><b>Update</b></td>
		      
		   </tr>
  
   
  	 <s:iterator value="cvs" id="c">
  	<input type="hidden" value="<s:property value='#c.cvId' />" />
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#c.coverLetter" /></td>

		  <td align="center" > <a href="downLoadCV.action?filename=<s:property value='#c.cvTitle' />"><s:property value="#c.cvTitle" /></td>

    	  <td><a href="cv!delete?cv.cvId=<s:property value="#c.cvId" />"><img src="images/delete.png" title="delete" alt="delete" height="25" width="20" ></a></td>
    	  <td><a href="cv!load?cv.cvId=<s:property value="#c.cvId" />"><img src="images/edit.png" title="edit" alt="edit" height="20" width="25" ></a></td>
		  </tr>

    </s:iterator>
    </table>
  </s:form>
  		</div>
  </body>
</html>
