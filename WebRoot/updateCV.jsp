<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Update CV</title>
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
    <form method="post" action="updateCV">
     	CV Id:<input type="text" name="cv.cvId"><br>
  	    CV Title:<input type="text" name="cv.cvTitle"><br>
    	CV Descripton:<input type="text" name="cv.cvDesc"><br>
    	Cover Letter:<input type="text" name="cv.coverLetter"><br>
    	Upload CV:<input type="text" name="cv.uploadCV"><br>
    	JobSeeker Id:<input type="text" name="cv.jobSeeker.jsId"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
