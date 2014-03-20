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
    <b>Display All Skill </b>  
     <div align="center">

  <a href="jsSkill!add.action">Update Skill</a> <br/>
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
		<!--  <td><button <s:property value="#s.jobSeekerSkillId" /> onchange="deleteSkill(this.value)">delete</button></td>-->
		  <td><a href="jsSkill!delete?id=<s:property value="#s.jobSeekerSkillId" />">Delete</a></td>
		  </tr>
		    </s:iterator>
</table>
    
    <s:debug></s:debug>
  </body>
</html>
