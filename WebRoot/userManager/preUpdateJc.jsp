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
    
    <title> Update JobCategory</title>
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
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
</p> 
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li>
                        <a href="userManager/admin.jsp">Home</a>
                    </li>
                    <li class="active">News</li>
                    <li>
                        <a href="<%=basePath%>report/report.jsp">Statistic</a>
                    </li>
                    <li>
                        <a href="aboutUs.jsp" target="_blank">About Us</a>
                    </li>
    </ul>
</div>
</div>
  <b>Update job Category </b> 
  <b>Update job Category</b> <br>
  <form method="post" action="updateJc">
    	Job Category Id:<input type="text" name="jc.jobCaId" value="<s:property value='jc.jobCaId'/>" readonly><br>
    	Name:<input type="text" name="jc.name" value="<s:property value='jc.name'/>"><br>
    	Level:<input type="text" name="jc.level" value="<s:property value='jc.level'/>"><br>
    	Parent Id:<input type="text" name="jc.parentJobCategory.jobCaId" value="<s:property value='jc.parentJobCategory.jobCaId'/>"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
