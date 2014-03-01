<%@ page language="java"  pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=utf-8"/>
	<title>csdn</title>
</head>



	<frameset rows="58,*,28" frameborder="no" border="0" framespacing="0" id="frame1">
		<frame name="banner" scrolling="no" noresize src="<%=basePath %>admin/banner.jsp" frameborder="0" />
		  	<frameset  cols = "130,*" frameborder=yes bordercolor=silver frameborder="no" border="0" framespacing="0">
     			<frame src="<%=basePath %>admin/outlook.jsp" name="Links" scrolling="no" frameborder="0">
     			<frame src="<%=basePath %>admin/welcome.html" name="main" scrolling="auto" frameborder="0">
  			</frameset>
		<frame name="footFrame" scrolling="no" noresize src="<%=basePath %>admin/foot.jsp" frameborder="0" />
	</frameset>
	
<noframes>
<body>
</body>

</noframes>

</html>
