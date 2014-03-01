<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator page</title>
</head>
<body>
	<h2> Welcome to administrator page: </h2>

<b></>Employer: </b><br/>
	<a href="emp!list.action">Employer list: </a> <br/>
	<a href="employerById.jsp">Search Employer by Id:</a> <br/>
	<a href="deleteEmp.jsp">Delete Employer:</a> <br/>
	<a href="updateEmp.jsp">Update EMployer</a> <br/><br/>

<b>JobSeeker: </b><br/>
	<a href="jobSeekerById.jsp">Search JobSeeker by Id:</a> <br/>
	<a href="js!list.action">JobSeeker list: </a> <br/>
	<a href="deleteJs.jsp">Delete jobSeeker: </a> <br/>
	<a href="updateJs.jsp">Update JobSeeker</a> <br/><br/>
	
	<b>Area: </b><br/>
	<a href="searchAreaById.jsp">Search area by Id:</a> <br/>
	<a href="area!list.action">Area list: </a> <br/>
	<a href="deleteArea.jsp">Delete jobSeeker: </a> <br/>
	<a href="updateArea.jsp">Update JobSeeker</a> <br/><br/>

	<b>Job Category: </b><br/>
	<a href="addJobCategory.jsp">Add job Category</a> <br/>

</body>
</html>