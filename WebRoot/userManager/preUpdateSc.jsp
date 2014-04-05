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
    <title> Update Skill Category</title>
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
    	<li><a href="admin.jsp">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
</div>
  
  <b>Update Skill Category</b> <br>
  <form method="post" action="updateSc">
    	Skill categoryIdy Id:<input type="text" name="skillCategory.skillCategoryId" value="<s:property value='skillCategory.skillCategoryId'/>" readonly><br>
    	Name:<input type="text" name="skillCategory.name" value="<s:property value='skillCategory.name'/>"><br>
    	Level:<input type="text" name="skillCategory.level" value="<s:property value='skillCategory.level'/>"><br>
    	Parent Id:<input type="text" name="skillCategory.parentSkillCategory.skillCategoryId" value="<s:property value='skillCategory.parentSkillCategory.skillCategoryId'/>"><br>
    	<input name="back" type="button"  onclick="history.back()" value="Back" >
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
