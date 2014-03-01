<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>      
    <title>upload cv</title>  
  </head>  
    
  <body>   
    <s:form action="applyJob" enctype="multipart/form-data">  
    Cover Letter:<input type="text" name="cv.coverLetter"><br>
        <s:file name="upload" label="Upload"></s:file>  
        <s:submit value="Upload"></s:submit>  
        
    </s:form>  
  </body>  
</html>  