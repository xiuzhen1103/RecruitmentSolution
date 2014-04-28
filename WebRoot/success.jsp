<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
		<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">

<title>success</title>
<script type="text/javascript">


function closewindow(){
	//if(window.opener){
	//	window.opener.location.reload();
		window.history.back(-1);
		//window.close();
	//}
}
function clock(){
	i = i -1;
	if(document.getElementById("info")){
		document.getElementById("info").innerHTML = "This window will be closed in "+i+" seconds";
	}
	if(i > 0)
		setTimeout("clock();",1000);
	else
		closewindow();
}

var i = 4;
clock();
</script>
</head>



<body>
<div class="banner" >

</div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li>Success page</li>
</ol>
</div>
  </div>
</div>	

<center>
<img src="images/success.jpg" title="success" alt="success" > <br />
	<h3>Success! </h3>
	<div id="info">This window will be closed in 3 seconds</div> <br />
	<input type="button" class="btn btn-sm btn-primary" value="close window" onclick="closewindow();">
</center>
</body>
</html>