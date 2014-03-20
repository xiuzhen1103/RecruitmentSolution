
function validateForm()
{
	var form = document.forms["register"];
	var username = form.elements["emp.username"].value;

	if (username==null || username=="")
	{
		alert("User name must be filled out");
		return false;
	}

	var password1=form.elements["emp.password"].value;
	var password2=form.elements["emp.password2"].value;
	if (password1=="" || password2=="")
	{
		alert("Password can not be empty"); 
		return false; 
	}

	if (password1!=password2)
	{
		alert("Password is not macthed");
		return false;
	}

	var email=form.elements["emp.email"].value;
	var atpos=email.indexOf("@");
	var dotpos=email.lastIndexOf(".");

	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		alert("Not a valid e-mail address");
		register.emp.email.focus(); 
		return false;
	}
} 


