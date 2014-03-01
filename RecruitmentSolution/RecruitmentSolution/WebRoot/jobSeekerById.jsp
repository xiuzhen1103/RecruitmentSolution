<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> Find job seeker by Id </title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <s:form method="post" action="searchJs">  
  		<s:textfield label="Please enter jobseeker Id" name="info.jsId"></s:textfield>
  <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
  
 	 	 <tr>
		      <td width="10%" height="37" align="center"><b>user name</B></td>
		      <td width="10%" height="37" align="center"><b>name</b></td>
		      <td width="20%" height="37" align="center"><b>address</b></td>
		      <td width="20%" height="37" align="center"><b>email</b></td>
		      <td width="15%" height="37" align="center"><b>phone</b></td>
		      <td width="15%" height="37" align="center"><b>expected salary</b></td>
          </tr>
          </table>
  

  		  <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">	
		  <td align="center" ><s:property value="jobSeeker.username" /></td>
    	  <td align="center" ><s:property value="jobSeeker.name" /></td>
    	  <td align="center" ><s:property value="jobSeeker.address" /></td>
    	  <td align="center" ><s:property value="jobSeeker.email" /></td>
    	  <td align="center" ><s:property value="jobSeeker.phone" /></td>
    	  <td align="center" ><s:property value="jobSeeker.expectedSalary" /></td>
    	
    	<s:submit label="submit"/>	
	</s:form>
	</table>
    <s:debug></s:debug>
  </body>
</html>
