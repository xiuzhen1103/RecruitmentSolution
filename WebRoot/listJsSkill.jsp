<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Display All Skill </title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    
   <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
   <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.4.min.js"></script>

		<script type="text/javascript">
		

		function deleteSkill(jobSeekerSkillId) {
				if (skillCategoryId == "")
					return;
				var url = "jsSkill!delete?jobSeekerSkill.jobSeekerSkillId=" + jobSeekerSkillId;
				$.ajax({
					type : 'POST',
					url : url,
					success : function(data) {
					}
					}
				});
			}
		

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
  <li><a href="cv!list.action" target="_bank">List CV</a> </li>
  <li><a href="ir!listMySend">Interview History</a> </li>
   <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>

<h3><span class="label label-info">List Skills:</span> 
<a href="jsSkill!add.action"  target=“_blank”><img src="images/add.png" alt="add" title="update" height="30" width="35" ></a> <br/></h3>   
 
  <!--<a href="javascript:void(0)" onclick="openWin('jsSkill!add.action','add',500,200,0)">Add Skill</a>  -->
  <br />

   <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td class="info" width="5%" height="37" align="center"><b>JobSeekerSkillId</b></td>
		      <td class="info" width="10%" height="37" align="center"><b>SkillId</b></td>
		      <td class="info" width="10%" height="37" align="center"><b>Delete</b></td>
		 </tr>
		 <s:iterator value="jobSeekerSkills" id="s">
          
           <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#s.jobSeekerSkillId" /></td>
		  <td align="center" ><s:property value="#s.skill.name" /></td>
		<!--<td><button <s:property value="#s.jobSeekerSkillId" /> onchange="deleteSkill(this.value)">delete</button></td>-->
		 <!--  <td>Delete</a></td>-->
		 <td><a href="jsSkill!delete?id=<s:property value="#s.jobSeekerSkillId" />"><img src="images/delete.png" title="delete" alt="delete" height="20" width="15" ></a></td> 
		  </tr>
		    </s:iterator>
</table>
  
  </body>
</html>
