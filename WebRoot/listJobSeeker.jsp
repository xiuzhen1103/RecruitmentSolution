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
    <title>Display All JobSeekers</title>
  </head>
 
  <body>
 <p align="right">
Hello <s:property value="#session.employer.username"/><br/>
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
  <li class="active" >News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>
<h3><span class="label label-info">Display All JobSeeker:</span></h3>

 <br />
   <form method="post" action="js!list.action" >  
   User Name:<input type="text" name="js.username"  placeholder="Please Enter A User Name"/>
   Email:<input type="text" name="js.email"  placeholder="Please Enter Email"/>
  	  	<button type="submit" class="btn btn-sm btn-primary">Submit</button>
   </form>
   <div class="panel-body">
 	<table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left"
							cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info">
		      <td width="10%" height="37" align="center"><b>User Name</B></td>
		      <td width="10%" height="37" align="center"><b>Skill</b></td>
		      <td width="20%" height="37" align="center"><b>Email</b></td>
		      <td width="15%" height="37" align="center"><b>Phone</b></td>
		      <td width="15%" height="37" align="center"><b>Expected Salary</b></td>
		      <td width="5%" height="37" align="center"><b>Employed</b></td>
          </tr>
      
          <s:iterator value="jobseekers" id="seekers">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
	          <td align="center"><a href="js!detail?js.jsId=${seekers.jsId}"><s:property value="#seekers.username"/></a></td>
	          <td align="center">
                <s:iterator var="jsk" value="#seekers.jobSeekerSkill" status="st">
                    ${jsk.skill.name}<s:if test="!#st.last">,</s:if>
                </s:iterator>
              </td>
	          <td align="center"><s:property value="#seekers.email"/></td>
	          <td align="center"><s:property value="#seekers.phone"/></td>
	          <td align="center"><s:property value="#seekers.expectedSalary"/></td>
	          <td align="center">
                <s:if test="#seekers.status == 0">No</s:if>
                <s:else>Yes</s:else>
              </td>
        </tr>
         </s:iterator>
        
    </table>
</div>
  </body>
</html>
