<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Update Skill</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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


<br />
  <b> Update Skill </b>
  
    <form method="post" action="updateSk">
 		Skill Id:<input type="text" name="skill.skillId" value="<s:property value='skill.skillId'/>" value="<s:property value='skill.skillId'/>"readonly><br>
    	Name:<input type="text" name="skill.name" value="<s:property value='skill.name'/>" value="<s:property value='skill.name'/>"><br>
    	Skill Category:<input type="text" name="skill.skillCategory.skillCategoryId" value="<s:property value='skill.skillCategory.skillCategoryId'/>"><br>

    	<input name="back" type="button"  onclick="history.back()" value="Back" >
    	<input type="submit" value="submit"/>
    </form>
 
  </body>
</html>
