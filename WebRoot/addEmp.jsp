<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
        <style>
            .bred{border: 1px solid red;}
            .bgreen{border: 1px solid green;}
        </style>
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/jsValidation.js"></script>
	    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />	
  </head>
  <body>
  
<p align="right">
<a href="loginEmp.jsp">Employer Login</a> 
<a href="loginJs.jsp">Jobseeker Login</a> 
or
<a href="addEmp.jsp">Employer Register</a> 
<a href="js!registerJs.action">Jobseeker Register</a>
</p> 
<div class="banner" ></div>

<div align="center">
<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!first.action">Home</a></li>
  <li class="active">News</li>
 <li><a href="report" target="_blank" >Statistic</a></li>
<li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	
  <div id="reg">
  <div id="displayTip" class="displayNone"></div>  
    <form name="register" method="post" action="emp.action" id="form2" onsubmit="return emp_validateForm();">
     <div class="panel panel-primary">
		<div class="panel-heading">
          <h3 class="panel-title">Employer Register</h3>
          </div>
    		 <div class="panel-body">
     <table width="500" height="403" >
        <tr>
        </tr>
         <tr>
          <td><span>Username:</span></td>
          <td><input name="emp.username" type="text" id="emp_username" class="formstyle">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="emp_username_hint"></font>
          </td>
          
        </tr>
         <tr>
          <td><span class="style1">Password:</span></td>
          <td><input name="emp.password" type="password" id="pass1" class="formstyle">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="p1_hint"></font></td>
        </tr>
        <tr>
         <td><span class="style1">Confirm Password:</span></td>
          <td><input name="pass2" type="password" class="formstyle">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="p2_hint"></font></td>
        </tr>
        <tr>
         <td><span class="style1">Email</span></td>
          <td><input name="emp.email" type="text" id="emp_email" class="formstyle">
   		  <font color="#F9481C">*</font>
   		  <font color="#F9481C" id="emp_email_hint"></font></td>
        </tr>
        <tr>
         <td><span class="style1">Phone</span></td>
          <td><input name="emp.phone" type="text" id="phone" class="formstyle">
   		</td>
        </tr>
         <tr>

         <td><span class="style1">Contact Name:</span></td>
          <td><input name="emp.contactName" type="text" id="name" class="formstyle">
   		  <font color="#F9481C" id="name_hint">*</font></td>
        </tr>
        <tr>

         <td><span class="style1">Company Name:</span></td>
          <td><input name="emp.companyName" type="text" id="companyName" class="formstyle">
   		</td>
        </tr>
        <tr>
         <td><span class="style1">Address:</span></td>
          <td><input name="emp.address" type="text" id="address" class="formstyle">
   		</td>
        </tr>
         <tr>

         <td><span class="style1">WebSite:</span></td>
          <td><input name="emp.webSite" type="text" id="webSite" class="formstyle">
   		  </td>
        </tr>
        <tr>
         <td><span class="style1">Company Size:</span></td>
          <td><input name="emp.companySize" type="text" id="companySize" class="formstyle">
   		</td>
        </tr>
        <tr>

         <td><span class="style1">Company Type:</span></td>
          <td><input name="emp.companyType" type="text" id="companyType" class="formstyle">
   		</td>
        </tr>
        <tfoot>
        <tr>
          <td colspan="2">
    <div align="center">
         <input name="back" type="reset" class="btn btn-sm btn-default" value="Reset">
				<input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
             </div>
          </td>
        </tr>
        </tfoot>
          </table>
          </div>
	</div>
</form>
</div>


  </body>
  
</html>
