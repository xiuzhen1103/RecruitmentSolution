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
		<link href="<%=basePath%>style/style.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap.min.css" type="text/css"
			rel="StyleSheet" />
		<link href="<%=basePath%>style/bootstrap-theme.min.css"
			type="text/css" rel="StyleSheet" />
		<title>JobSeeker Register</title>
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
            <style type="text/css">
                td {height: 30px;}
            </style>
	</head>

	<body>
		<div align="center" id="header">
			<h1>
				<i>Recruitment Solution</i>
			</h1>
			<div class="menu_20124162">
				<ul>
					<li>
						<a href="javascript:history.back()">Back</a>
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
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							Job Detail
						</h3>
					</div>
					<div class="panel-body">
                        <s:set var="j" value="job"/>
						<table width="400" height="263" border="0" align="left"
							cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<span class="style1">Job Title:</span>
								</td>
								<td>
									${j.title}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Job Description:</span>
								</td>
								<td>
									${j.jobDesc}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Start Date:</span>
								</td>
								<td>
                                ${j.startDate }
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Address:</span>
								</td>
								<td>
									${j.address}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Phone:</span>
								</td>
								<td>
									${j.phone}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Num Of Position:</span>
								</td>
								<td>
									${j.numPosition}
								</td>
							</tr>
							<tr>

								<td>
									<span class="style1">Requirement:</span>
								</td>
								<td>
									${j.requirement}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Salary:</span>
								</td>
								<td>
									${j.salary}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Area:</span>
								</td>
								<td>
                                ${j.countyId.areaName},${j.countyId.areaName},${j.districtId.areaName}
								</td>
							</tr>
		<tr>
        <td> <span class="style1" >Job Category:</span></td>
		<td>
			<s:property value="#j.jobCategory.name" />
		</td>
		</tr>
		<tr>
		<tr>
        <td> <span class="style1" >Skill Category:</span></td>
		<td>
			<s:property value="#j.skillCategory.name" />
		</td>
		</tr>
		<tr>
        <td> <span class="style1" >Job Skill:</span></td>
		<td>
			<s:iterator value="#j.jobSkills" var="js" status="st">
                ${js.skill.name}<s:if test="!#st.last">,</s:if>
            </s:iterator>
		</td>
		</tr>
			<tfoot>
				<tr height="60">
					<td colspan="2" align="center">
                    <s:if test="#session.employer.empId != null">
						<a href="job!listAppliedJs?job.jobId=${j.jobId}" class="btn btn-sm btn-primary" role="button">Applied</a>
						&nbsp;&nbsp;
                    </s:if>
                    <s:else>
						<a href="apply!applyJob?job.jobId=${j.jobId}" class="btn btn-sm btn-primary" role="button">Apply</a>
						&nbsp;&nbsp;
                    </s:else>
                        <input name="back" type="button" class="btn btn-sm btn-default" onclick="history.back()" value="Back">
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
		</div>
		</div>
	</body>
</html>