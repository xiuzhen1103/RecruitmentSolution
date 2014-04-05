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
    <title>Display All Area</title>
    
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
    <b>Display All Area:<b/> 
    <div align="center">
   <a href="userManager/addArea.jsp">Add Area </a> 
</div>

  <s:form method="post" action="area!list.action">  

  		<s:textfield label="Please Enter Area Name" name="area.areaName"></s:textfield>
  		
  		<s:submit label="submit"/>
  			</s:form>
  		
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Area Id</b></td>
		      <td width="5%" height="37" align="center"><b>Area Name</b></td>
		      <td width="15%" height="37" align="center"><b>Latitude</b></td>
		      <td width="20%" height="37" align="center"><b>Longitude</b></td>
		       <td width="5%" height="37" align="center"><b>Update</b></td>
		      <td width="5%" height="37" align="center"><b>Delete</b></td>
          </tr>
 	
          <s:iterator value="areas" id="a">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#a.areaId" /></td>

		 <td align="center" ><s:property value="#a.areaName" /></td> 
    	  <td align="center" ><s:property value="#a.latitude" /></td>
    	  <td align="center" ><s:property value="#a.longitude" /></td>
    	   <td><a href="area!load?area.areaId=<s:property value="#a.areaId" />">Update</a></td>
    	  <td><a href="area!delete?area.areaId=<s:property value="#a.areaId" />">Delete</a></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
