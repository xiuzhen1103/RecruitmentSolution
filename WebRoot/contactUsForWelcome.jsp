<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
        <style>
            .bred{border: 1px solid red;}
            .bgreen{border: 1px solid green;}
        </style>
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/jsValidation.js"></script>
	    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />	
  </head>
  <body>
  
<p align="right">
<a href="loginEmp.jsp">Employer Login</a> 
<a href="loginJs.jsp">Jobseeker Login</a> 
or
<a href="addEmp.jsp">Employer Register</a> 
<a href="js!registerJs.action">Jobseeker Register</a>
</p> 
<div class="banner" ></div>

<div align="center">
<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!first.action">Home</a></li>
  <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
<li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>


 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<img src="images/contact.jpg" title="contact" alt="contact" />	
			 <form name="register" method="post" action="admin.action" id="form2" >
				<div class="form-group">
					 <label >Subject</label><input type="text" name="subject" class="form-control" id="exampleInputEmail1" placeholder="Plase enter subject"/>
				</div>
				<div class="form-group">
					 <label >From</label><input type="text" name="email" class="form-control" id="exampleInputEmail1" placeholder="Plase enter your email or phone"/>
				</div>
				
				<div class="form-group">
					 <label>Message</label> <textarea rows="7" cols="50" class="form-control" name="content" placeholder="Plase enter message"> </textarea>
				</div>

		
	     <button type="submit" class="btn btn-default">Submit</button>
			</form>
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="http://recruitmentbuzz.co.uk/recruitment/wp-content/uploads/2013/12/recruitment-trends-in-2014-300x200.png" />
						<div class="caption">
							<h3>
								Jobseekers
							</h3>
							<p>
								Visit our Jobseeker Resource Centre for CV and interview preparation advice, career planning tools, salary guides and more.
							</p>
							<p>
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="http://www.gradvert.com/new/wp-content/uploads/2013/06/Recruitment-social-300x200.jpg" />
						<div class="caption">
							<h3>
								Employers
							</h3>
							<p>
								Visit our Employers Section for recruitment services, salary guides and employer resources.
							</p>
							<p>
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="http://accountablecare-staffing.com/wp-content/uploads/dream-job-300x200.png" />
						<div class="caption">
							<h3>
								Working & Living in Ireland
							</h3>
							<p>
								Resource center for jobseekers relocating to Ireland. We have a selection of living and working guides for each Irish city.
							</p>
							<p>
								
							</p>
						</div>
					</div>
				</div>
			</div>
			<blockquote><p align="center">
				 <small>© 2014 recruitmentsolution.ie - 100 jobs from 20 companies. 200 applications delivered.</small></p>
			</blockquote>
		</div>
	</div>
</div>


  </body>
  
</html>
