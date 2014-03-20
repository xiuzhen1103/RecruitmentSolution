<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
   <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
        <style>
            .bred{border: 1px solid red;}
            .bgreen{border: 1px solid green;}
        </style>
		<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/jsValidation.js"></script>
		<script type="text/javascript">

		function getSubSkillCategory(skillCategoryId) {
				if (skillCategoryId == "")
					return;
				var url = "listSubSkill.action?sc.skillCategoryId=" + skillCategoryId;
				$.ajax({
					type : 'POST',
					url : url,
					success : function(data) {
					var scs =  data.split(",");//1_a  1_2d
					var scSelect = document.getElementById("skillCategoryId");
					scSelect.options.length=0;
					for(var i=0;i<scs.length-1;i++){
						var inner = scs[i].split("_");
						var varItem = new Option(inner[1],inner[0]); 
							scSelect.options.add(varItem); 
					}
					}
				});
			}

	function getSkill(skillId) {
			if (skillId == "")
				return;
			var url = "listSkill.action?sc.skillCategoryId=" + skillId;
			$.ajax({
				type : 'POST',
				url : url,
				success : function(data) {
				//alert(data);
				var skills =  data.split(",");//1_a  1_2d
				var select = document.getElementById("skillId");
				select.innerHTML=data;
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
<h1><i></>Recruitment Solution</i></h1>
<div class="menu_20124162">
	<ul>
    	<li><a href="job!first.action">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact Us</a></li>

    </ul>
</div>
<br/><br/>
  <div id="reg">
 <div id="displayTip" class="displayNone"></div>  
    <form name="register" method="post" action="js.action" id="form2" onsubmit="return emp_validateForm();">
    <table width="600" height="263" border="0" align="right" cellpadding="0" cellspacing="0">
       <tr>
          <th colspan="2">Jobseeker Register</th>
        </tr>
        <tr>
          <td><span class="style1">User Name：</span></td>
          <td><input name="js.username" type="text" id="username" class="formstyle" need="true">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="username_hint"></font>
          </td>
        </tr>
        <tr>
         <td>Password：</td>
          <td><input name="js.password" type="password" id="pass1" class="formstyle" need="true">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="p1_hint"></font>
          </td>
        </tr>
        <tr>
        <td>Confirm Password:</td>
          <td><input name="js.password2" type="password" id="pass2" class="formstyle" need="true">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="p2_hint"></font>
          </td>
        </tr>
        <tr>
          <td><span class="style1">Name：</span></td>
          <td><input name="js.name" type="text" id="name" class="formstyle" need="true">
          <font color="#F9481C">*</font>
          <font color="#F9481C" id="name_hint"></font>
          </td>
        </tr>
    	 <tr>
          <td><span class="style1">Address：</span></td>
          <td><input name="js.address" type="text" id="address" class="formstyle">
          </td>
        </tr>
    	 <tr>
          <td><span class="style1">Email：</span></td>
          <td><input name="js.email" type="text" id="email" class="formstyle" need="true">
          <font color="#F9481C" >*</font>
          <font color="#F9481C" id="email_hint"></font>
          </td>
        </tr>
         <tr>
          <td><span class="style1">Phone：</span></td>
          <td><input name="js.phone" type="text" id="phone" class="formstyle">
          </td>
        </tr>
    	 <tr>
          <td><span class="style1">Expected Salary：</span></td>
          <td><input name="js.expectedSalary" type="text" id="expectedSalary" class="formstyle">
         </td>
        </tr>
        <tr>
        <td> <span class="style1" >Job Category:</span></td>
		<td>
			<select id="category" onchange="getSubSkillCategory(this.value);">
			<option value="">Please Choose Main Category</option>
			  <s:iterator value="listMainSkillCategory" id="s">
				<option value="<s:property value="#s.skillCategoryId" />">
			   <s:property value="#s.name" />
			</option>
			</s:iterator>
			</select>
            <font color="#F9481C">*</font>
            <font color="#F9481C" id="category_hint"></font>
		</td>
		</tr>
		
		<tr>
		 <td> <span class="style1">Job:</span></td>
		<td>
	
			<select multiple id="skillCategoryId" name="js.checkboxes" onchange="getSkill(this.value)";>
				<option value="">
					Please Choose Sub Job Category
			</option>
			</select>
            <font color="#F9481C">*</font>
            <font color="#F9481C" id="job_hint"></font>
			</tr>
	
		<tr>
		<td><span class="style1">Skills:</span>
		<td>
		    <span id="skillId"> </span>
            <span style="color:#F9481C" id="skill_hint"></span>
		</td>
		</tr>
  
    <tfoot>
        <tr>
          <td colspan="2">
              <input name="submit" type="submit" id="submit" value="Submit">
              <input name="reset" type="reset" value="Reset" >
          </td>
        </tr>
        <tr>
        </tfoot>
      </table>
    	
    </form>
</div>
  </body>
</html>
