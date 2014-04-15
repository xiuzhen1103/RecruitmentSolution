<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  <base href="<%=basePath%>">
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
 <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<script type="text/javascript">

function openWin(f,n,w,h,s){
	sb = s == "1" ? "1" : "0";
	l = (screen.width - w)/2;
	t = (screen.height - h)/2;
	sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+ w+ ",center=1,scrollbars=" + sb + ",status=0,directories=0,channelmode=0";
	openwin = window.open(f , n , sFeatures );
	if (!openwin.opener)
		openwin.opener = self;
	openwin.focus();
	return openwin;
}

</script>
<title>Profile</title>
</head>
<body>
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
 		<form method="post" action="updateJs" id="form1">
 		<input name="js.jsId" type="hidden" id="jsId" value="<s:property value='js.jsId'/>">
 		    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
        <tr>
          <th colspan="2" class="info"></>Update JobSeeker</th>
        </tr>

        <tr>
          <td><span class="style1">Username:</span></td>
          <td><input name="js.username" type="text" id="username" value="<s:property value='js.username'/>" readonly class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
         <tr>
          <td><span class="style1">Name:</span></td>
          <td><input name="js.name" type="text" id="name" value="<s:property value='js.name'/>" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Address:</span></td>
          <td><input name="js.address" type="text" id="address" value="<s:property value='js.address'/>" class="formstyle">
          </td>
        </tr>
        <tr>
          <td><span class="style1">Email:</span></td>
          <td><input name="js.email" type="text" id="email" value="<s:property value='js.email'/>" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Phone:</span></td>
          <td><input name="js.phone" type="text" id="phone" value="<s:property value='js.phone'/>" class="formstyle">
         </td>
        </tr>
        
         <tr>
          <td><span class="style1">Expected Salary:</span></td>
          <td><input name="js.expectedSalary" type="text" id="expectedSalary" value="<s:property value='js.expectedSalary'/>" class="formstyle">
         </td>
        </tr>
        <tfoot>
        
       <tr>
        <td colspan="2">
   			<div align="center">
         <input name="back" type="button" class="btn btn-sm btn-default"  onclick="history.back()" value="Back" >
				<input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
            </div> 
          </td>
        </tr>
        </tfoot>
          </table>
          </form>
          
<font style="font-size: 17px;">
<a href="addCV.jsp">Upload CV</a> <br/>
<a href="ir!listMySend">View Interview History</a> <br/>
<!--<a href="javascript:void(0)" onclick="openWin('jsSkill!add.action','add',500,200,0)">Update Skill</a> <br/>-->
<a href="updateJsPassword.jsp" target="_bank">Update Password</a> <br/>
<a href="cv!list.action" target="_bank">List CV</a> <br/>
<a href="jsSkill!list.action" target="_bank">List Skill</a> <br/>
</font>

</div>
</body>
</html>