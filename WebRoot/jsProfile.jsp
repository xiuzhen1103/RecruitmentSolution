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
Hello <s:property value="#session.jobSeeker.username"/>
<img src="upload/js/<s:property value='#session.jobSeeker.image'/>" title="profile_image" alt="profile_image" height="30" width="30" >
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
  <li><a href="cv!list.action" target="_bank">Manage CV</a> </li>
   <li><a href="ir!listMySend">Interview History</a> </li>
    <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
    
</ol>
</div>
  </div>
</div>

<div id="reg">
<a href="js!jGet?jsId=<s:property value="#session.jobSeeker.jsId" />"><img src="images/edit.png" title="edit" alt="edit" height="20" width="25" ></a>
 		<form method="post" action="updateJs" id="form2">
 		<input name="js.jsId" type="hidden" id="jsId" value="<s:property value='js.jsId'/>">
 		    <table class="table table-striped table-bordered info" width="400" height="363" border="0" align="left" cellpadding="10" cellspacing="10"  >
        <tr>
          <th colspan="2" class="info"></>JobSeeker Profile</th>
         
        </tr>
        
 <img src="upload/js/${js.image}"  title="profile image" alt="profile image" height="80" width="80" >
        <tr>
          <td><span class="style1">User Name:</span></td>
          <td><s:property value="js.username"/>
   
        </tr>
         <tr>
          <td><span class="style1">Name:</span></td>
          <td><s:property value="js.name"/>

        </tr>
        <tr>
          <td><span class="style1">Address:</span></td>
          <td><s:property value="js.address"/>
          </td>
        </tr>
        <tr>
          <td><span class="style1">Email:</span></td>
          <td><s:property value="js.email"/>
         
        </tr>
        <tr>
          <td><span class="style1">Phone:</span></td>
          <td><s:property value="js.phone"/>
         </td>
        </tr>
        
         <tr>
          <td><span class="style1">Expected Salary:</span></td>
          <td><s:property value="js.expectedSalary"/>
         </td>
        </tr>
        
         <tr>
          <td><span class="style1">Skils:</span></td>
          <td><s:iterator var="jsk" value="js.jobSeekerSkill" status="st">
                 ${jsk.skill.name}<s:if test="!#st.last">,</s:if>
                 </s:iterator>
         </td>
        </tr>
        <tfoot>

        </tfoot>
          </table>
          </form>
          
<font style="font-size: 17px;">
<a href="addCV.jsp">Upload CV</a> <br />
<!--<a href="javascript:void(0)" onclick="openWin('jsSkill!add.action','add',500,200,0)">Update Skill</a> <br/>-->
<a href="updateJsPassword.jsp" target="_bank">Update Password</a> <br/>

</font>

</div>
</body>
</html>