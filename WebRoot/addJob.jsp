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
<base href="<%=basePath%>">
<title>Job Register</title>
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<link type="text/css" href="<%=basePath%>js/select2/select2.css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jobValidation.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select2/select2_locale_en.js"></script>
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/area.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jobskill.js"></script>
<style>
.bred {
	border: 1px solid red;
}

.bgreen {
	border: 1px solid green;
}
</style>
</head>
<body>
     <p align="right">
Hello <s:property value="#session.employer.username"/>
<img src="upload/emp/<s:property value='#session.employer.image'/>" title="profile_image" alt="profile_image" height="50" width="50" >
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a>
</p>
    <div class="banner"></div>
    <div align="center">
        <div class='navbar navbar-inverse'>
            <div class='nav-collapse' style="height: auto;">
                <ol class="breadcrumb">
                     <li><a href="empLog.action">Home</a></li>
					  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
 					   <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
 				   <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
                </ol>
            </div>
        </div>
    </div>
    <div id="reg">
        <form name="register" method="post" action="job.action" id="form2" onsubmit="return validateForm();">
            <input type="hidden" name="job.employer.empId" value="<s:property value='#session.employer.empId'/>" readonly>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Post Job</h3>
                </div>
                <div class="panel-body">
                    <table width="400" height="263" border="0" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <span class="style1">Job Title:</span>
                            </td>
                            <td>
                                <input type="text" name="job.title" id="title" class="formstyle">
                                <font color="#F9481C">*</font>
                                <font color="#F9481C" id="title_hint"></font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style1">Job Description:</span>
                            </td>
                            <td>
                                <input type="text" name="job.jobDesc" id="desc" class="formstyle">
                                <font color="#F9481C">*</font>
                                <font color="#F9481C" id="desc_hint"></font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style1">Address:</span>
                            </td>
                            <td>
                                <input type="text" name="job.address" class="formstyle" id="address">
                                <font color="#F9481C">*</font>
                                <font color="#F9481C" id="address_hint"></font>
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
                                <input type="text" name="job.requirement" id="requirement" class="formstyle">
                                <font color="#F9481C">*</font>
                                <font color="#F9481C" id="requirement_hint"></font>
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
                                <select id="areaId" name="job.countryId.areaId" onchange="getCountry(this);" style="width: 180px">
                                    <option value=""></option>
                                    <s:iterator value="listCountrys" id="areas">
                                        <option value="<s:property value="#areas.areaId" />">
                                            <s:property value="#areas.areaName" />
                                        </option>
                                    </s:iterator>
                                </select>
                                <select id="countyId" name="job.countyId.areaId" onchange="getDistrict(this);" style="width: 180px">
                                    <option value=""></option>
                                </select>
                                <select id="districtId" name="job.districtId.areaId" style="width: 180px" onchange="checkDistrictId()">
                                    <option value=""></option>
                                </select>
                                <font color="#F9481C">*</font>
                                <font color="#F9481C" id="districtId_hint"></font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style1">Job Category:</span>
                            </td>
                            <td>
                                <select id="categoryId" name="job.jobCategory.skillCategoryId" onchange="getSubSkillCategory(this);" style="width: 180px">
                                    <option value=""></option>
                                    <s:iterator value="listMainSkillCategorys" id="s">
                                        <option value="<s:property value="#s.skillCategoryId" />">
                                            <s:property value="#s.name" />
                                        </option>
                                    </s:iterator>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style1">Job:</span>
                            </td>
                            <td>
                                <select id="skillCategoryId" name="job.skillCategory.skillCategoryId" onchange="getSkill(this)" style="width: 180px">
                                    <option value=""></option>
                                </select>
                            </td>
                        </tr>
                        <td>
                            <span class="style1">Skills:</span>
                        <td>
                            <span id="skillId"> </span>
                        </td>
                        </td>
                        </tr>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <input name="back" type="button" class="btn btn-sm btn-default" onclick="history.back()" value="Back">
                                    <input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
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
