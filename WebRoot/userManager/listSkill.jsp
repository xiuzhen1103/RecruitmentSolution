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
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Display all Skill </title>
  </head>
 
  <body>
  <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
</p> 
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li><a href="admin.jsp">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
</div>
    <b>Display all Skill </b>  
     <div align="center">
   <a href="addSkill.jsp">Add Skill category </a> 
</div>

  <s:form method="post" action="sk!list.action">  
  		<s:textfield label="Please enter Skill Id" name="skill.skillId"></s:textfield>
  		<s:textfield label="Please enter skill name" name="skill.name"></s:textfield>
  		<s:submit label="submit"/>
  			</s:form>
 
 	 <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>skill Id</b></td>
		      <td width="10%" height="37" align="center"><b>name</b></td>
		      <td width="10%" height="37" align="center"><b>skill category id</b></td>
 			  <td width="10%" height="37" align="center"><b>update</b></td>
 			  <td width="10%" height="37" align="center"><b>delete</b></td>
          </tr>
 	
          <s:iterator value="skills" id="s">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#s.skillId" /></td>
		  <td align="center" ><s:property value="#s.name" /></td>
		  <td align="center" ><s:property value="#s.skillCategory.skillCategoryId" /></td>
		  <td><a href="sk!load?skill.skillId=<s:property value="#s.skillId" />">update</a></td>
		  <td><a href="sk!delete?skill.skillId=<s:property value="#s.skillId" />">delete</a></td>
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
