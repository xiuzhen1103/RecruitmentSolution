<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  
  <body>
    <form method="post" action="updateSc">
    	skill categoryIdy Id:<input type="text" name="skillCategory.skillCategoryId"><br>
    	name:<input type="text" name="skillCategory.name"><br>
    	level:<input type="text" name="skillCategory.level"><br>
    	Parent Id:<input type="text" name="skillCategory.parentSkillCategory.skillCategoryId"><br>
    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
