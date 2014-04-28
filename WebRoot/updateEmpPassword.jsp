<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/empPasswordValidation.js"></script>
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<title>Update Employer Password</title>
<body>
     <p align="right">
Hello <s:property value="#session.employer.username"/>
<img src="upload/emp/<s:property value='#session.employer.image'/>" title="profile_image" alt="profile_image" height="50" width="50" >
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a>
</p>
    <div class="banner"></div>
    <div class='navbar navbar-inverse' align="center">
        <div class='nav-collapse' style="height: auto;">
            <ol class="breadcrumb">
              <li><a href="empLog.action">Home</a></li>
 			 <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
  			<li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">View Interview Email</a> </li>
   			 <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
            </ol>
        </div>
    </div>
    <div id="reg">
        <form method="post" action="updateEmpPassword" onsubmit="return validateForm();" id="form1">
            <input type="hidden" id="empId" name="emp.empId" value="<s:property value='#session.employer.empId'/>">
            <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
                <tr>
                    <th colspan="2">Update Password</th>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Current Password:</span>
                    </td>
                    <td>
                        <input id="p1" type="password" name="currentPassword" class="formstyle" />
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="p1_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">New Password:</span>
                    </td>
                    <td>
                        <input id="p2" type="password" name="emp.password" class="formstyle" />
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="p2_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Confirm Password:</span>
                    </td>
                    <td>
                        <input id="p3" type="password" name="emp.password2" class="formstyle" />
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="p3_hint"></font>
                    </td>
                </tr>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <div align="center">
                                <input name="reset" type="reset" class="btn btn-sm btn-default" value="Reset">
                                <input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
</body>
</html>