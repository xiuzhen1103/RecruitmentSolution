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
    
    <title>Add jobSeeker Skill</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
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
  <b> Add Skill </b>
    <form method="post" action="jsSkill.action">

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
  </body>
</html>
