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

    <title>Update Employer</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
  <b> Update Employer </b>
  
    <form method="post" action="updateEmp">
    	Employer id: <input type="text" name="emp.empId" value="<s:property value='emp.empId'/>"readonly><br>
    	Email: <input type="text" name="emp.email" value="<s:property value='emp.email'/>"readonly><br>
    	Password:<input type="password" name="emp.password" value="<s:property value='emp.password'/>"><br>
    	Password 2:<input type="password" name="emp.password2" value="<s:property value='emp.password2'/>"><br>  
    	Phone:<input type="text" name="emp.phone" value="<s:property value='emp.phone'/>"><br>
    	Contact Name:<input type="text" name="emp.contactName" value="<s:property value='emp.contactName'/>"><br>
    	Company Name:<input type="text" name="emp.companyName" value="<s:property value='emp.companyName'/>"><br>
    	Address:<input type="text" name="emp.address" value="<s:property value='emp.address'/>"><br>
    	Website:<input type="text" name="emp.webSite" value="<s:property value='emp.webSite'/>"><br>
    	Company Size:<input type="text" name="emp.companySize" value="<s:property value='emp.companySize'/>"><br>
    	Company Type:<input type="text" name="emp.companyType" value="<s:property value='emp.companyType'/>"><br>
   <input type="submit" value="submit"/>
    </form>
 
  </body>
</html>
