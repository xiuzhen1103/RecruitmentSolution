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
	<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
    <title> Employer Profile</title>
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
<div class="banner"></div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="empLog.action">Home</a></li>
  <li class="active" >News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>
  <div id="reg">

   <form method="post" action="updateEmp" id="form1">
   <input type="hidden" name="emp.empId" value="<s:property value='emp.empId'/>"><br>
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
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
   			<div align="center">
         <input name="back" type="button" class="btn btn-sm btn-default"  onclick="history.back()" value="Back" >
				<input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
            </div> 
          </td>
        </tr>
        </tfoot>
          </table>
          
          
   		

<font style="font-size: 17px;" > 
    <a href="job!registerJob.action">Add Job</a> <br/>
    <a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">View Posted Job</a> <br/>
    <a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">View Send Interview Letter</a> <br/>
    <a href="updateEmpPassword.jsp" target="_bank">Update Password</a> <br/>
</font>
    </form>
    </div>
  </body>
</html>
