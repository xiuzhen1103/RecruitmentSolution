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
    
    <title>Display All Skill Category</title>
  </head>
 
  <body>
  <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
</p> 
    <b>Display All Skill Category:</b>  
     <div align="center">
   <a href="userManager/addSkillCategory.jsp">Add Skill Category </a> 
</div>

  <s:form method="post" action="sc!list.action">  
  		<s:textfield label="Please enter Skill category Id" name="skillCategory.skillCategoryId"></s:textfield>
  		<s:textfield label="Please enter Skill category name" name="skillCategory.name"></s:textfield>
  		<s:textfield label="Please enter level" name="skillCategory.level"></s:textfield>
  		<s:submit label="submit"/>
  			</s:form>
 
 	 <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Skill Category Id</b></td>
		      <td width="10%" height="37" align="center"><b>Name</b></td>
		      <td width="5%" height="37" align="center"><b>Level</b></td>
		      <td width="5%" height="37" align="center"><b>Parent Id</b></td>
		      <td width="5%" height="37" align="center"><b>Update</b></td>
		      <td width="5%" height="37" align="center"><b>Delete</b></td>
          </tr>
 	
          <s:iterator value="scs" id="s">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#s.skillCategoryId" /></td>
		  <td align="center" ><s:property value="#s.name" /></td>
		  <td align="center" ><s:property value="#s.level" /></td>
		  <td align="center" ><s:property value="#s.parentSkillCategory.name" /></td>
		  <td><a href="sc!load?skillCategory.skillCategoryId=<s:property value="#s.skillCategoryId" />">Update</a></td>
		  <td><a href="sc!delete?skillCategory.skillCategoryId=<s:property value="#s.skillCategoryId" />">Delete</a></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>

