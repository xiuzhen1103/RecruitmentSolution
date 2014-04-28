<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> Skill Register</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  <b> Add Skill </b>
    <form method="post" action="sk.action">
    	Name:<input type="text" name="skill.name"><br>
    	Skill Category:<input type="text" name="skill.skillCategory.skillCategoryId"><br>
    	
    
			<select onchange="getSubSkillCategory(this.value);" style="display: block;">
			<option value="">Please Choose Main Category</option>
			  <s:iterator value="listMainSkillCategory" id="s">
				<option value="<s:property value="#s.skillCategoryId" />">
			   <s:property value="#s.name" />
			</option>
			</s:iterator>
			</select>


		 <span class="style1">Job:</span>
		
	
			<select multiple id="skillCategoryId" name="js.checkboxes" onchange="getSkill(this.value)"; style="display: block;">
				<option value="">
					Please Choose Sub Job Category
			</option>
			</select>
	
	
		
		<span class="style1">Skills:</span>

		<span id="skillId"> </span>

    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
