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
	<div class="banner">
</div>
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="javascript:history.back()">Back</a></li>
  <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>	
		<div id="reg">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							Job Seeker Detail
						</h3>
					</div>
					<div class="panel-body">
                        <s:set var="js" value="jobskiller"/>
						<table width="400" height="263" border="0" align="left"
							cellpadding="0" cellspacing="0">
							
							<tr>
								<td>
									<span class="style1">Profile Image:</span>
								</td>
								<td>
								<img src="upload/js/${js.image}"  title="profile_image" alt="profile_image" height="80" width="80" >
									
								</td>
							</tr>
							
							<tr>
								<td>
									<span class="style1">User name:</span>
								</td>
								<td>
									${js.username}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Name:</span>
								</td>
								<td>
									${js.name}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Email:</span>
								</td>
								<td>
                                ${js.email}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Phone:</span>
								</td>
								<td>
									${js.phone}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Expected Salary:</span>
								</td>
								<td>
									${js.expectedSalary}
								</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Job Skill:</span>
								</td>
								<td>
									<s:iterator var="jsk" value="js.jobSeekerSkill" status="st">
                                        ${jsk.skill.name}<s:if test="!#st.last">,</s:if>
                                    </s:iterator>
                   				</td>
							</tr>
							<tr>
								<td>
									<span class="style1">Employed:</span>
								</td>
								<td>
									<s:if test="js.status == 0">No</s:if>
                                    <s:else>Yes</s:else>
								</td>
							</tr>
                            <tr>
                                <td>
                                    <span class="style1">Address:</span>
                                </td>
                                <td>
                                    ${js.address}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">CV:</span>
                                </td>
                                <td>
                                
                                  <s:iterator value="cvs" id="c" var="oneCv" status="st">
       						<s:if test="#st.last">
        							  <a href="downLoadCV.action?filename=<s:property value='#oneCv.cvTitle' />"><s:property value="#oneCv.cvTitle" /> </a>
        							
 							</s:if>
 							 </s:iterator> 


                                </td>
                            </tr>
                             
			<tfoot>
				<tr height="60">
					<td colspan="2" align="center">
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
