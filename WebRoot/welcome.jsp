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
		<link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
	
	
<script type="text/javascript">
	function getCountry(countryId) {
		
			if (countryId == "")
				return;
			var url = "listCountry.action?area.areaId=" + countryId;
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data) {
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
		
			if (districtId == "")
				return;
			var url = "listDistrict.action?area.areaId=" + districtId;
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data) {
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
<a href="loginEmp.jsp">Employer Login</a> 
<a href="loginJs.jsp">Jobseeker Login</a> 
or
<a href="addEmp.jsp">Employer Register</a> 
<a href="js!registerJs.action">Jobseeker Register</a>
</p> 
<div align="center" id="header">
<h1><i>Recruitment Solution</i></h1>
<div class="menu_20124162">
	<ul>
    	<li><a href="job!first.action">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact Us</a></li>

    </ul>
</div>
<br />
</div>
    
 <br /><b>Display All Jobs:</b>   <br /><br/>
 
 <form method="post" action="job!first.action" class="formstyle">

<select id="areaId" name="job.countryId.areaId" onchange="getCountry(this.value);" style="display: inline;">
<option value="">Please Choose Country</option>
<s:iterator value="listCountrys" id="areas">
<option value="<s:property value="#areas.areaId" />">
<s:property value="#areas.areaName" />
</option>
</s:iterator>
</select>

<select id="countyId" name="job.countyId.areaId" onchange="getDistrict(this.value);" style="display: inline;">
<option value="">Please Choose County</option>
</select>

<select id="districtId" name="job.districtId.areaId" style="display: inline;">
<option value="">
Please Choose District
</option>
</select>
  Enter Job Title:<input type="text" name="job.title"/>

<input type="submit" value="submit"/>
 </form>
 
  		<br/>
  			
 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Job Id</b></td>
		       <td width="10%" height="37" align="center"><b>Job Title</b></td>
		      <td width="10%" height="37" align="center"><b>Job Description</b></td>
		      <td width="15%" height="37" align="center"><b>Start Date</b></td>
		      <td width="20%" height="37" align="center"><b>Address</b></td>
		      <td width="10%" height="37" align="center"><b>Phone</b></td>
		      <td width="5%" height="37" align="center"><b>Number of Position</b></td>
		      <td width="20%" height="37" align="center"><b>Requirement</b></td>
		      <td width="5%" height="37" align="center"><b>Salary</b></td>
		      <td width="5%" height="37" align="center"><b>Employer</b></td>
		      <td width="5%" height="37" align="center"><b>Country</b></td>
		      <td width="5%" height="37" align="center"><b>County</b></td>
		      <td width="5%" height="37" align="center"><b>District</b></td>
		      <td width="5%" height="37" align="center"><b>Apply</b></td>
          </tr>
 	
          <s:iterator value="jobs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#j.jobId" /></td>
		  <td align="center" ><s:property value="#j.title" /></td>
		  <td align="center" ><s:property value="#j.jobDesc" /></td>
		  <td align="center" ><s:property value="#j.startDate" /></td>
		  <td align="center" ><s:property value="#j.address" /></td>
    	  <td align="center" ><s:property value="#j.phone" /></td>
    	  <td align="center" ><s:property value="#j.numPosition" /></td>
    	  <td align="center" ><s:property value="#j.requirement" /></td>
    	  <td align="center" ><s:property value="#j.salary" /></td>
    	  <td align="center" ><s:property value="#j.employer.companyName" /></td>
    	  <td align="center" ><s:property value="#j.countryId.areaName" /></td> 
    	 <td align="center" ><s:property value="#j.countyId.areaName" /></td>
    	 <td align="center" ><s:property value="#j.districtId.areaName" /></td>  
    	  <td><a href="apply!applyJob"/>Apply</a></td>
        </tr>
     </s:iterator>
    </table>
</body>
</html>