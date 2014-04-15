<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
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

    <title> Add Area</title>
  </head>
  
  <body>
   <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout">Logout</a>
</p> 
	<div class="banner" >

</div>

		
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="userManager/admin.jsp">Home</a></li>
  <li class="active">News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
  </div>
 <div id="reg">
    <form method="post" action="area.action" >
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
        <tr>
          <th colspan="2" class="info"><h3>Add Area:</h3> </th>
        </tr>
         <tr>
          <td><span class="style1">Parent Id:</span></td>
          <td><input type="text" name="area.parentArea.areaId" class="formstyle">
         </td>
        </tr>
        <tr>
          <td><span class="style1">Area Name:</span></td>
          <td><input type="text" name="area.areaName" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Level:</span></td>
          <td>
          <select name="area.level">
  			<option value="0">Country</option>
 			<option value="1">County</option>
  			<option value="2">District</option>
		</select>
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Latitude:</span></td>
          <td><input type="text" name="area.latitude" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Longitude:</span></td>
          <td><input type="text" name="area.longitude" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
   <tfoot>
  
       <tr>
        <td colspan="2">
   			<div align="center">
         <input name="back" type="button" class="btn btn-sm btn-default"  onclick="history.back()" value="Back" >
				<input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
            </div> 
          </td>
        </tr>
  
   </tfoot>
   </table>
	</form>
	</div>
  </body>
</html>
