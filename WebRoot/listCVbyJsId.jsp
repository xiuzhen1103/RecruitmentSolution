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
			Hello
			<s:property value="#session.employer.username" />
			<br />
			<a
				href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
			<a href="emp!logout.action">Logout</a>
			<br />
		</p>
<div class="banner">
</div> 
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!logged.action">Home</a></li>
  <li class="active">News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>
  

    <h3><span class="label label-info">Display All CV:</span></h3>
    
 <br> <br />
 
  <s:form method="post" action="job!listCVByJsId.action"> 
 <!--   <input type="hidden" name="job.jobId" value="<s:property value='job.jobId' />"><br>-->
 <!--   <input type="hidden" name="js.jsId" value="<s:property value='#seekers.jsId' />"><br>-->
  
  <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="1" align="left"
							cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info">
 	 	 	  <td width="30%" height="37" align="center"><b>Cover Letter</b></td>
 	 	 	  <td width="15%" height="37" align="center"><b>CV</b></td>
 	 	 	  <td width="15%" height="37" align="center"><b>Send Interview</b></td>
		   </tr>
  	 <s:iterator value="cs" id="c">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
	       <td align="center" style="width:400px;height:200px;"><s:property value="#c.coverLetter"  /></td>
	       
		  <td align="center"><a href="downLoadCV.action?filename=<s:property value='#c.cvTitle' />"><s:property value="#c.cvTitle" /> </a></td>
          <td align="center"><a href="ir!preSend?ir.job.jobId=${job.jobId}&ir.js.jsId=${js.jsId}&ir.cv.cvId=${c.cvId}">Send Interview Letter</a></td>
		 <!-- <td align="center" > <a href="downLoadCV.action?filename=<s:property value='#c.cvTitle' />">group journal.docx</a></td>-->
		  </tr>
    </s:iterator>
    </table>
  </s:form>
  </body>
</html>
