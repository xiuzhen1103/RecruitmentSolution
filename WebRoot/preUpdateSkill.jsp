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
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

    <title>Update Skill</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

  <body>
  <b> Update Skill </b>
  
    <form method="post" action="updateSk">
 		Skill Id:<input type="text" name="skill.skillId" value="<s:property value='skill.skillId'/>" value="<s:property value='skill.skillId'/>"readonly><br>
    	Name:<input type="text" name="skill.name" value="<s:property value='skill.name'/>" value="<s:property value='skill.name'/>"><br>
    	Skill Category:<input type="text" name="skill.skillCategory.skillCategoryId" value="<s:property value='skill.skillCategory.skillCategoryId'/>"><br>

    	<input type="submit" value="submit"/>
    </form>
 
  </body>
</html>
