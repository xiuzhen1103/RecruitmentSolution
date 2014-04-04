<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title> add CV</title>
  </head>
  
  <body>
  <p align="right">
			Hello<s:property value="#session.jobSeeker.username" /><br />
			<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a>
			<a href="js!logout.action">Logout</a>
			</p> 
	<div align="center" id="header">
<h1><i>Recruitment Solution</i></h1>
<div class="menu_20124162">
	<ul>
    	<li><a href="job!logged.action">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>

    </ul>
</div>
</div>
  <div id="reg">
<br /><br />
    <form method="post" action="uploadCV" enctype="multipart/form-data" id="form1">
    <input type="hidden" name="cv.jobSeeker.jsId" value="<s:property value='#session.jobSeeker.jsId' />" />
     <table width="350" height="163" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th colspan="2">Add CV</th>
        </tr>
         <tr>
          <td><span class="style1">Cover Letter:</span></td>
          <td><input type="text" name="cv.coverLetter" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
         <tr>
          <td><span class="style1">Choose File:</span></td>
          <td><input type="file" name="upload" class="formstyle">
       </td>
        </tr>
    <tfoot>
       <tr>
          <td colspan="2">
          <input name="back" type="button"  onclick="history.back()" value="Back" ></li>
          <input name="submit" type="submit" value="Submit"></li>      
          </td>
        </tr>
   </tfoot>
   </table>
	</form>
	</div>


  </body>
</html>