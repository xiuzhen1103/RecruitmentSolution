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
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
	 <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
    <title> Employer profile</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  	<p align="right">
Hello <s:property value="#session.employer.username"/>
<img src="upload/emp/<s:property value='#session.employer.image'/>" title="profile_image" alt="profile_image" height="50" width="50" >
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a>
</p>
	<div class="banner" >

</div>

		
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
 <li><a href="empLog.action">Home</a></li>
  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
  <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
     <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	
  <div id="reg">
   <form method="post" action="ir!send" id="form1">
   <input type="hidden" name="job.jobId" value="${job.jobId}"/>
   <input type="hidden" name="cv.cvId" value="${cv.cvId}"/>
   <input type="hidden" name="js.jsId" value="${js.jsId}"/>
   <table width="450" id="form1" height="263" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th colspan="2">Send Interview Email</th>
        </tr>

         <tr>
          <td><span class="style1">Contact Phone:</span></td>
          <td><input name="ir.phone" type="text" id="phone" class="formstyle"/>
          <font color="#F9481C">*</font>
          </td>
        </tr>
         <tr>
          <td><span class="style1">Interview Time:</span></td>
          <td><input name="ir.interviewTime" type="text" id="interviewDate"  class="formstyle"/>
          <font color="#F9481C">*</font>
          </td>
        </tr>
         <tr>
          <td align="left"><span class="style1">Memo:</span></td>
          <td><textarea name="ir.memo" id="memo" style="width:200px;height:70px;"></textarea>
          </td>
        </tr>
         <tr>
          <td align="left"><span class="style1">&nbsp;</span></td>
          <td><s:if test="tips != null"><font color="red">${tips}</font></s:if>
          </td>
        </tr>

       <tfoot>
        <tr>
          <td colspan="2">
            <input name="back" type="button" class="btn btn-sm btn-default" onclick="history.back()" value="Back" >
            <input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
          </td>
        </tr>
        </tfoot>
          </table>
    </form>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$('#interviewDate').bind('focus',function(){WdatePicker({dateFmt:'d/M/yyyy HH:mm'});});
    	});
    </script>
  </body>
</html>
