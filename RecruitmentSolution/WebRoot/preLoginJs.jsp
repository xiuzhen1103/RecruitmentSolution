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

    <title>Update JobSeeker</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

 
  <body>
  <b> preLogin JobSeeker </b>
 
  		<form method="post" action="searchJsByEmail">
  	    Jobseeker id:<input type="text" name="js.jsId" value="<s:property value='js.jsId'/>" ><br>
  	    Username:<input type="text" name="js.username" value="<s:property value='js.username'/>" ><br>
    	Name:<input type="text" name="js.name" value="<s:property value='js.name'/>"><br>
    	Address:<input type="text" name="js.address" value="<s:property value='js.address'/>"><br>
    	Email:<input type="text" name="js.email" value="<s:property value='js.email'/>" ><br>
    	Phone:<input type="text" name="js.phone" value="<s:property value='js.phone'/>"><br>
    	Expected Salary<input type="text" name="js.expectedSalary" value="<s:property value='js.expectedSalary'/>"><br>
    	<input type="submit" value="submit"/>
    </form>
 
  </body>
</html>
