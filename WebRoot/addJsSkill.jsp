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
    
    <title>Add JobSeeker Skill</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
   <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.4.min.js"></script>

		<script type="text/javascript">

		function getSubSkillCategory(skillCategoryId) {
				if (skillCategoryId == "")
					return;
				var url = "getSubSkills.action?skillCategory.skillCategoryId=" + skillCategoryId;
				$.ajax({
					type : 'POST',
					url : url,
					success : function(data) {
					var scs =  data.split(",");//1_a  1_2d
					var scSelect = document.getElementById("skillCategoryId");
					scSelect.options.length=0;
					for(var i=0;i<scs.length-1;i++){
						var inner = scs[i].split("_");
						var varItem = new Option(inner[1],inner[0]); 
							scSelect.options.add(varItem); 
					}
					}
				});
			}

	function getSkill(skillId) {
			if (skillId == "")
				return;
			var url = "getSkills.action?skillCategory.skillCategoryId=" + skillId;
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data) {
				//alert(data);
				var skills =  data.split(",");//1_a  1_2d
				var select = document.getElementById("skillId");
				select.innerHTML=data;
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
  <h3><span class="label label-info">Add Skills:</span></h3>  
    <form method="post" action="jsSkill.action" id="form1">

    	 <span class="style1" >Job Category:</span>
			<select onchange="getSubSkillCategory(this.value);" style="display: block;">
			<option value="">Please Choose Main Category</option>
			  <s:iterator value="listMSkillCategory" id="s">
				<option value="<s:property value="#s.skillCategoryId" />">
			   <s:property value="#s.name" />
			</option>
			</s:iterator>
			</select>

	 <span class="style1">Job:</span>
	
			<select multiple id="skillCategoryId" onchange="getSkill(this.value)"; style="display: block;">
				<option value="">
					Please Choose Sub Job Category
			</option>
			</select>

		<span class="style1">Skills:</span>
		
		<span id="skillId"> </span>
		
	<br />
    	
    	<input type="submit" value="submit"/>
    </form>
    </div>
  </body>
</html>
