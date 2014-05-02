<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <title>Update Interview Record</title>
        <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
        <link href="<%=basePath%>style/style.css" type="text/css" rel="StyleSheet" />
        <script type="text/javascript" src="<%=basePath%>js/jquery-1.10.1.min.js"></script>
          <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    </head>

    <body>
   <p align="right">
Hello <s:property value="#session.employer.username"/>
<img src="upload/emp/<s:property value='#session.employer.image'/>" title="profile_image" alt="profile_image" height="50" width="50" >
<a href="emp!get?empId=<s:property value="#session.employer.empId"/> ">Profile</a>
<a href="emp!logout.action">Logout</a>
</p>
  <div class="banner"></div>
<div class='navbar navbar-inverse' align="center">
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
   <li><a href="empLog.action">Home</a></li>
  <li><a href="job!listEmpJob?job.employer.empId=<s:property value='#session.employer.empId'/>">Manage Job</a></li>
    <li><a href="ir!listSend?employer.empId=<s:property value='#session.employer.empId'/>">Manage Interview Email</a> </li>
     <li><a href="contactUs.jsp" target="_blank">Contact Us</a></li>
    <li><a href="aboutUs.jsp" target="_blank">About Us</a></li>
</ol>
</div>
  </div>

        <div id="reg">
            <form name="updateInterview" method="post" action="ir!update">
                <input type="hidden" name="ir.interviewId" value="${ir.interviewId}"/>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            Update Interview Record
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table width="400" height="263" border="0" align="left"
                            cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <span class="style1">Job Title:</span>
                                </td>
                                <td>
                                    ${ir.job.title}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">Job Category:</span>
                                </td>
                                <td>
                                    ${ir.job.jobCategory.name }
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">Skill Category:</span>
                                </td>
                                <td>
                                    ${ir.job.skillCategory.name }
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">Skill:</span>
                                </td>
                                <td>
                                    <s:iterator value="ir.job.jobSkills" var="js" status="st">
                                        ${js.skill.name}<s:if test="!#st.last">,</s:if>
                                    </s:iterator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">Job Seeker Name:</span>
                                </td>
                                <td>
                                    ${ir.js.name }
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">Job Seeker Phone:</span>
                                </td>
                                <td>
                                    ${ir.js.phone }
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="style1">Interview Result:</span>
                                </td>
                                <td>
                                    <select id="ir-status" name="ir.status">
                                        <option value="1">No interview</option>
                                        <option value="0">Interview fail</option>
                                        <option value="2">Interview success</option>
                                    </select>
                                </td>
                            </tr>
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <input name="back" type="button"
                                            class="btn btn-sm btn-default" onclick="history.back()"
                                            value="Back">
                                        
                                        <input name="submit" type="submit"
                                            class="btn btn-sm btn-primary" value="Submit">
                                        
                                    </td>
                                </tr>
                                 <tr>
        		  <td align="left"><span class="style1">&nbsp;</span></td>
         		 <td><s:if test="tips != null"><font color="red">${tips}</font></s:if>
        		  </td>
       		 </tr>
                            </tfoot>
                        </table>
                    </div>
                    </div>
            </form>
        </div>
        <script type="text/javascript">
        	var st = '${ir.status}';
        	$(function(){
        		$('#ir-status').val(st);
        	});
        </script>
    </body>
</html>
    