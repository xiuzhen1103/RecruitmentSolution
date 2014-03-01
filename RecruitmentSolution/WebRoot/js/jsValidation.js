
function validateForm()
{
	var form = document.forms["register"];
	var username = form.elements["js.username"].value;

	if (username==null || username=="")
	{
		$('#username-hint').html("<span class='formtips onSuccess'>" + "username invalid "+  "</span>");
		//alert("Please enter user name");
		return false;
	}

	var password1=form.elements["js.password"].value;
	var password2=form.elements["js.password2"].value;
	if (password1=="" || password2=="")
	{
		$('#password-hint').html("<span class='formtips onSuccess'>" + "password invalid "+  "</span>");
		//alert("Password can not be empty"); 
		return false; 
	}

	if (password1!=password2)
	{
		//alert("Password is not macthed");
		$('#password-hint').html("<span class='formtips onSuccess'>" + "password invalid "+  "</span>");
		return false;
	}

	var email=form.elements["js.email"].value;
	var atpos=email.indexOf("@");
	var dotpos=email.lastIndexOf(".");

	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
		//alert("Please enter a valid e-mail address");
		$('#email-hint').html("<span class='formtips onSuccess'>" + "email invalid "+  "</span>");
		form.elements["emp.email"].focus();
		return false;
	}

	var jobCategory=form.elements["js.radioList"].value;
	if (jobCategory==null || jobCategory=="")
	{
		alert("Please choose a job category");
		return false;
	}
	
	$.ajax({
		type:'post',
		url:'js.action',
		data : {'email' : email},
		dataType:'email',
		success : function(msg){
		 return true;
		},
		error:function(){
			return false;
		}
		});

} 


