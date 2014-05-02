<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<% response.setStatus(404); %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=basePath%>style/style.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap.min.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap-theme.min.css"
			type="text/css" rel="StyleSheet" />
    <title>404 error</title>
  </head>
  <body>
  <div class="banner">
</div>
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="javascript:history.back()">Back</a></li>
  <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	
<div id="reg">
<img alt="error image" src="http://www.techmodi.com/demo/yabblo/img/PageNotFound.jpg" />

   <h3> <font color="#F9481C">Page not found !!!</font> </h3>
 Click here to go back to previous page. <input name="back" type="button" class="btn btn-sm btn-primary" onclick="history.back()" value="Back">
    </div>
  </body>
</html>