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
   <script type="text/javascript" src="<%=basePath%>jss/jsValidation.js"></script>
   <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
   <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.4.min.js"></script>

		<script type="text/javascript">

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
    <form name="register" method="post" action="js.action" id="form2" onsubmit="return validateForm();">
    <table width="400" height="263" border="0" align="right" cellpadding="0" cellspacing="0">
       <tr>
          <th colspan="2">Jobseeker Register</th>
        </tr>
        <tr>
          <td><span class="style1">User Name：</span></td>
          <td><input name="js.username" type="text" id="username" class="formstyle">
          <font color="#F9481C" id="username_hint">*</font></td>
          
        </tr>
        <tr>
         <td>Password：</td>
          <td><input name="js.password" type="password" id="pass1" class="formstyle">
          <font color="#F9481C" id="p1_hint">*</font></td>
        </tr>
        <tr>
        <td>Confirm Password:</td>
          <td><input name="js.password2" type="password" class="formstyle">
          <font color="#F9481C" id="p2_hint">*</font></td>
        </tr>
        <tr>
          <td><span class="style1">Name：</span></td>
          <td><input name="js.name" type="text" id="name" class="formstyle">
          <font color="#F9481C" id="name_hint">*</font></td>
        </tr>
    	 <tr>
          <td><span class="style1">Address：</span></td>
          <td><input name="js.address" type="text" id="address" class="formstyle">
          </td>
        </tr>
    	 <tr>
          <td><span class="style1">Email：</span></td>
          <td><input name="js.email" type="text" id="email" class="formstyle" >
          <font color="#F9481C" >*</font>
          <span id="email-hint" class="">&nbsp;</span></td>
          
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
        <td> <span class="style1">Skill Category:</span></td>
		<td>
			<select name="js.skillCategory.skillCategoryId" onchange="getSkill(this.value);" style="display: block;">
			<option value="">Please Choose Main Category</option>
			  <s:iterator value="listSkillCategory" id="s">
				<option value="<s:property value="#s.skillCategoryId" />">
			   <s:property value="#s.name" />
			</option>
			</s:iterator>
			</select>
				
		</td>
		</tr>
		<tr>
		
		<td><span class="style1">Skills:</span>
		<td>
		<span id="skillId"> </span>
		
			
	</td>
	</tr>
	
    	<table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 
 	 	 <tr>
		      <td colspan="2" width="5%" height="37" align="center"><b>Job Category</b></td>
		</tr>
		
    	 <s:iterator value="jobCategorys" id="jcs">
	      <tr bgcolor="#EFF3F7" class="TableBody1" ">
	      <td><input type="radio" name="js.radioList" value="<s:property value="#jcs.jobCaId" />" /></td>
		  <td align="center" ><s:property value="#jcs.name" /></td>
		  
        </tr>
         </s:iterator>
         
       </table>
    	 <tfoot>
        <tr>
          <td colspan="2">
              <input name="submit" type="submit" id="submit" value="Submit"></li>
              <input name="reset" type="reset" value="Reset" ></li>
          </td>
        </tr>
        <tr>
        </tfoot>
      </table>
    	
    </form>
</div>
  </body>
</html>
