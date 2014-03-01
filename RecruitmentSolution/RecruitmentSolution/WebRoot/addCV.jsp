<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> JobSeeker Register</title>
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
  <b> Add CV </b>
    <form method="post" action="cv.action">
    	CV title:<input type="text" name="cvInfo.cvTitle"><br>
    	CV descripton:<input type="text" name="cvInfo.cvDesc"><br>
    	cover letter:<input type="text" name="cvInfo.coverLetter"><br>
    	upload CV:<input type="text" name="cvInfo.uploadCV"><br>
    	jobSeeker Id:<input type="text" name="cvInfo.jobSeeker.jsId"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
