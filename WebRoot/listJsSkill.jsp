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
    
    <title>Display All Skill </title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

		</script>
  </head>
 
  <body>
  <p align="right">
Hello <s:property value="#session.jobSeeker.username"/><br/>
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
<br/><br/>
    <h2>Display All Skill </h2>  
     <div align="center">

  <a href="jsSkill!add.action"><img src="images/edit.jpg" alt="update" height="20" width="35" ></a> <br/>
  <br />
</div>

   <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>JobSeekerSkillId</b></td>
		      <td width="10%" height="37" align="center"><b>SkillId</b></td>
		      <td width="10%" height="37" align="center"><b>Delete</b></td>
		 </tr>
		 <s:iterator value="jobSeekerSkills" id="s">
          
           <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#s.jobSeekerSkillId" /></td>
		  <td align="center" ><s:property value="#s.skill.name" /></td>
		<!--<td><button <s:property value="#s.jobSeekerSkillId" /> onchange="deleteSkill(this.value)">delete</button></td>-->
		 <!--  <td>Delete</a></td>-->
		 <td><a href="jsSkill!delete?id=<s:property value="#s.jobSeekerSkillId" />"><img src="images/delete.jpg" alt="delete" height="20" width="15" ></a></td> 
		  </tr>
		    </s:iterator>
</table>
    

  </body>
</html>
