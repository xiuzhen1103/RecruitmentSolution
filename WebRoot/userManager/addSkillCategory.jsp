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
  <li>
                        <a href="userManager/admin.jsp">Home</a>
                    </li>
                    <li class="active">News</li>
                    <li>
                        <a href="<%=basePath%>report/report.jsp">Statistic</a>
                    </li>
                    <li>
                        <a href="aboutUs.jsp" target="_blank">About Us</a>
                    </li>
</ol>
</div>
  </div>
  </div>

  <div id="reg">

    <form method="post" action="sc.action" id="form2">
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
        <tr>
          <th colspan="2" class="info">Add Skill Category</th>
        </tr>
         <tr>
          <td><span class="style1">Name:</span></td>
          <td><input name="skillCategory.name" type="text"  class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>

        <tr>
          <td><span class="style1">Level:</span></td>
          <td>
          <select name="skillCategory.level">
  			<option value="0">Job Category</option>
 			<option value="1">Job</option>
		</select>
          <font color="#F9481C">*</font></td>
        </tr>
        
         <tr>
          <td><span class="style1">Parent Id:</span></td>
          <td><input name="skillCategory.parentSkillCategory.skillCategoryId" type="text" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        
    
 <tfoot>
        <tr>
          <td colspan="2">
         	 <input name="back" type="button" class="btn btn-sm btn-default"  onclick="history.back()" value="Back" >
              <input name="submit" class="btn btn-sm btn-primary" type="submit" value="Submit">
          </td>
        </tr>
        </tfoot>
          </table>
</form>
</div>


  </body>
</html>
