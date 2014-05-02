<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
    function isOffice(str) {
        return /\.(doc|docx|pdf)$/ig.test(str);
    }

    $(function() {
        $('#file').blur(
                function() {
                    var file = $('#file').val();
                    if (isOffice(file)) {
                        $('#file').addClass('bgreen');
                        $('#file_hint').html("");
                    } else {
                        $('#file').addClass('bred');
                        $('#file_hint').html(
                                "<span class='formtips onSuccess'>"
                                        + "invalid format, only upload in pdf,docx,doc " + "</span>");
                    }
                })
    });
    
    function validateForm() {
        
        var file = $('#file').val();
        if (isOffice(file)) {
            $('#file').addClass('bgreen');
            $('#file_hint').html("");
        } else {
            $('#file').addClass('bred');
            $('#file_hint').html(
                    "<span class='formtips onSuccess'>"
                            + "invalid format, only upload in pdf,docx,doc " + "</span>");
            return false;
        }
        
        return true;
    }
</script>
<title>add CV</title>
</head>
<p align="right">
Hello <s:property value="#session.jobSeeker.username"/>
<img src="upload/js/<s:property value='#session.jobSeeker.image'/>" title="profile_image" alt="profile_image" height="30" width="30" >
<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a> 
<a href="js!logout.action">Logout</a>
</p>
<div class="banner"></div>
<div align="center">
    <div class='navbar navbar-inverse'>
        <div class='nav-collapse' style="height: auto;">
            <ol class="breadcrumb">
               <li><a href="job!logged.action">Home</a></li>
 				 <li><a href="cv!list.action" target="_bank">Manage CV</a> </li>
  				 <li><a href="ir!listMySend">Interview History</a> </li>
  				  <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    			<li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
            </ol>
        </div>
    </div>
</div>
<div id="reg">
    <br />
    <br />
    <form method="post" action="updateCV" enctype="multipart/form-data" onsubmit="return validateForm();">
        <input type="hidden" name="cv.jobSeeker.jsId" value="<s:property value='#session.jobSeeker.jsId' />" />
        <input type="hidden" name="cv.cvId" value="<s:property value='cv.cvId' />" />
        <table class="table table-responsive table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
            <tr>
                <th colspan="2" class="info">
                    <h3>Update CV</h3>
                </th>
            </tr>
            <tr>
                <td>
                    <span class="style1">Cover Letter:</span>
                </td>
                <td>
                    <textarea name="cv.coverLetter"  rows="7" cols="50" class="formstyle"><s:property value="cv.coverLetter" /></textarea>
            </tr>
            <tr>
                <td>
                    <span class="style1">Choose File:</span>
                </td>
                <td>
                    <input id="file" type="file" name="upload" name="cv.cvTitle" value="<s:property value='cv.title' />" class="formstyle">
                    <font color="#F9481C">*</font>
                    <font color="#F9481C" id="file_hint"></font>
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
    </form>
</div>
</body>
</html>