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
    <b>Display all Area:<b/>  
 <br> <br />
 	 <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Area Id</b></td>
		      <td width="10%" height="37" align="center"><b>County</b></td>
		      <td width="10%" height="37" align="center"><b>Email</b></td>
		      <td width="20%" height="37" align="center"><b>Area</b></td>
		      <td width="5%" height="37" align="center"><b>Country</b></td>
		      <td width="15%" height="37" align="center"><b>latitude</b></td>
		      <td width="20%" height="37" align="center"><b>longitude</b></td>
          </tr>
 	
          <s:iterator value="areas" id="a">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#a.areaId" /></td>
		  <td align="center" ><s:property value="#a.county" /></td>
		  <td align="center" ><s:property value="#a.email" /></td>
		  <td align="center" ><s:property value="#a.area" /></td>
    	  <td align="center" ><s:property value="#a.country" /></td>
    	  <td align="center" ><s:property value="#a.latitude" /></td>
    	  <td align="center" ><s:property value="#a.longitude" /></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
