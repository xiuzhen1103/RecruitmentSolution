<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/login.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<title>Administrator page</title>
</head>
<body>
    <p align="right">
        Hello
        <s:property value="#session.admin.username" />
        <br />
        <a href="admin!logout">Logout</a>
    </p>
    <div class="banner"></div>
    <div align="center">
        <div class='navbar navbar-inverse'>
            <div class='nav-collapse' style="height: auto;">
                <ol class="breadcrumb">
                    <li>
                        <a href="<%=basePath%>userManager/admin.jsp">Home</a>
                    </li>
                    <li class="active">News</li>
                    <li><a href="#">Statistic</a></li>
                    <li>
                        <a href="../aboutUs.jsp" target="_blank">About Us</a>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <div align="center">
      <b>JobSeeker: </b><br/>
        <a href="report" target="_blank">Jobseeker Employment Statistics</a>
        <br/><br/>
        
        <b>Job: </b><br/>
        <a href="report2" target="_blank">Job Create Statistics</a>
        <br/>
        <a href="report3" target="_blank">Job Category Statistics</a>
    </div>
</body>
</html>