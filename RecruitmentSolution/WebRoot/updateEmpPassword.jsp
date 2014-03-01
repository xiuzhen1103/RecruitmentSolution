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
    <title>Update Employer Password</title>
  <body>
  <p align="right">
  Hello <s:property value="#session.employer.username"/><br/>
  <a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
  <a href="emp!logout.action">Logout</a> <br/>
  </p> 
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li><a href="empLog.action">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
  </div>
  <br/>
   <div id="reg">

    <form method="post" action="updateEmpPassword" onsubmit="return validateForm();" id="form1" >
    	<input type="hidden" name="emp.empId" value="<s:property value='#session.employer.empId'/>">
    	<table width="300" height="163" border="0" align="left" cellpadding="0" cellspacing="0">
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
          <input name="back" type="button"  onclick="history.back()" value="Back" ></li>
          <input name="submit" type="submit" value="Submit"></li>      
          </td>
        </tr>
        </tfoot>
          </table>
</form>
</div>


  </body>
</html>