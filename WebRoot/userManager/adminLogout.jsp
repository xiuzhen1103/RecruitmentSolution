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
<link href="<%=basePath%>style/login.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/login.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<title> Employer Login Page </title>
</head>
<body>

<div class="banner" >

</div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
 <li><a href="job!first.action">Home</a></li>
  
</ol>
</div>
  </div>
</div>	
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				Administrator Sign in
			</h3><img alt="140x140" src="http://t1.gstatic.com/images?q=tbn:ANd9GcRRuD9bNWbBoFMhgaa2OlY3dJpLqHSsZ9XuH1uxuaye72NsyAKy" />
			<form class="form-horizontal" role="form" name="adminLogin" action="adminLogin.action" method="post">

				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" name="admin.username"  class="form-control" id="inputEmail3" placeholder="Plase enter your username">
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					 
					<div class="col-sm-10">

						<input type="password" class="form-control" id="inputPassword3"  name="admin.password"  placeholder="Plase enter your password"  />
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