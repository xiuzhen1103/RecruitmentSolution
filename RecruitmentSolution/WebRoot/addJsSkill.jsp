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
    
    <title>Add jobSeeker Skill</title>
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
  <b> Add Skill </b>
    <form method="post" action="jsSkill.action">
    	Skill Id:<input type="text" name="jobSeekerSkill.skill.skillId" value="<s:property value='#skill.jobSeeker.jsId'/>"><br>
    	JobSeeker Id: <input type="text" name="jobSeekerSkill.jobSeeker.jsId" value="<s:property value='#session.jobSeeker.jsId'/>"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
