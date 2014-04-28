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
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<link type="text/css" href="<%=basePath%>js/select2/select2.css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jobEditValidation.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select2/select2_locale_en.js"></script>
<script type="text/javascript" src="<%=basePath%>js/area.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jobskill.js"></script>
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<title>PreUpdate Job</title>
</head>
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
  				  <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
  				  <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
            </ol>
        </div>
    </div>
    <div id="reg">
        <form method="post" action="updateJob" id="form1" onsubmit="return validateForm();">
            <input type="hidden" name="job.employer.empId" value="<s:property value='job.employer.empId'/>" />
            <input type="hidden" name="job.jobId" value="<s:property value='job.jobId'/>" class="formstyle">
            <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
                <tr>
                    <th colspan="2">Update Job</th>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Job Title:</span>
                    </td>
                    <td>
                        <input type="text" id="title" name="job.title" value="<s:property value='job.title'/>" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="title_hint"></font>
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        <span class="style1">Job Desc:</span>
                    </td>
                    <td>
                        <input type="text" id="desc" name="job.jobDesc" value="<s:property value='job.jobDesc'/>" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="desc_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Address:</span>
                    </td>
                    <td>
                        <input type="text" id="address" name="job.address" value="<s:property value='job.address'/>" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="address_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Phone:</span>
                    </td>
                    <td>
                        <input type="text" name="job.phone" value="<s:property value='job.phone'/>" class="formstyle">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Num Position:</span>
                    </td>
                    <td>
                        <input type="text" name="job.numPosition" value="<s:property value='job.numPosition'/>" class="formstyle">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Requirement:</span>
                    </td>
                    <td>
                        <input type="text" id="requirement" name="job.requirement" value="<s:property value='job.requirement'/>" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="requirement_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Salary:</span>
                    </td>
                    <td>
                        <input type="text" name="job.salary" value="<s:property value='job.salary'/>" class="formstyle">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Area:</span>
                    </td>
                    <td>
                        <select id="areaId" name="job.countryId.areaId" onchange="getCountry(this);" style="width: 180px" >
                            <option value=""></option>
                            <s:iterator value="listCountrys" id="areas">
                                <option value="<s:property value="#areas.areaId" />">
                                    <s:property value="#areas.areaName" />
                                </option>
                            </s:iterator>
                        </select>
                        <select id="countyId" name="job.countyId.areaId" onchange="getDistrict(this);" style="width: 180px">
                            <option value=""></option>
                             <option value="<s:property value='job.countyId.areaId'/>" selected="selected"><s:property value='job.countyId.areaName'/></option>
                        </select>
                        <select id="districtId" name="job.districtId.areaId" style="width: 180px">
                            <option value=""></option>
                            <option value="<s:property value='job.districtId.areaId'/>" selected="selected"><s:property value='job.districtId.areaName'/></option>
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
                <tr>
                    <td>
                        <span class="style1">Skills:</span>
                    <td>
                        <span id="skillId"> 
                        <s:iterator value="job.jobSkills" id="s">
                                <input type="checkbox" name="job.checkboxes" checked="checked" value='<s:property value="#s.skill.skillId" />'/> <s:property value="#s.skill.name" />
                        </s:iterator>
                        
                        </span>
                    </td>
                </tr>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <div align="center">
                                <input name="back" type="button" class="btn btn-sm btn-default" onclick="history.back()" value="Back">
                                <input name="submit" type="submit" class="btn btn-sm btn-primary" value="Submit">
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </form>
    </div>
    <script type="text/javascript">
					$("#areaId").val(<s:property value="job.countryId.areaId"/>);

					var categoryId = '<s:property value="job.jobCategory.skillCategoryId"/>';
					var skillCategoryId = '<s:property value="job.skillCategory.skillCategoryId"/>';
					
					setTimeout(function() {
						$('#categoryId').select2("val", categoryId);
					}, 20);
					setTimeout(function() {
						getSubSkillCategory($('#categoryId'));
					}, 500);
					setTimeout(function() {
						$('#skillCategoryId').select2("val", skillCategoryId);
					}, 700);
				</script>
</body>
</html>
