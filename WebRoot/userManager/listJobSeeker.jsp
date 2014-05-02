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
<title>Display all jobSeeker</title>
<link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
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
        <span class="label label-info">Display All JobSeeker:</span>
    </h3>
    <form method="post" action="js!listJsForAdmin.action" class="formstyle" style="padding: 5px 3px;">
        Please Enter Email:
        <input type="text" name="js.email" />
        Please Enter User Name:
        <input type="text" name="js.username" />
        <button type="submit" class="btn btn-sm btn-primary">Submit</button>
    </form>
    <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10">
        <tr class="info">
         <td  width="10%" >
                <b>Profile Image</B>
            </td>
        
            <td width="10%" >
                <b>User name</B>
            </td>
            <td  width="15%">
                <b>Skill</b>
            </td>
            <td  width="10%">
                <b>Email</b>
            </td>
            <td width="10%" >
                <b>Phone</b>
            </td>
            <td width="15%">
                <b>Expected salary</b>
            </td>
            <td width="5%" >
                <b>Employed</b>
                <a href="js!sortJs?sort=status">
                    <img src="images/sort.png" height="20" width="15" alt="sort by status" title="sort by status">
                </a>
            </td>
            <td width="10%">
                <b>Last login</b>
                <a href="js!sortJs?sort=loginTime">
                    <img src="images/sort.png" height="20" width="15" alt="sort by login Time" title="sort by login Time">
                </a>
            </td>
            <td width="5%">
                <b>Delete</b>
            </td>
        </tr>
        <s:iterator value="jobseekers" id="seekers">
            <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor = '#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
                
                <td align="center">
                        <img src=upload/js/<s:property value="#seekers.image" /> height="50" width="50"/>
                </td>
                
                <td align="center">
                    <a href="js!detail?js.jsId=${seekers.jsId}">
                        <s:property value="#seekers.username" />
                    </a>
                </td>
                <td align="center">
                    <s:iterator var="jsk" value="#seekers.jobSeekerSkill" status="st">
                    ${jsk.skill.name}<s:if test="!#st.last">,</s:if>
                    </s:iterator>
                </td>
                <td align="center">
                    <s:property value="#seekers.email" />
                </td>
                <td align="center">
                    <s:property value="#seekers.phone" />
                </td>
                <td align="center">
                    <s:property value="#seekers.expectedSalary" />
                </td>
                <td align="center">
                    <s:if test="#seekers.status == 0">No</s:if>
                    <s:else>Yes</s:else>
                </td>
                 <td align="center">
                     <s:date name="#seekers.loginTime"  format="dd/MM/yyyy HH:mm:ss" />
                </td>
                <td>
                    <a href="js!delete?js.jsId=<s:property value="#seekers.jsId" />">
                        <img src="images/delete.png" title="delete" alt="delete" height="25" width="20">
                    </a>
                </td>
            </tr>
        </s:iterator>
    </table>
   <div align="right" id="stuff"><a href="javascript:scroll(0,0)">Back To Top</a></div>
</body>
</html>
