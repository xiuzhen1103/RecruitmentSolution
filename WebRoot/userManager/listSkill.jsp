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
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <title>Display All Skill </title>
  </head>
 
  <body>
	 <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout">Logout</a>
</p> 
	<div class="banner" >

</div>

		
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
 <li><a href="userManager/admin.jsp">Home</a></li>
    <li><a href="emp!list.action">Employers </a></li>
    <li><a href="js!listJsForAdmin.action">JobSeekers</a></li>
    <li><a href="area!list.action">Areas</a></li>
    <li><a href="job!listForAdmin.action" >Jobs </a></li>
    <li><a href="sc!list.action">Skill Categories</a></li>
    <li><a href="sk!list.action">Skills</a></li>
</ol>
</div>
  </div>
  </div>
  <h3><span class="label label-info">Display All Skills:</span></h3>   
<div align="center">
   <a href="userManager/addSkill.jsp"><img src="images/add.png" title="add" alt="add" height="30" width="30" ></a> </a> 
</div>

  <form method="post" action="sk!list.action" class="formstyle" style="padding: 5px 3px;"> 
   	Please Enter Skill Name: <input type="text" name="skill.name"/> 
  	<button type="submit" class="btn btn-sm btn-primary">Submit</button>
  </form>
 
 	  <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info" height="37" align="center">
		      <td  width="5%" ><b>Skill Id</b></td>
		      <td width="10%"><b>name</b></td>
		      <td width="10%" ><b>Skill Category</b></td>
 			  <td width="5%" ><b>Update</b></td>
 			  <td width="5%" ><b>Delete</b></td>
          </tr>
          <s:iterator value="skills" id="s">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#s.skillId" /></td>
		  <td align="center" ><s:property value="#s.name" /></td>
		  <td align="center" ><s:property value="#s.skillCategory.name" /></td>
		  <td><a href="sk!load?skill.skillId=<s:property value="#s.skillId" />"><img src="images/edit.png" title="edit" alt="edit" height="20" width="30" ></a></td>
		  <td><a href="sk!delete?skill.skillId=<s:property value="#s.skillId" />"><img src="images/delete.png" title="delete" alt="delete" height="25" width="20" ></a></td>
        </tr>
     </s:iterator>
    </table>
    
<div align="right" id="stuff"><a href="javascript:scroll(0,0)">Back To Top</a></div>
  </body>
</html>
