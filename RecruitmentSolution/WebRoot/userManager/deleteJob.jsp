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
    
    <title> Delete Job By Id</title>
    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
   Delete Job By Id
  <body>
  <s:form method="post" action="deleteJob">  
  		<s:textfield label="Please enter job id for delete" name="job.jobId"></s:textfield>
    	<s:submit label="submit"/>	
	</s:form>
	</table>
    <s:debug></s:debug>
  </body>
</html>
