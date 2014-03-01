<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>Update Skill</title>

  
  <body>
    <form method="post" action="updateSk">
     	Skill Id:<input type="text" name="skill.skillId"><br>
  	    Name:<input type="text" name="skill.name"><br>
    	Skill Category:<input type="text" name="skill.skillCategory.skillCategoryId"><br>

    	<input type="submit" value="submit"/>
    </form>
  </body>
</html>
