<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>
    <base href="<%=basePath%>">
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <title>Display all Jobs</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
 
  <body>

<p align="right">
Hello <s:property value="#session.jobSeeker.username"/><br/>
<a href="js!get?jsId=<s:property value="#session.jobSeeker.jsId"/> ">Profile</a> 
<a href="js!logout.action">Logout</a>
</p> 
<div align="center" id="header">
<h1><i>Recruitment Solution</i></h1>
<div class="menu_20124162">
	<ul>
    	<li><a href="job!logged.action">Home</a></li>
        <li><a href="">About Us</a></li>
        <li><a href="">Contact Us</a></li>

    </ul>
</div>
</div>
<br/><br/>

    <b>Display My Interview Records:</b>  
 <br> <br />
    <s:form method="post" action="ir!listMySend.action">
  		<s:textfield label="Please Enter Job Title" name="ir.job.title"></s:textfield>
  		<s:submit label="submit"/>
  	</s:form>

 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>IR Id</b></td>
		      <td width="20%" height="37" align="center"><b>Job Title</b></td>
		      <td width="10%" height="37" align="center"><b>Interviewee Phone</b></td>
		      <td width="15%" height="37" align="center"><b>Memo</b></td>
		      <td width="20%" height="37" align="center"><b>CV Title</b></td>
		      <td width="15%" height="37" align="center"><b>Interview Time</b></td>
		      <td width="10%" height="37" align="center"><b>Status</b></td>
          </tr>
 	
          <s:iterator value="irs" id="j">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
    		  <td align="center" ><s:property value="#j.interviewId" /></td>
    		  <td align="center" ><a href="job!detail?job.jobId=${j.job.jobId}"><s:property value="#j.job.title" /></a></td>
    		  <td align="center" ><s:property value="#j.phone" /></td>
    		  <td align="center" ><s:property value="#j.memo" /></td>
    		  <td align="center" ><s:property value="#j.cv.cvTitle" /></td>
        	  <td align="center" ><s:property value="#j.interviewTime" /></td>
        	  <td align="center" >
                <s:if test="status == 1">
                    No interview
                </s:if>
                <s:elseif test="status == 2">
                    interview success
                </s:elseif>
                <s:else>
                    interview fail
                </s:else>
              </td>
          </tr>
     </s:iterator>
    </table>
    
  </body>
</html>
