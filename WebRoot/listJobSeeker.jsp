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
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Display All JobSeeker</title>
  </head>
 
  <body>
 <p align="right">
Hello <s:property value="#session.employer.username"/><br/>
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a>
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
</div> <br />
    <b>Display All JobSeeker:</b> <br />

 
   <s:form method="post" action="js!list.action">  
  	 	<s:textfield label="Please Enter Jobseeker User Name" name="js.username"></s:textfield>
  	 	<s:textfield label="Please Enter Jobseeker Email" name="js.email"></s:textfield>
  	  	<s:submit label="submit"/>	
   </s:form>
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="10%" height="37" align="center"><b>User Name</B></td>
		      <td width="10%" height="37" align="center"><b>Skill</b></td>
		      <td width="20%" height="37" align="center"><b>Email</b></td>
		      <td width="15%" height="37" align="center"><b>Phone</b></td>
		      <td width="15%" height="37" align="center"><b>Expected Salary</b></td>
		      <td width="10%" height="37" align="center"><b>Employed</b></td>
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

  </body>
</html>
