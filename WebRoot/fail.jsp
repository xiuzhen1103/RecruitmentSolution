<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Failed page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
		<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
  </head>
 <body>
  
  

<div class="banner" >

</div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="#">Failed page</a></li>
</ol>
</div>
  </div>
</div>	
  <div align="center">
  <img src="images/error.png" height="6 0" width="60">
  
  <h3> <font color="#F9481C">Error Page!</font> </h3><br>
    <s:property value="message"/> <br />
  Click here to go back to previous page. <input name="back" type="button" class="btn btn-sm btn-primary" onclick="history.back()" value="Back">
</div>

 

  </body>
</html>
