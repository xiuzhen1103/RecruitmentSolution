<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
  <script type="text/javascript" src="<%=basePath%>js/empValidation.js"></script>
  <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <title>Update Employer Password</title>
  <body>
  <p align="right">
  Hello <s:property value="#session.employer.username"/><br/>
  <a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
  <a href="emp!logout.action">Logout</a> <br/>
  </p> 
  <div class="banner"></div>
<div class='navbar navbar-inverse' align="center">
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="empLog.action">Home</a></li>
  <li class="active">News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>

   <div id="reg">

    <form method="post" action="updateEmpPassword" onsubmit="return validateForm();" id="form1" >
    	<input type="hidden" name="emp.empId" value="<s:property value='#session.employer.empId'/>">
     <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
    	<tr>
          <th colspan="2">Update Password</th>
        </tr>
         <tr>
          <td><span class="style1">Current Password:</span></td>
          <td><input type="password" name="currentPassword" class="formstyle" />
          <font color="#F9481C">*</font></td>
        </tr>
 
         <tr>
          <td><span class="style1">New Password:</span></td>
          <td><input type="password" name="emp.password" class="formstyle" />
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Confirm Password:</span></td>
          <td><input type="password" name="emp.password2" class="formstyle" />
          <font color="#F9481C">*</font></td>
        </tr>
 <tfoot>
       <tr>
          <td colspan="2">
   			<div align="center">
         <input name="reset" type="reset" class="btn btn-sm btn-default" value="Reset" >
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