<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Update Employer</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
 
  <body>
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li><a href="userManager/admin.jsp">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
</div>
    <b>Display All Employer:<b/>  
    <s:form method="post" action="emp!list.action">  
  		<s:textfield label="Please Enter Employer Id" name="emp.empId"></s:textfield>
  		<s:textfield label="Please Enter Company name" name="emp.companyName"></s:textfield>
  		<s:textfield label="Please Enter Email" name="emp.email"></s:textfield>
  		<s:textfield label="Please Enter contact Name" name="emp.contactName"></s:textfield>
  		<s:submit label="submit"/>	
   </s:form>
   
 <br> <br />
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Employer Id</b></td>
		      <td width="10%" height="37" align="center"><b>User name</B></td>
		      <td width="10%" height="37" align="center"><b>Email</b></td>
		      <td width="20%" height="37" align="center"><b>Phone</b></td>
		      <td width="5%" height="37" align="center"><b>Contact Name</b></td>
		      <td width="15%" height="37" align="center"><b>Company Name</b></td>
		      <td width="20%" height="37" align="center"><b>Address</b></td>
		      <td width="15%" height="37" align="center"><b>Website</b></td>
		      <td width="15%" height="37" align="center"><b>Company Size</b></td>
		      <td width="15%" height="37" align="center"><b>Company Name</b></td>
		      <td width="5%" height="37" align="center"><b>Update</b></td>
		      <td width="5%" height="37" align="center"><b>Delete</b></td>
          </tr>
 	
          <s:iterator value="employers" id="e">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#e.empId" /></td>
		  <td align="center" ><s:property value="#e.username" /></td>
		  <td align="center" ><s:property value="#e.email" /></td>
		  <td align="center" ><s:property value="#e.phone" /></td>
    	  <td align="center" ><s:property value="#e.contactName" /></td>
    	  <td align="center" ><s:property value="#e.companyName" /></td>
    	  <td align="center" ><s:property value="#e.address" /></td>
    	  <td align="center" ><s:property value="#e.webSite" /></td>
    	  <td align="center" ><s:property value="#e.companySize" /></td>
    	  <td align="center" ><s:property value="#e.companyType" /></td>
    	  <td><a href="emp!load?emp.empId=<s:property value="#e.empId" />">Update</a></td>
    	  <td><a href="emp!delete?emp.empId=<s:property value="#e.empId" />">Delete</a></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
