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
    
    <title>Display All Skill </title>
  </head>
 
  <body>
    <b>Display All Skill </b>  
     <div align="center">
   <a href="addSkill.jsp">Add Skill </a> 
</div>

  <s:form method="post" action="sk!list.action">  
  		<s:textfield label="Please enter Skill Id" name="skill.skillId"></s:textfield>
  		<s:textfield label="Please enter skill name" name="skill.name"></s:textfield>
  		<s:submit label="submit"/>
  			</s:form>
 
 	 <table width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
 	 		 <td width="5%" height="37" align="center"><b> </b></td>
		      <td width="5%" height="37" align="center"><b>skill Id</b></td>
		      <td width="10%" height="37" align="center"><b>Name</b></td>
		      <td width="10%" height="37" align="center"><b>Skill Category Name</b></td>
 			  <td width="10%" height="37" align="center"><b>Update</b></td>
 			  <td width="10%" height="37" align="center"><b>Delete</b></td>
 			  
          </tr>
 	
          <s:iterator value="skills" id="s">
          
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td><input type="radio" name="skillid" value="1" /> </td>
		  <td align="center" ><s:property value="#s.skillId" /></td>
		  <td align="center" ><s:property value="#s.name" /></td>
		  <td align="center" ><s:property value="#s.skillCategory.name" /></td>
		  <td><a href="sk!load?skill.skillId=<s:property value="#s.skillId" />">Update</a></td>
		  <td><a href="sk!delete?skill.skillId=<s:property value="#s.skillId" />">Delete</a></td>
		   
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
