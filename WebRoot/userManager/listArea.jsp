<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=UTF-8" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <link href="<%=basePath%>style/style.css"  type="text/css" rel="StyleSheet" />
    <link href="<%=basePath%>style/bootstrap.min.css" type="text/css" rel="StyleSheet" />
	<link href="<%=basePath%>style/bootstrap-theme.min.css" type="text/css" rel="StyleSheet" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <title>Display All Area</title>
  </head>
 
  <body>
  	 <p align="right">
Hello <s:property value="#session.admin.username"/><br/>
<a href="admin!logout.action">Logout</a>
</p> 
	<div class="banner" >
</div>

<div align="center">

<div class='navbar navbar-inverse'>
  <div class='nav-collapse' style="height: auto;">
    <ol class="breadcrumb" >
  <li><a href="userManager/admin.jsp">Home</a></li>
  <li class="active">News</li>
  <li><a href="<%=basePath%>report/report.jsp">Statistic</a></li>
    <li><a href="#">About Us</a></li>
</ol>
</div>
  </div>
     <a href="userManager/addArea.jsp"><img src="images/add.png" title="add" alt="add" height="30" width="30" > </a> 
  </div>
   <h3><span class="label label-info">Display All Area:</span></h3>   

  <form method="post" action="area!list.action"  class="formstyle" style="padding: 5px 3px;">
  Please Enter Area Name: <input type="text" name="area.areaName"/>  
  		
  	<button type="submit" class="btn btn-sm btn-primary">Submit</button>
  </form>
  		
 	 <table class="table table-striped table-bordered info" width="400" height="263" border="0" align="left" cellpadding="10" cellspacing="10"  >
 	 	 <tr class="info">
		      <td  width="5%" height="37" align="center"><b>Area Id</b></td>
		      <td  width="10%" height="37" align="center"><b>Area Name</b></td>
		      <td  width="10%" height="37" align="center"><b>Parent Area</b></td>
		      <td 	width="10%" height="37" align="center"><b>Level</b></td>
		       <td width="5%" height="37" align="center"><b>Update</b></td>
		      <td width="5%" height="37" align="center"><b>Delete</b></td>
          </tr>
 	
          <s:iterator value="areas" id="a">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#a.areaId" /></td>
		 <td align="center" ><s:property value="#a.parentArea.areaName" /></td> 
		 <td align="center" ><s:property value="#a.areaName" /></td> 
		 <td align="center" ><s:if test="level == 0">
                   Country
                </s:if>
                <s:elseif test="level == 2">
                    District
                </s:elseif>
                <s:else>
                    County
                </s:else></td>

    	   <td><a href="area!load?area.areaId=<s:property value="#a.areaId" />"><img src="images/edit.png" title="edit" alt="edit" height="20" width="25" ></a></td>
    	  <td><a href="area!delete?area.areaId=<s:property value="#a.areaId" />"><img src="images/delete.png" title="delete" alt="delete" height="25" width="20" ></a></td>
        </tr>
     </s:iterator>
    </table>
<div align="right"><a href="javascript:scroll(0,0)">Back To Top</a></div>
  </body>
</html>
