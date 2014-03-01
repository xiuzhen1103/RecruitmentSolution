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
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>

    <title>Update Area</title>

  </head>

  <body>
  <b> Update Area </b>
  
    <form method="post" action="updateArea">
 		Area Id:<input type="text" name="area.areaId" value="<s:property value='area.areaId'/>" readonly><br>
    	Parent Id:<input type="text" name="area.parentArea.areaId" value="<s:property value='area.parentArea.areaId'/>"><br>
    	Area Name:<input type="text" name="area.areaName" value="<s:property value='area.areaName'/>"><br>
    	Level:<input type="text" name="area.level" value="<s:property value='area.level'/>"><br>
    	Latitude:<input type="text" name="area.latitude" value="<s:property value='area.latitude'/>"><br>
    	Longitude:<input type="text" name="area.longitude" value="<s:property value='area.longitude'/>"><br>
    	<input type="submit" value="submit"/>
    </form>
 
  </body>
</html>
