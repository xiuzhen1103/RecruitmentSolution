<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome</title>
 <base href="<%=basePath%>">
<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<link type="text/css" href="<%=basePath%>js/select2/select2.css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select2/select2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/select2/select2_locale_en.js"></script>
<script type="text/javascript" src="<%=basePath%>js/area.js"></script>

</head>
<body>
<p align="right">
Hello <s:property value="#session.jobSeeker.username"/>
<img src=<s:property value="#session.jobSeeker.image"/> title="profile_image" alt="profile_image" height="30" width="30" >
<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a> 
<a href="js!logout.action">Logout</a>
</p> 

<div class="banner" >

</div>
		
<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!logged.action">Home</a></li>
  <li class="active" >News</li>
  <li><a href="report" target="_blank">Statistic</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>
</div>
<h3><span class="label label-info">Display All Jobs:</span></h3>


 <form method="post" action="job!logged.action" class="formstyle" style="padding: 5px 3px;">  
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

  Enter Job Title:<input type="text" name="job.title"/>
<input type="submit" value="submit"/>
 </form>
  			
  			<br />
 	 <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left"
							cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info">
		      <td width="10%" height="37" align="center"><b>Job Title</b></td>
		      <td width="20%" height="37" align="center"><b>Requirement</b></td>
		      <td width="10%" height="37" align="center"><b>Category</b></td>
		      <td width="8%" height="37" align="center"><b>Skill Category</b></td>
		      <td width="10%" height="37" align="center"><b>Skill</b></td>
		      <td width="5%" height="37" align="center"><b>Salary</b></td>
		      <td width="5%" height="37" align="center"><b>Number of Position</b></td>
		      <td width="5%" height="37" align="center"><b>Employer</b></td>
		      <td width="15%" height="37" align="center"><b>Create Time</b></td>
          </tr>
 	
          <tr bgcolor="#ddd"><td colspan="9"><b>Best Match</b></td></tr>
          <s:iterator value="jobs" id="j">
          <s:if test="#j.isBestMatch">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
    		  <td align="center" ><a href="job!detail?job.jobId=${j.jobId}&js.jsId=<s:property value="#session.jobSeeker.jsId"/>"><s:property value="#j.title" /></a></td>
        	  <td align="center" ><s:property value="#j.requirement" /></td>
        	  <td align="center" >
                <s:property value="#j.jobCategory.name" />
              </td>
        	  <td align="center" >
                <s:property value="#j.skillCategory.name" />
              </td>
        	  <td align="center" >
                <s:iterator value="#j.jobSkills" var="js" status="st">
                    <s:property value="#js.skill.name" /><s:if test="!#st.last">,</s:if>
                </s:iterator>
              </td>
        	  <td align="center" ><s:property value="#j.salary" /></td>
        	  <td align="center" ><s:property value="#j.numPosition" /></td>
        	  <td align="center" ><s:property value="#j.employer.companyName" /></td>
    		  <td align="center" ><s:property value="#j.createTime" /></td>
          </tr>
          </s:if>
          </s:iterator>
 	
          <tr bgcolor="#ddd"><td colspan="9"><b>Possible Match</b></td></tr>
          <s:iterator value="jobs" id="j">
          <s:if test="!#j.isBestMatch">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
    		  <td align="center" ><a href="job!detail?job.jobId=${j.jobId}&js.jsId=<s:property value="#session.jobSeeker.jsId"/>"><s:property value="#j.title" /></a></td>
        	  <td align="center" ><s:property value="#j.requirement" /></td>
        	  <td align="center" >
                <s:property value="#j.jobCategory.name" />
              </td>
        	  <td align="center" >
                <s:property value="#j.skillCategory.name" />
              </td>
        	  <td align="center" >
                <s:iterator value="#j.jobSkills" var="js" status="st">
                    <s:property value="#js.skill.name" /><s:if test="!#st.last">,</s:if>
                </s:iterator>
              </td>
        	  <td align="center" ><s:property value="#j.salary" /></td>
        	  <td align="center" ><s:property value="#j.numPosition" /></td>
        	  <td align="center" ><s:property value="#j.employer.companyName" /></td>
    		  <td align="center" ><s:property value="#j.createTime" /></td>
          </tr>
          </s:if>
          </s:iterator>
    </table>
    


</body>
</html>