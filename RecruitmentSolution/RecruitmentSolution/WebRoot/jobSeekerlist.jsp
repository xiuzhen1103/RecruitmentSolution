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
    
    <title>Display all jobSeeker/title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
 
  <body>
    <b>Display all jobSeeker:<b/>  
 <br> <br />

 	 <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>jobSeeker Id</b></td>
		      <td width="10%" height="37" align="center"><b>user name</B></td>
		      <td width="10%" height="37" align="center"><b>name</b></td>
		      <td width="20%" height="37" align="center"><b>address</b></td>
		      <td width="20%" height="37" align="center"><b>email</b></td>
		      <td width="15%" height="37" align="center"><b>phone</b></td>
		      <td width="15%" height="37" align="center"><b>expected salary</b></td>
          </tr>
          <s:iterator value="jobseekers" id="seekers">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		      <td align="center" ><s:property value="#seekers.jsId"/>   </td>
	          <td align="center"><s:property value="#seekers.username"/></td>
	          <td align="center"><s:property value="#seekers.name"/></td>
	          <td align="center"><s:property value="#seekers.address"/></td>
	          <td align="center"><s:property value="#seekers.email"/></td>
	          <td align="center"><s:property value="#seekers.phone"/></td>
	          <td align="center"><s:property value="#seekers.expectedSalary"/></td>
        </tr>
     </s:iterator>
    </table>

    <s:debug></s:debug>
  </body>
</html>
