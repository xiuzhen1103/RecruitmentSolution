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
    <title>Display all Job Category</title>

  </head>	
  <body>
    <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
 
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li><a href="userManager/admin.jsp">Home</a></li>
    <li><a href="emp!list.action">Employers </a></li>
    <li><a href="js!listJsForAdmin.action">JobSeekers</a></li>
    <li><a href="area!list.action">Areas</a></li>
    <li><a href="job!listForAdmin.action" >Jobs </a></li>
    <li><a href="sc!list.action">Skill Categories</a></li>
    <li><a href="sk!list.action">Skills</a></li>

    </ul>
</div>
  </div>
    <b>Display All Job Category:<b>  
    <div align="center">
   <a href="userManager/addJobCategory.jsp">Add Job Category </a> 
</div>
 <br> <br />
  <s:form method="post" action="jc!list.action">  
  		<s:textfield label="Please Enter Job category Id" name="jc.jobCaId"></s:textfield>
  		<s:textfield label="Please Enter Job category name" name="jc.name"></s:textfield>
  		<s:textfield label="Please Enter Level" name="jc.level"></s:textfield>
  		<s:submit label="submit"/>
  			</s:form>
 
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr height="37" align="center">
		      <td width="5%" ><b>Job Category Id</b></td>
		      <td width="10%"><b>Name</b></td>
		      <td width="5%" ><b>Level</b></td>
		      <td width="5%" ><b>Parent</b></td>
		      <td width="5%" ><b>Update</b></td>
		      <td width="5%"><b>Delete</b></td>
          </tr>
 
          <s:iterator value="jcs" id="jcs">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#jcs.jobCaId" /></td>
		  <td align="center" ><s:property value="#jcs.name" /></td>
		  <td align="center" ><s:property value="#jcs.level" /></td>
		  <td align="center" ><s:property value="#jcs.parentJobCategory.name" /></td>
		   <td><a href="jc!load?jc.jobCaId=<s:property value="#jcs.jobCaId" />">Update</a></td>
		    <td><a href="jc!delete?jc.jobCaId=<s:property value="#jcs.jobCaId" />">Delete</a></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
