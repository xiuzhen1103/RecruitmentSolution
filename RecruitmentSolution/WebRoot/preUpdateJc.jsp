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
