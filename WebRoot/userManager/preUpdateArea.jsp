<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />

    <title>Update Area</title>

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
    	<li><a href="admin.jsp">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
</div>
  <b> Update Area </b>
  
    <form method="post" action="updateArea">
 		Area Id:<input type="text" name="area.areaId" value="<s:property value='area.areaId'/>" readonly><br>
    	Parent Id:<input type="text" name="area.parentArea.areaId" value="<s:property value='area.parentArea.areaId'/>"><br>
    	Area Name:<input type="text" name="area.areaName" value="<s:property value='area.areaName'/>"><br>
    	Level:<input type="text" name="area.level" value="<s:property value='area.level'/>"><br>
    	Latitude:<input type="text" name="area.latitude" value="<s:property value='area.latitude'/>"><br>
    	Longitude:<input type="text" name="area.longitude" value="<s:property value='area.longitude'/>"><br>
    	<input name="back" type="button"  onclick="history.back()" value="Back" >
    	<input type="submit" value="submit"/>
    </form>
 
  </body>
</html>
