<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
	<title>Welcome</title>
	<link href="<%=basePath%>style/bootstrap.min.css" type="text/css"
			rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/myBootstrap_css.css" type="text/css" rel="StyleSheet" />
	<link type="text/css" href="<%=basePath%>js/select2/select2.css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/select2/select2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/select2/select2_locale_en.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/area.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jobskill.js"></script>
	
</head>

<body>
<p align="right">
<a href="loginEmp.jsp">Employer Login</a> 
<a href="loginJs.jsp">Jobseeker Login</a> 
or
<a href="addEmp.jsp">Employer Register</a> 
<a href="js!registerJs.action">Jobseeker Register</a>
</p> 
<div align="center" id="header">
<h1>Recruitment Solution</h1>
<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!first.action">Home</a></li>
  <li><a href="#">Library</a></li>
  <li class="active">Data</li>
</ol>
</div>
  </div>
</div>	

    
<h3><span class="label label-info">Display All Jobs:</span></h3>   
 
 <form method="post" action="job!first.action" class="formstyle" style="padding: 5px 3px;">

&nbsp;Country:
<select id="areaId" name="job.countryId.areaId" onchange="getCountry(this);" style="width:180px">
<option></option>
<s:iterator value="listCountrys" id="areas">
<option value="<s:property value="#areas.areaId" />">
<s:property value="#areas.areaName" />
</option>
</s:iterator>
</select>

&nbsp;City:
<select id="countyId" name="job.countyId.areaId" onchange="getDistrict(this);" style="width:180px">
<option></option>
</select>

&nbsp;District:
<select id="districtId" name="job.districtId.areaId" style="width:180px">
<option></option>
</select>
  Job Title:<input type="text" name="job.title"/>
  
  <div style="height:2px;margin: 1px 0;">&nbsp;</div>
  &nbsp;Job Category:
  <select id="categoryId" onchange="getSubSkillCategory(this);" name="job.jobCategory.skillCategoryId" style="width:180px">
      <option></option>
      <s:iterator value="listMainSkillCategorys" id="s">
        <option value="<s:property value="#s.skillCategoryId" />">
       <s:property value="#s.name" />
    </option>
    </s:iterator>
  </select>
  &nbsp;Job:
  <select id="skillCategoryId" onchange="getSkill2(this)" name="job.skillCategory.skillCategoryId" style="width:180px">
    <option></option>
  </select>
  &nbsp;Job Skill:
  <select multiple id="skillId" name="job.checkboxes" style="width:180px">
    <option></option>
  </select>

<button type="submit" class="btn btn-sm btn-primary">Submit</button>
 </form>
 
  	
 	  <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td  class="info" width="10%" height="37" align="center"><b>Job Title</b></td>
		      <td  class="info"  width="20%" height="37" align="center"><b>Requirement</b></td>
		      <td  class="info" width="10%" height="37" align="center"><b>Category</b></td>
		      <td width="8%" height="37" align="center"><b>Skill Category</b></td>
		      <td width="10%" height="37" align="center"><b>Skill</b></td>
		      <td width="5%" height="37" align="center"><b>Salary</b></td>
		      <td width="5%" height="37" align="center"><b>Number of Position</b></td>
		      <td width="5%" height="37" align="center"><b>Employer</b></td>
		      <td width="15%" height="37" align="center"><b>Start Date</b></td>
          </tr>
 	
          <s:iterator value="jobs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><a href="job!detail?job.jobId=${j.jobId}"><s:property value="#j.title" /></a></td>
    	  <td align="center" ><s:property value="#j.requirement" /></td>
    	  <td align="center" >
            <s:property value="#j.jobCategory.name" />
          </td>
    	  <td align="center" >
            <s:property value="#j.skillCategory.name" />
          </td>
    	  <td align="center" >
            <s:iterator value="#j.jobSkills" var="js" status="st">
                ${js.skill.name}<s:if test="!#st.last">,</s:if>
            </s:iterator>
          </td>
    	  <td align="center" ><s:property value="#j.salary" /></td>
    	  <td align="center" ><s:property value="#j.numPosition" /></td>
    	  <td align="center" ><s:property value="#j.employer.companyName" /></td>
		  <td align="center" ><s:property value="#j.startDate" /></td>
        </tr>
     </s:iterator>
    </table>
</body>
</html>