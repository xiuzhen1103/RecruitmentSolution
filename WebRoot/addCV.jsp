<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <title> add CV</title>
  </head>
  
 <p align="right">
Hello <s:property value="#session.jobSeeker.username"/><br/>
<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a> 
<a href="js!logout.action">Logout</a>
</p>
<div class="banner">
</div> 
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!logged.action">Home</a></li>
  <li class="active">News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>
  <div id="reg">
<br /><br />
    <form method="post" action="uploadCV" enctype="multipart/form-data">
    <input type="hidden" name="cv.jobSeeker.jsId" value="<s:property value='#session.jobSeeker.jsId' />" />
     <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10" >
        <tr>
          <th colspan="2" class="info"><h3>Add CV</h3></th>
        </tr>
         <tr>
          <td><span class="style1">Cover Letter:</span></td>
          <td><textarea name="cv.coverLetter" style="width:400px;height:200px;" class="formstyle" ></textarea>
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
           <input name="back" type="button" class="btn btn-sm btn-default"  onclick="history.back()" value="Back" >
				<input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">     
          </td>
        </tr>
   </tfoot>
   </table>
	</form>
	</div>


  </body>
</html>