<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>upload CV</title>
		<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
	</head>

	<body>
		<p align="right">
			Hello
			<s:property value="#session.jobSeeker.username" />
			<br />
			<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a>
			<a href="js!logout.action">Logout</a>
		</p>
		<div align="center" id="header">
			<h1><i>Recruitment Solution</i></h1>
		</div>

		<s:form action="uploadCV" method="post" enctype="multipart/form-data">
			<s:file name="upload" label="Upload"></s:file>
			<s:submit value="Upload"></s:submit>


		</s:form>
	</body>
</html>
