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
  <b>Update Skill Category</b> <br>
  <form method="post" action="updateSc">
    	Skill categoryIdy Id:<input type="text" name="skillCategory.skillCategoryId" value="<s:property value='skillCategory.skillCategoryId'/>" readonly><br>
    	Name:<input type="text" name="skillCategory.name" value="<s:property value='skillCategory.name'/>"><br>
    	Level:<input type="text" name="skillCategory.level" value="<s:property value='skillCategory.level'/>"><br>
    	Parent Id:<input type="text" name="skillCategory.parentSkillCategory.skillCategoryId" value="<s:property value='skillCategory.parentSkillCategory.skillCategoryId'/>"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
