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
    <title>Display all jobSeeker</title>
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
 
  <body>
  <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
</p> 
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li><a href="userManager/admin.jsp">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
</div>
    <b>Display all JobSeeker:<b/>  
 <br> <br />
 
   <s:form method="post" action="/userManager/js!list.action">  

  	 	<s:textfield label="Please enter jobseeker user name" name="js.username"></s:textfield>
  	 	<s:textfield label="Please enter jobseeker email" name="js.email"></s:textfield>
  	  	<s:submit label="submit"/>	
   </s:form>
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="10%" height="37" align="center"><b>user name</B></td>
              <td width="10%" height="37" align="center"><b>Skill</b></td>
		      <td width="20%" height="37" align="center"><b>email</b></td>
		      <td width="15%" height="37" align="center"><b>phone</b></td>
		      <td width="15%" height="37" align="center"><b>expected salary</b></td>
              <td width="10%" height="37" align="center"><b>Employed</b></td>
		      <td width="5%" height="37" align="center"><b>update</b></td>
		      <td width="5%" height="37" align="center"><b>delete</b></td>
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
	           <td><a href="js!load?js.jsId=<s:property value="#seekers.jsId" />">update</a></td>
    	 	  <td><a href="js!delete?js.jsId=<s:property value="#seekers.jsId" />">delete</a></td>

        </tr>
         </s:iterator>
        
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
