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
Hello <s:property value="#session.employer.username"/>
<img src="upload/emp/<s:property value='#session.employer.image'/>" title="profile_image" alt="profile_image" height="50" width="50" >
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a> <br/>
</p> 
<div class="banner"></div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="empLog.action">Home</a></li>
  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
    <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
     <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>
  <div id="reg">
<a href="emp!eGet?empId=<s:property value="#session.employer.empId" />"><img src="images/edit.png" title="edit" alt="edit" height="20" width="25" ></a>
   <form method="post" action="updateEmp" id="form2">
   <input type="hidden" name="emp.empId" value="<s:property value='emp.empId'/>"><br>
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
        <tr>
          <th colspan="2" class="info">Employer Profile</th>
          <img src="upload/emp/${emp.image}"  title="profile image" alt="profile image" height="80" width="80" >
        </tr>
        
        <tr>
          <td><span class="style1">User Name:</span></td>
          <td><s:property value="emp.username"/></td>
        </tr>

        <tr>
          <td><span class="style1">Email:</span></td>
          <td><s:property value="emp.email"/></td>
        </tr>
         <tr>
          <td><span class="style1">Phone:</span></td>
          <td><s:property value='emp.phone'/>
          </td>
        </tr>
        
         <tr>
          <td><span class="style1">Contact Name:</span></td>
          <td><s:property value='emp.contactName'/>
          </td>
        </tr>
        <tr>
          <td><span class="style1">Company Name:</span></td>
          <td><s:property value='emp.companyName'/>
          </td>
        </tr>
         <tr>
          <td><span class="style1">Address:</span></td>
          <td><s:property value='emp.address'/>
          </td>
        </tr>
         <tr>
          <td><span class="style1">WebSite:</span></td>
          <td><s:property value='emp.webSite'/>
          </td>
        </tr>
        <tr>
        <td><span class="style1">Company Size:</span></td>
          <td><s:property value='emp.companySize'/>
          </td>
        </tr>
        <tr>
        <td><span class="style1">Company Type:</span></td>
          <td><s:property value='emp.companyType'/>	
          </td>
        </tr>

 <tfoot>
        
        </tfoot>
          </table>
          
          
   		

<font style="font-size: 17px;" > 
<br />
    <a href="updateEmpPassword.jsp" target="_bank">Update Password</a> <br/>
</font>
    </form>
    </div>
  </body>
</html>
