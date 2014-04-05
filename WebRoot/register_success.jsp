<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>添加记录成功</title>
<script type="text/javascript">


function closewindow(){
	//if(window.opener){
	//	window.opener.location.reload();
		//window.history.back(-1);
		window.close();
	//}
}
function clock(){
	i = i -1;
	if(document.getElementById("info")){
		document.getElementById("info").innerHTML = "This window will be closed in "+i+"seconds";
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
<center>
	添加记录成功！<p>
	<div id="info">This window will be closed in 3 seconds</div>
	<input type="button" value="关闭窗口" onclick="closewindow();">
</center>
</body>
</html>