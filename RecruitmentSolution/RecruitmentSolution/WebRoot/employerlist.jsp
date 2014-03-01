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
    
    <title>Display all Employer</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
 
  <body>
    <b>Display all Employer:<b/>  
 <br> <br />
 	 <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Employer Id</b></td>
		      <td width="10%" height="37" align="center"><b>user name</B></td>
		      <td width="10%" height="37" align="center"><b>email</b></td>
		      <td width="20%" height="37" align="center"><b>phone</b></td>
		      <td width="5%" height="37" align="center"><b>contact name</b></td>
		      <td width="15%" height="37" align="center"><b>company name</b></td>
		      <td width="20%" height="37" align="center"><b>address</b></td>
		      <td width="15%" height="37" align="center"><b>website</b></td>
		      <td width="15%" height="37" align="center"><b>company Size</b></td>
		      <td width="15%" height="37" align="center"><b>company Type</b></td>
          </tr>
 	
          <s:iterator value="employers" id="e">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#e.empId" /></td>
		  <td align="center" ><s:property value="#e.username" /></td>
		  <td align="center" ><s:property value="#e.email" /></td>
		  <td align="center" ><s:property value="#e.phone" /></td>
    	  <td align="center" ><s:property value="#e.contactName" /></td>
    	  <td align="center" ><s:property value="#e.companyName" /></td>
    	  <td align="center" ><s:property value="#e.address" /></td>
    	  <td align="center" ><s:property value="#e.website" /></td>
    	  <td align="center" ><s:property value="#e.companySize" /></td>
    	  <td align="center" ><s:property value="#e.companyType" /></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
