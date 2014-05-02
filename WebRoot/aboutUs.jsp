<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<title>Welcome</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
	<link href="<%=basePath%>about/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />	
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
	

	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCgs-jm1x4RPPLPRBs-2f8o3VkjBG0sulw&sensor=false"></script>
	<script>
	var myCenter=new google.maps.LatLng(53.340175, -6.265876);

	function initialize()
	{
	var mapProp = {
	  center:myCenter,
	  zoom:18,
	  mapTypeId:google.maps.MapTypeId.ROADMAP
	  };

	var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

	var marker=new google.maps.Marker({
	  position:myCenter,
	  });

	marker.setMap(map);

	var infowindow = new google.maps.InfoWindow({
	  content:"We are here!"
	  });

	infowindow.open(map,marker);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>

<body>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="carousel slide" id="carousel-301476">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-301476">
					</li>
					<li data-slide-to="1" data-target="#carousel-301476">
					</li>
					<li data-slide-to="2" data-target="#carousel-301476" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="http://career.daimler.com/dhr/wms/images/header/special/00_Unternehmenskultur_900x300.jpg" />
						<div class="carousel-caption">
							<h4>
								Not a member?
							</h4>
							<p>
								Join Ireland's No. 1 recruitment website and open your doors to thousands of employers and countless job opportunities. You’ll find a wealth of information, enhanced profiles and helpful hints and tips on how to secure your ideal job.
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="http://uk-business-expert.com/wp-content/uploads/2013/09/careerfair_900x300.jpg" />
						<div class="carousel-caption">
							<h4>
								Jobs, Jobs, Jobs
							</h4>
							<p>
								Each month, thousands of new jobs are available on Recruiment Solution. See who is hiring in your industry and find out more about the top brands advertising on RecruitmentSolution.ie
							</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="http://rockconsultancy.gi/wp-content/uploads/multitasking-businessman-900x300-900x300.jpg" />
						<div class="carousel-caption">
							<h4>
								Let employers find you
							</h4>
							<p>
								Follow our simple three-step guide to making the most out of using Recruitment Solution for your job search
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-301476" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-301476" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>

		
		
		
		
		
			<div class="jumbotron well">
				<h1>
					Welcome
				</h1>
				<p>
					The main goal of is to try and make recruitment site more convenience to use when they use this application readily available for help. As today’s environment online market are all over places, especially in web site. These largely unrelated data are time consuming and distraction for user to search required data. I developed a way to eliminate irrelevant data and faster research time in busy environment. Jobseeker only view the jobs with preset skills when login with best match and possible match that in sorted order. Employer only views jobseekers with relevant skills by posting jobs. It makes research information easier, faster, and more convenient.
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="job!first.action">Learn more</a>
				</p>
			</div>
			<div id="reg"><
	<div id="map">
		<table class="table table-striped table-bordered info" width="40" height="50" border="0" align="left" cellpadding="5" cellspacing="5"  >
    	<tr>
          <th colspan="2" class="info">Opening Hours</th>
        </tr>
         <tr>
          <td><span class="style1">Monday:</span></td>
          <td>9:00 - 6:00</td>
        </tr>
 
         <tr>
          <td><span class="style1">Tuesday:</span></td>
          <td>9:00 - 6:00</td>
        </tr>
        <tr>
          <td><span class="style1">Wednesday</span></td>
          <td>9:00 - 5:30</td>
        </tr>
        <tr>
          <td><span class="style1">Thursday</span></td>
          <td>9:00 - 5:30</td>
        </tr>
        <tr>
          <td><span class="style1">Friday</span></td>
          <td>9:00 - 5:00</td>
        </tr>
 
          </table>
          
          
          </div>
          </div>
			<div class="row clearfix">
				<div class="col-md-12 column">
				<div id="googleMap" style="width:400px;height:280px;"></div>
				</div>
			</div> 	<br /><address> <strong>Recruiment Solution, Inc.</strong><br /> Aungier St<br /> Dublin, Dublin 2<br /> <abbr title="Phone">P:</abbr> (01) 402 3000</address>
			
		</div>
			
		</div>
		
					 <button type="button" class="btn btn-info  btn-block" onclick="window.open('https://twitter.com/ditofficial')">Follow us on Twitter</button> 
					 <button type="button" class="btn  btn-block btn-primary" onclick="window.open('https://www.facebook.com/dublininstituteoftechnology')">Follow us on Facebook</button>
					  <button type="button" class="btn btn-block btn-danger" onclick="window.open('https://plus.google.com/108617331416245438809/posts')">Follow us on Gmail</button>
		
		
	</div>
	
	<br />
			<blockquote><p align="center">
				 <small>© 2014 recruitmentsolution.ie - 100 jobs from 20 companies. 200 applications delivered.</small></p>
			</blockquote>
	
<div align="right" id="stuff"><a href="javascript:scroll(0,0)">Back To Top</a></div>
</body>

</html>