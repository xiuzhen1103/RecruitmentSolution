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
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title> JobSeeker Register</title>

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
    	<li><a href="userManager/admin.jsp">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
</div>
 <br>
 <div id="reg">
    <form method="post" action="jc.action" id="form1">
    <table width="300" height="163" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr><br/><br/>
          <th colspan="2">Add Job Category</th>
        </tr>
         <tr>
          <td><span class="style1">Name:</span></td>
          <td><input name="jc.name" type="text" id="name" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Level:</span></td>
          <td><input name="jc.level" type="text" id="level" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Parent Id:</span></td>
          <td><input name="jc.parentJobCategory.jobCaId" type="text" id="parentId" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
   <tfoot>
        <tr>
          <td colspan="2">
              <input name="submit" type="submit" value="Submit"></li>
              <input name="reset" type="reset" value="Reset" ></li>
          </td>
        </tr>
        </tfoot>
          </table>
</form>
</div>


  </body>
</html>
