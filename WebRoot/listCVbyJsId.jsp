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
    <title>Display CV</title>
    
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
<br/>
  
    <b>Display All CV:</b> 
    
 <br> <br />
 
  <s:form method="post" action="job!listCVByJsId.action"> 
 <!--   <input type="hidden" name="job.jobId" value="<s:property value='job.jobId' />"><br>-->
 <!--   <input type="hidden" name="js.jsId" value="<s:property value='#seekers.jsId' />"><br>-->
  
  <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
 	 	 	  <td width="15%" height="37" align="center"><b>Cover Letter</b></td>
		   </tr>

  	 <s:iterator value="cs" id="c">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
	          <td align="center"><s:property value="#c.coverLetter"/></td>
		  <td align="center"><a href="downLoadCV.action?filename=<s:property value='#c.cvTitle' />"><s:property value='#c.cvTitle' /> </a></td></td>
		 <!-- <td align="center" > <a href="downLoadCV.action?filename=<s:property value='#c.cvTitle' />">group journal.docx</a></td>-->
		  </tr>

    </s:iterator>
  </s:form>
  		

  </body>
</html>
