<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<title> Employer Login Page </title>
</head>
<body>
<p align="right">
<a href="loginEmp.jsp">Employer Login</a> 
<a href="loginJs.jsp">Jobseeker Login</a> 
or
<a href="addEmp.jsp">Employer Register</a> 
<a href="js!registerJs.action">Jobseeker Register</a>
</p> 
<div class="banner" >

</div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!first.action">Home</a></li>
  <li><a href="contactUsForWelcome.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp">About Us</a></li>
</ol>
</div>
  </div>
</div>	

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				Employer Sign in
			</h3><img alt="140x140" src="http://t1.gstatic.com/images?q=tbn:ANd9GcQ6EDs9uhU9uhfCIUMf9UeWajO287tEJ9prXcV_4LYrwrKecuPp" />
			<form class="form-horizontal" role="form" name="empLogin" action="empLogin.action" method="post">

				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" name="emp.email"  class="form-control" id="inputEmail3" placeholder="Plase enter your email">
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					 
					<div class="col-sm-10">

						<input type="password" class="form-control" id="inputPassword3"  name="emp.password"  placeholder="Plase enter your password"  />
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-sm btn-primary">Submit</button>
					</div>
				</div>
			</form>
			
			
			<br /><br /><br />
			<blockquote><p align="center">
				 <small>© 2014 recruitmentsolution.ie - 100 jobs from 20 companies. 200 applications delivered.</small></p>
			</blockquote>
		</div>
	</div>
</div>
</body>
</html>