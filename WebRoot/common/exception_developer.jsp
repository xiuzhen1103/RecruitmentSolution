<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		 <link href="<%=basePath%>style/style.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap.min.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap-theme.min.css"
			type="text/css" rel="StyleSheet" />
			
			
		<title>Exception page</title>
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
	<h2>
			System exception occurred
		</h2>
		<hr></hr>
		<h3>
			Reason for the exception
		</h3>
		<s:actionerror />
		<p>
			<s:property value="%{exception.message}" />
		</p>
		<h3>
			Error details
		</h3>
		<p>
			<s:property value="%{exceptionStack}" />
		</p>
	</body>
</html>
