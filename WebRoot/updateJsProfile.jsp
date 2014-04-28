<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/updateJsValidation.js"></script>
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<style>
.bred {
	border: 1px solid red;
}

.bgreen {
	border: 1px solid green;
}
</style>
<script type="text/javascript">
	function openWin(f, n, w, h, s) {
		sb = s == "1" ? "1" : "0";
		l = (screen.width - w) / 2;
		t = (screen.height - h) / 2;
		sFeatures = "left=" + l + ",top=" + t + ",height=" + h + ",width=" + w
				+ ",center=1,scrollbars=" + sb
				+ ",status=0,directories=0,channelmode=0";
		openwin = window.open(f, n, sFeatures);
		if (!openwin.opener)
			openwin.opener = self;
		openwin.focus();
		return openwin;
	}

	function getSubSkillCategory(skillCategoryId) {
		if (skillCategoryId == "")
			return;
		var url = "listSubSkill.action?sc.skillCategoryId=" + skillCategoryId;
		$.ajax({
			type : 'POST',
			url : url,
			success : function(data) {
				var scs = data.split(",");//1_a  1_2d
				var scSelect = document.getElementById("skillCategoryId");
				scSelect.options.length = 0;
				for ( var i = 0; i < scs.length - 1; i++) {
					var inner = scs[i].split("_");
					var varItem = new Option(inner[1], inner[0]);
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
				var skills = data.split(",");//1_a  1_2d
				var select = document.getElementById("skillId");
				select.innerHTML = data;
			}
		});
	}
</script>
<title>Profile</title>
</head>
<body>
    <p align="right">
        Hello
        <s:property value="#session.jobSeeker.username" />
        <img src="upload/js/<s:property value='#session.jobSeeker.image'/>" title="profile_image" alt="profile_image" height="30" width="30">
        <a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a>
        <a href="js!logout.action">Logout</a>
    </p>
    <div class="banner"></div>
    <div align="center">
        <div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="job!logged.action">Home</a></li>
  <li><a href="cv!list.action" target="_bank">Manage CV</a> </li>
   <li><a href="ir!listMySend">Interview History</a> </li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
    
</ol>
</div>
        </div>
    </div>
    <div id="reg">
        <form method="post" action="updateJs" id="form2" enctype="multipart/form-data" onsubmit="return validateForm();">
            <input name="js.jsId" type="hidden" id="jsId" value="<s:property value='js.jsId'/>">
            <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
                <tr>
                    <th colspan="2" class="info"></>Update JobSeeker</th>
                    <img src="upload/js/${js.image}" title="profile image" alt="profile image" height="80" width="80">
                </tr>
                <tr>
                    <td>
                        <span class="style1">Username:</span>
                    </td>
                    <td>
                        <input name="js.username" type="text" id="username" value="<s:property value='js.username'/>" readonly class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="username_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Name:</span>
                    </td>
                    <td>
                        <input name="js.name" type="text" id="name" value="<s:property value='js.name'/>" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="name_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Address:</span>
                    </td>
                    <td>
                        <input name="js.address" type="text" id="address" value="<s:property value='js.address'/>" class="formstyle">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Email:</span>
                    </td>
                    <td>
                        <input name="js.email" type="text" id="email" value="<s:property value='js.email'/>" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="email_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Phone:</span>
                    </td>
                    <td>
                        <input name="js.phone" type="text" id="phone" value="<s:property value='js.phone'/>" class="formstyle">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Expected Salary:</span>
                    </td>
                    <td>
                        <input name="js.expectedSalary" type="text" id="expectedSalary" value="<s:property value='js.expectedSalary'/>" class="formstyle">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Profile Picture:</span>
                    </td>
                    <td>
                        <input type="file" id="image" name="upload" name="js.image" value="<s:property value='js.image' />" class="formstyle" onchange="checkIm();" />
                        <font color="#F9481C" id="image_hint"></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Job Category:</span>
                    </td>
                    <td>
                        <select id="category" onchange="getSubSkillCategory(this.value);">
                            <option value="">Please Choose Main Category</option>
                            <s:iterator value="listMainSkillCategorys" id="s">
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
                    <td>
                        <span class="style1">Job:</span>
                    </td>
                    <td>
                        <select multiple id="skillCategoryId" name="js.checkboxes" onchange="getSkill(this.value)";>
                            <option value="">Please Choose Sub Job Category</option>
                        </select>
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="job_hint"></font>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Skills:</span>
                    <td>
                        <span id="skillId"> </span>
                        <span style="color: #F9481C" id="skill_hint"></span>
                        <s:iterator value="js.jobSeekerSkill" id="s">
                                <input type="checkbox" name="js.checkboxes" checked="checked" value='<s:property value="#s.skill.skillId" />'/> <s:property value="#s.skill.name" />
                        </s:iterator>
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
        <font style="font-size: 17px;">
			<a href="addCV.jsp">Upload CV</a> <br />
            <a href="updateJsPassword.jsp" target="_bank">Update Password</a>
            <br />

        </font>
    </div>
</body>
</html>