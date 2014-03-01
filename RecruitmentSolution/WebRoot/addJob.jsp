<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript"
			src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
		<link href="<%=basePath%>style/style.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap.min.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap-theme.min.css"
			type="text/css" rel="StyleSheet" />
		<title>JobSeeker Register</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.4.min.js"></script>

		<script type="text/javascript">
	function getCountry(countryId) {
		alert(countryId);
			if (countryId == "")
				return;
			var url = "listCountry.action?area.areaId=" + countryId;
			alert(url);
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data) {
				alert(data);
				var countys =  data.split(",");//1_a  1_2d
				var countySelect = document.getElementById("countyId");
				countySelect.options.length=0;
				for(var i=0;i<countys.length-1;i++){
					var inner = countys[i].split("_");
					var varItem = new Option(inner[1],inner[0]); 
								countySelect.options.add(varItem); 
					
				}
				}
			});
		}
		
		function getDistrict(districtId) {
		alert(districtId);
			if (districtId == "")
				return;
			var url = "listDistrict.action?area.areaId=" + districtId;
			alert(url);
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data) {
				alert(data);
				var districts =  data.split(",");//1_a  1_2d
				var districtSelect = document.getElementById("districtId");
				districtSelect.options.length=0;
				for(var i=0;i<districts.length-1;i++){
					var inner = districts[i].split("_");
					var varItem = new Option(inner[1],inner[0]); 
								districtSelect.options.add(varItem); 	
				}
				}
			});
		}
	
	</script>
	</head>

	<body>
		<p align="right">
			Hello
			<s:property value="#session.employer.username" />
			<br />
			<a
				href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
			<a href="emp!logout.action">Logout</a>
			<br />
		</p>
		<div align="center" id="header">
			<h1>
				<i>Recruitment Solution</i>
			</h1>
			<div class="menu_20124162">
				<ul>
					<li>
						<a href="empLog.action">Home</a>
					</li>
					<li>
						<a href="">About Us</a>
					</li>
					<li>
						<a href="">Contact Us</a>
					</li>

				</ul>
			</div>
		</div>
		<br />
		<div id="reg">
			<form name="register" method="post" action="job.action">
				<input type="hidden" name="job.employer.empId"
					value="<s:property value='#session.employer.empId'/>" readonly>
				<br>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							Post Job
						</h3>
					</div>
					<div class="panel-body">
						<table width="400" height="263" border="0" align="left"
							cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<span class="style1">Job Title:</span>
								</td>
								<td>
									<input type="text" name="job.title" class="formstyle">
									<font color="#F9481C">*</font>
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Job Description:</span>
								</td>
								<td>
									<input type="text" name="job.jobDesc" class="formstyle">
									<font color="#F9481C">*</font>
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Start Date:</span>
								</td>
								<td>
									<input name="job.startDate"
										onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										class="formstyle">
									<font color="#F9481C">*</font>
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Address:</span>
								</td>
								<td>
									<input type="text" name="job.address" class="formstyle">
									<font color="#F9481C">*</font>
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Phone:</span>
								</td>
								<td>
									<input type="text" name="job.phone" class="formstyle">
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Num Of Position:</span>
								</td>
								<td>
									<input type="text" name="job.numPosition" class="formstyle">
								</td>
							</tr>
							<tr>

								<td>
									<span class="style1">Requirement:</span>
								</td>
								<td>
									<input type="text" name="job.requirement" class="formstyle">
									<font color="#F9481C">*</font>
								</td>
							</tr>
							<tr>

								<td>
									<span class="style1">Salary:</span>
								</td>
								<td>
									<input type="text" name="job.salary" class="formstyle">
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Area:</span>
								</td>
								<td>

									<select id="areaId" name="job.countryId.areaId"
										onchange="getCountry(this.value);" style="display: block;">
										<option value="">
											Please Choose Country
										</option>
										<s:iterator value="listCountrys" id="areas">
											<option value="<s:property value="#areas.areaId" />">
												<s:property value="#areas.areaName" />
											</option>
										</s:iterator>
									</select>

									<select id="countyId" name="job.countyId.areaId"
										onchange="getDistrict(this.value);" style="display: block;">
										<option value="">
											Please Choose County
										</option>

									</select>

									<select id="districtId" name="job.districtId.areaId" style="display: block;">
										<option value="">
											Please Choose District
										</option>
									</select>
									<font color="#F9481C">*</font>
								</td>
							</tr>

							<table style="width: 100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">

								<tr>
									<td colspan="2" width="5%" height="37" align="center">
										<b>Job Category</b>
									</td>
								</tr>

								<s:iterator value="listJobCategorys" id="jcs">
									<tr bgcolor="#EFF3F7" class="TableBody1"">
										<td>
											<input type="radio" name="job.radioList"
												value="<s:property value="#jcs.jobCaId" />" />
										</td>
										<td align="center">
											<s:property value="#jcs.name" />
										</td>
									</tr>
								</s:iterator>
							</table>
							<tfoot>
								<tr>
									<td colspan="2">
										<input name="back" type="button"
											class="btn btn-sm btn-default" onclick="history.back()"
											value="Back">
										
										<input name="submit" type="submit"
											class="btn btn-sm btn-primary" value="Submit">
										
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					</div>
			</form>
		</div>
	</body>
</html>
