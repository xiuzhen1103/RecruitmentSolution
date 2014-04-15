<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <title>Update Skill</title>
  </head>

  <body>
  <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
</p> 
 	<div class="banner" ></div>	
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


  
    <form method="post" action="updateSk" >

   <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
    	<tr>
          <th class="info" colspan="2">Update Skill:</th>
        </tr>
         <tr>
          <td><span class="style1">Skill Id:</span></td>
          <td><input type="text" name="skill.skillId" value="<s:property value='skill.skillId'/>" value="<s:property value='skill.skillId'/>"readonly>
          <font color="#F9481C">*</font></td>
        </tr>
 
         <tr>
          <td><span class="style1">Name:</span></td>
          <td><input type="text" name="skill.name" value="<s:property value='skill.name'/>" value="<s:property value='skill.name'/>">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Skill Category:</span></td>
          <td><input type="text" name="skill.skillCategory.skillCategoryId" value="<s:property value='skill.skillCategory.skillCategoryId'/>">
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