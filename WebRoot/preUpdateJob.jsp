<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <link type="text/css" href="<%=basePath%>js/select2/select2.css" rel="StyleSheet" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/select2/select2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/select2/select2_locale_en.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/area.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jobskill.js"></script>
    <title> PreUpdate Job</title>

  </head>
  <body>
   <p align="right">
  Hello <s:property value="#session.employer.username"/><br/>
  <a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
  <a href="emp!logout.action">Logout</a> <br/>
  </p> 
  <div align="center" id="header">
  <h1><i>Recruitment Solution</i></h1>
  <div class="menu_20124162">
	<ul>
    	<li><a href="empLog.action">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>
    </ul>
</div>
  </div>
<br/>

<div id="reg">
    <form method="post" action="updateJob" id="form1">
    	<input type="hidden" name="job.employer.empId" value="<s:property value='job.employer.empId'/>"/><br>
    	 <table width="400" height="263" border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <th colspan="2">Update Job</th>
        </tr>
        <tr>
          <td><span class="style1">Job Id:</span></td>
          <td><input type="text" name="job.jobId" value="<s:property value='job.jobId'/>" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
         <tr>
          <td><span class="style1">Job Desc:</span></td>
          <td><input type="text" name="job.jobDesc" value="<s:property value='job.jobDesc'/>" class="formstyle">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Start Date:</span></td>
          <td><input type="text" name="job.startDate" value="<s:property value='job.startDate'/>" class="formstyle" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})">
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Address:</span></td>
          <td><input type="text" name="job.address" value="<s:property value='job.address'/>" class="formstyle" >
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
         <td><span class="style1">Phone:</span></td>
          <td><input type="text" name="job.phone" class="formstyle">
   		  </td>
        </tr>

        <tr>
          <td><span class="style1">Num Position:</span></td>
          <td><input type="text" name="job.numPosition" value="<s:property value='job.numPosition'/>" class="formstyle" >
          </td>
        </tr>
        <tr>
          <td><span class="style1">Requirement:</span></td>
          <td><input type="text" name="job.requirement" value="<s:property value='job.requirement'/>" class="formstyle" >
          <font color="#F9481C">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Salary:</span></td>
          <td><input type="text" name="job.salary" value="<s:property value='job.salary'/>" class="formstyle" >
          </td>
        </tr>
        <tr>
			<td><span class="style1">Area:</span></td>
			<td>
            <select id="areaId" name="job.countryId.areaId"
                onchange="getCountry(this);" style="width:180px">
                <option value=""></option>
                <s:iterator value="listCountrys" id="areas">
                    <option value="<s:property value="#areas.areaId" />">
                        <s:property value="#areas.areaName" />
                    </option>
                </s:iterator>
            </select>

            <select id="countyId" name="job.countyId.areaId"
                onchange="getDistrict(this);" style="width:180px">
                <option value=""></option>

            </select>

            <select id="districtId" name="job.districtId.areaId" style="width:180px">
                <option value=""></option>
            </select>
            <font color="#F9481C">*</font>
			</td>
		</tr>
							
							<tr>
        <td> <span class="style1" >Job Category:</span></td>
		<td>
			<select id="categoryId" name="job.jobCategory.skillCategoryId" onchange="getSubSkillCategory(this);" style="width:180px">
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
		 <td> <span class="style1">Job:</span></td>
		<td>
			<select id="skillCategoryId" name="job.skillCategory.skillCategoryId" onchange="getSkill(this)" style="width:180px">
				<option value=""></option>
			</select>
        </td>
		</tr>
	<tr>
	
		<td><span class="style1">Skills:</span>
		<td>
		<span id="skillId"> </span>
		</td>
		</td>
	</tr>
        
          <tfoot>
       <tr>
          <td colspan="2">
          <input name="back" type="button"  onclick="history.back()" value="Back" ></li>
          <input name="submit" type="submit" value="Submit"></li>      
          </td>
        </tr>
        </tfoot>
          </table>
</form>
</div>


  </body>
</html>
