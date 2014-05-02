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
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<style>
.bred {
	border: 1px solid red;
}

.bgreen {
	border: 1px solid green;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				updateCountry();

				$('#name').blur(
						function() {
							var username = $('#name').val();
							if (username == null || username == "") {
								$('#name').addClass('bred');
								$('#name_hint').html(
										"<span class='formtips onSuccess'>"
												+ "invalid" + "</span>");
							}
						});
			});

	function validateForm() {

		updateParent();
		
		var username = $('#name').val();
		if (username == null || username == "") {
			$('#name').addClass('bred');
			$('#name_hint')
					.html(
							"<span class='formtips onSuccess'>" + "invalid"
									+ "</span>");

			return false;
		}

	}

	function updateCountry() {
		var url = "arealistCountry.action";
		$.ajax({
			type : 'POST',
			url : url,
			success : function(data) {

				var scSelect = document.getElementById("country");
				scSelect.options.length = 0;
				var vi = new Option('Select a country', '');
				scSelect.options.add(vi);

				if (data.length > 0 && data.indexOf(',') > -1) {
					var scs = data.split(",");// 1_a 1_2d
					for ( var i = 0; i < scs.length - 1; i++) {
						var inner = scs[i].split("_");
						var varItem = new Option(inner[1], inner[0]);
						scSelect.options.add(varItem);
					}
				}
			}
		});
	}

	function updateDistrict() {
		var url = "arealistDistrict.action?area.areaId=" + $("#country").val();
		$.ajax({
			type : 'POST',
			url : url,
			success : function(data) {

				var scSelect = document.getElementById("district");
				scSelect.options.length = 0;
				var vi = new Option('Select a district', '');
				scSelect.options.add(vi);

				if (data.length > 0 && data.indexOf(',') > -1) {
					var scs = data.split(",");// 1_a 1_2d
					for ( var i = 0; i < scs.length - 1; i++) {
						var inner = scs[i].split("_");
						var varItem = new Option(inner[1], inner[0]);
						scSelect.options.add(varItem);
					}
				}
			}
		});
	}

	function updateParent() {
		var p = $("#district").val();
		if (p.length > 0) {
			$("#pid").val(p);
			return;
		}

		p = $("#country").val();
		if (p.length > 0) {
			$("#pid").val(p);
			return;
		}

		$("#pid").val("-1");
	}
</script>
<title>Add Area</title>
</head>
<body>
    <p align="right">
        Hello
        <s:property value="#session.admin.username" />
        <br />
        <a href="admin!logout">Logout</a>
    </p>
    <div class="banner"></div>
    <div align="center">
        <div class='navbar navbar-inverse'>
            <div class='nav-collapse' style="height: auto;">
                <ol class="breadcrumb">
                   <li><a href="userManager/admin.jsp">Home</a></li>
    <li><a href="emp!list.action">Employers </a></li>
    <li><a href="js!listJsForAdmin.action">JobSeekers</a></li>
    <li><a href="area!list.action">Areas</a></li>
    <li><a href="job!listForAdmin.action" >Jobs </a></li>
    <li><a href="sc!list.action">Skill Categories</a></li>
    <li><a href="sk!list.action">Skills</a></li>
                </ol>
            </div>
        </div>
    </div>
    <div id="reg">
        <form method="post" action="area.action" onsubmit="return validateForm();">
            <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
                <tr>
                    <th colspan="2" class="info">
                        <h3>Add Area:</h3>
                    </th>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Country:</span>
                    </td>
                    <td>
                        <select id="country" onchange="updateDistrict(this.value);">
                            <option value="">Please Choose Country</option>
                            <s:iterator value="areas0" id="s">
                                <option value="<s:property value="#s.areaId" />">
                                    <s:property value="#s.areaName" />
                                </option>
                            </s:iterator>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">District:</span>
                    </td>
                    <td>
                        <select id="district">
                            <option value="">Please Choose District</option>
                            <s:iterator value="areas1" id="s">
                                <option value="<s:property value="#s.areaId" />">
                                    <s:property value="#s.areaName" />
                                </option>
                            </s:iterator>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="style1">Area Name:</span>
                    </td>
                    <td>
                        <input id="pid" type="hidden" name="area.parentArea.areaId" class="formstyle" value="">
                        <input type="text" name="area.areaName" id="name" class="formstyle">
                        <font color="#F9481C">*</font>
                        <font color="#F9481C" id="name_hint"></font>
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
</body>
</html>
