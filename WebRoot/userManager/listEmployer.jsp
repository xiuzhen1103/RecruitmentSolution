<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
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
<title>List Employers</title>
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
    <h3>
        <span class="label label-info">Display All Employers:</span>
    </h3>
    <form method="post" action="emp!list.action" class="formstyle" style="padding: 5px 3px;">
        Please Enter Email:
        <input type="text" name="emp.email" />
        Please Enter Company name:
        <input type="text" name="emp.companyName" />
        <button type="submit" class="btn btn-sm btn-primary">Submit</button>
    </form>
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
        <tr>
        	<td class="info" width="10%" height="37" align="center">
                <b>Image</B>
            </td>
        
            <td class="info" width="10%" height="37" align="center">
                <b>User name</B>
            </td>
            <td class="info" width="10%" height="37" align="center">
                <b>Email</b>
            </td>
            <td class="info" width="10%" height="37" align="center">
                <b>Phone</b>
            </td>
            <td class="info" width="10%" height="37" align="center">
                <b>Contact Name</b>
            </td>
            <td class="info" width="15%" height="37" align="center">
                <b>Web Site</b>
            </td>
            <td class="info" width="5%" height="37" align="center">
                <b>Company Size</b>
            </td>
            <td class="info" width="20%" height="37" align="center">
                <b>Address</b>
            </td>
             <td class="info" width="10%" height="37" align="center">
                <b>Last login</b>
                <a href="emp!sortEmp?sort=loginTime">
                    <img src="images/sort.png" height="20" width="15" alt="sort by login Time" title="sort by login Time">
                </a>
            </td>
            <td class="info" width="5%" height="37" align="center">
                <b>Delete</b>
            </td>
        </tr>
        <s:iterator value="employers" id="e">
            <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
               <td align="center">
                        <img src=upload/emp/<s:property value="#e.image" /> height="50" width="50"/>
                </td>
               
                <td align="center">
                    <s:property value="#e.username" />
                </td>
                <td align="center">
                    <s:property value="#e.email" />
                </td>
                <td align="center">
                    <s:property value="#e.phone" />
                </td>
                <td align="center">
                    <s:property value="#e.contactName" />
                </td>
                <td align="center">
                    <s:property value="#e.webSite" />
                </td>
                <td align="center">
                    <s:property value="#e.companySize" />
                </td>
                <td align="center">
                    <s:property value="#e.address" />
                </td>
                 <td align="center">
                     <s:date name="#e.loginTime"  format="dd/MM/yyyy HH:mm:ss" />
                </td>
                <td>
                    <a href="emp!delete?emp.empId=<s:property value="#e.empId" />">
                        <img src="images/delete.png" title="delete" alt="delete" height="25" width="20">
                    </a>
                </td>
            </tr>
        </s:iterator>
    </table>
   <div align="right" id="stuff"><a href="javascript:scroll(0,0)">Back To Top</a></div>
</body>
</html>
