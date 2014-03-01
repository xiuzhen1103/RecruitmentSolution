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
    <title>Display Past Experience</title>
  </head>
 
  <body>
    <b>Display All Past Experience:<b/>  
 <br> <br />
 <s:form method="post" action="pe!list.action">


 </s:form>
 Add Past Experience:  <a href="addPExperience.jsp">Add Past Experience</a> <br/> <br/>

 	 <table style="width:100%" width="778" border="0" cellPadding="0" cellSpacing="1" bgcolor="#6386d6">
 	 	 <tr>
		      <td width="5%" height="37" align="center"><b>Job Description</b></td>
		      <td width="10%" height="37" align="center"><b>Duty</b></td>
		      <td width="10%" height="37" align="center"><b>Employer Name</b></td>
		      <td width="15%" height="37" align="center"><b>Email</b></td>
		      <td width="20%" height="37" align="center"><b>Phone</b></td>
		      <td width="10%" height="37" align="center"><b>Address</b></td>
		      <td width="5%" height="37" align="center"><b>Start Date</b></td>
		      <td width="20%" height="37" align="center"><b>End Date</b></td>
		      <td width="5%" height="37" align="center"><b>Reason For Leave</b></td>
		      <td width="5%" height="37" align="center"><b>Update</b></td>
		      <td width="5%" height="37" align="center"><b>Delete</b></td>
		      
          </tr>
 	
          <s:iterator value="pes" id="p">
	      <tr bgcolor="#EFF3F7" class="TableBody1" onmouseover="this.bgColor='#DEE7FF';" onmouseout="this.bgColor='#EFF3F7';">
		  <td align="center" ><s:property value="#p.jobDescription" /></td>
		  <td align="center" ><s:property value="#p.duty" /></td>
		  <td align="center" ><s:property value="#p.empName" /></td>
		  <td align="center" ><s:property value="#p.email" /></td>
		  <td align="center" ><s:property value="#p.phone" /></td>
    	  <td align="center" ><s:property value="#p.address" /></td>
    	  <td align="center" ><s:property value="#p.startDate" /></td>
    	  <td align="center" ><s:property value="#p.endDate" /></td>
    	  <td align="center" ><s:property value="#p.reasonForLeave" /></td>
    	   <td><a href="pe!load?pe.pxId=<s:property value="#j.pxId" />">Update</a></td>
    	    <td><a href="pe!delete?pe.pxId=<s:property value="#p.pxId" />">Delete</a></td>
   	  
        </tr>
     </s:iterator>
    </table>
    
    <s:debug></s:debug>
  </body>
</html>
