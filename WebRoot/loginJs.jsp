<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="<%=basePath%>style/login.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<title> Jobseeker Login Page </title>
</head>
<body>
<p align="right">
<a href="loginEmp.jsp">Employer Login</a> 
<a href="loginJs.jsp">Jobseeker Login</a> 
or
<a href="addEmp.jsp">Employer Register</a> 
<a href="js!registerJs.action">Jobseeker Register</a>
</p> 
<div class="banner" >

</div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!first.action">Home</a></li>
  <li class="active">News</li>
    <li><a href="aboutUs.jsp">About Us</a></li>
</ol>
</div>
  </div>
</div>	

<div id="reg">	
<div id="opi" class="page-wrapper clearfix">
<div class="full-page-holder">
<div class="full-page">

<div class="login-page clearfix">
<div class="full-login">
<div class="shadow">
<div class="login-panel">
	
		<form id="loginForm" name="jsLogin" action="jsLogin.action" method="post">
		  <h2>Jobseeker Login</h2>
		  <p class="clearfix">
		<label for="email">Email:</label>
		<input type="text" name="js.email" tabindex="1" value="" id="email" class="input-text" placeholder="Plase enter your email">
		</p><p class="clearfix">
		<label for="password">Password:</label>
		<input type="password" id="password" name="js.password" value="" class="input-text" tabindex="2" placeholder="Plase enter your password">
</p>
<p class="right">

</p>
<p class="right">

<input type="hidden" name="origURL" value="#" /><input type="hidden" name="domain" value="" />
<input type="hidden" name="formName" value="" /><input type="hidden" name="method" value="" />
<input type="hidden" name="isplogin" value="true" />
<input type="submit" id="login" tabindex="4" name="submit" class="input-submit large" value="Login" />
</p>
<div class="separator"></div>
<p class="no-account">Haven't Register,Yet? <a href="js!registerJs.action" class="reg-now">Register</a></p>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>