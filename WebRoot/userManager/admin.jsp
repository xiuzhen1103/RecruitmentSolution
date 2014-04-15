<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>  
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/login.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<title>Administrator page</title>
</head>
<body>
	 <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout">Logout</a>
</p> 
	<div class="banner" ></div>	
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="admin.jsp">Home</a></li>
  <li class="active">News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="../aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>		<h2> Welcome to administrator page: </h2>
	<div align="center">
	<b>Employer: </b><br/>

	<a href="emp!list.action">Employer List: </a> <br/> <br/>


	<b>JobSeeker: </b><br/>

	<a href="js!listJsForAdmin.action">JobSeeker List</a> <br/> <br/>
	
	<b>Area: </b><br/>
	<a href="area!list.action">Area List</a> <br/> <br/>
	
	<b>Job: </b><br/>
	<a href="job!list.action">Job List</a> <br/> <br/>
	
	<b>Skill Category: </b><br/>
	<a href="sc!list.action">Skill Category List</a> <br/> <br/>
	
	<b>Skill: </b><br/>
	<a href="sk!list.action">Skill List</a> <br/> <br/>
	
</div>	
	

</body>
</html>