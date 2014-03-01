<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title> add CV</title>
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
  </head>

  <body>
  <p align="right">
Hello <s:property value="#session.jobSeeker.username"/><br/>
<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a> 
<a href="js!logout.action">Logout</a>
</p> 
<div align="center" id="header">
<h1><i>Recruitment Solution</i></h1>
<div class="menu_20124162">
	<ul>
    	<li><a href="job!logged.action">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>

    </ul>
</div>
</div>
<br/><br/>
  <b> Add CV </b>
    <form method="post" action="apply.action" >
    <input type="hidden" name="jobId" value="<s:property value="jobId" />"/>
    	<table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td colspan="2" width="5%" height="37" align="center"><b>Apply Job</b></td>
		</tr>
    	 <s:iterator value="cvsList" id="cs">
	      <tr bgcolor="#EFF3F7" class="TableBody1" ">
	      <td><input type="radio" name="applyJob.radioList" value="<s:property value="#cs.cvId" />" /></td>
		  <td align="center" ><s:property value="#cs.cvTitle" /></td>
        </tr>
     </s:iterator>
     </table>
    	
    	<input type="submit" value="submit"/>
    </form>
  </body>
  <s:debug></s:debug> 
</html>
