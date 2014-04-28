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
    <title>Display All Skill </title>
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
 <li><a href="<%=basePath%>report/report.jsp">Statistic</a></li>
    <li><a href="#">About Us</a></li>
</ol>
</div>
  </div>
  </div>
   <div id="reg">

    <form method="post" action="sk.action" id="form2">
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
    <tr>
          <th colspan="2" class="info">Add Skill</th>
        </tr>
         <tr>
          <td><span class="style1">Name:</span></td>
          <td><input type="text" name="skill.name" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Skill Category Id:</span></td>
          <td><input type="text" name="skill.skillCategory.skillCategoryId" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
    	<tfoot>
       <tr>
          <td colspan="2">
          <input name="back" type="button" class="btn btn-sm btn-default"  onclick="history.back()" value="Back" >
          <input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
          </td>
        </tr>
   </tfoot>
   </table>
	</form>
	</div>
  </body>
</html>
