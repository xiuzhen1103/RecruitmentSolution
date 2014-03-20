<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@include file="/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Exception page</title>
	</head>
	<body>
		<h2>
			System exception occurred
		</h2>
		<hr></hr>
		<h3>
			Reason for the exception
		</h3>
		<s:actionerror />
		<p>
			<s:property value="%{exception.message}" />
		</p>
		<h3>
			Error details
		</h3>
		<p>
			<s:property value="%{exceptionStack}" />
		</p>
	</body>
</html>
