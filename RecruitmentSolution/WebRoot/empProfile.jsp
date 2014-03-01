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
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title> Employer profile</title>
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
  <b>Employer profile </b>
   <form method="post" action="updateEmp" id="form1">
   <input type="hidden" name="emp.empId" value="<s:property value='emp.empId'/>"><br>
   <table width="450" id="form1" height="313" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th colspan="2">Update Employer</th>
        </tr>

        <tr>
          <td><span class="style1">Email:</span></td>
          <td><input name="emp.email" type="text" id="email" value="<s:property value='emp.email'/>" readonly class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
         <tr>
          <td><span class="style1">Phone:</span></td>
          <td><input name="emp.phone" type="text" id="phone" value="<s:property value='emp.phone'/>"  class="formstyle">
          </td>
        </tr>
        
         <tr>
          <td><span class="style1">Contact Name:</span></td>
          <td><input name="emp.contactName" type="text" id="contactName" value="<s:property value='emp.contactName'/>"  class="formstyle">
          </td>
        </tr>
        <tr>
          <td><span class="style1">Company Name:</span></td>
          <td><input name="emp.companyName" type="text" id="companyName" value="<s:property value='emp.companyName'/>"  class="formstyle">
          </td>
        </tr>
         <tr>
          <td><span class="style1">Address:</span></td>
          <td><input name="emp.address" type="text" id="address" value="<s:property value='emp.address'/>"  class="formstyle">
          </td>
        </tr>
         <tr>
          <td><span class="style1">WebSite:</span></td>
          <td><input name="emp.webSite" type="text" id="webSite" value="<s:property value='emp.webSite'/>"  class="formstyle">
          </td>
        </tr>
        <tr>
        <td><span class="style1">Company Size:</span></td>
          <td><input name="emp.companySize" type="text" id="companySize" value="<s:property value='emp.companySize'/>"  class="formstyle">
          </td>
        </tr>
        <tr>
        <td><span class="style1">Company Type:</span></td>
          <td><input name="emp.companyType" type="text" id="companyType" value="<s:property value='emp.companyType'/>"  class="formstyle">
          </td>
        </tr>

 <tfoot>
        <tr>
          <td colspan="2">
            <input name="back" type="button" onclick="history.back()" value="Back" ></li>
            <input name="submit" type="submit" value="Submit"></li>
          </td>
        </tr>
        </tfoot>
          </table>
          
          
   		

    
    <a href="job!registerJob.action">Add Job</a> <br/>
    <a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">View posted Job</a> <br/>
    <a href="updateEmpPassword.jsp" target="_bank">Update password</a> <br/>
    
    </form>
    </div>
  </body>
</html>
