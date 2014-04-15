$(function(){
	$('#username').blur(function(){
		var username = $('#username').val();
		if (username==null || username==""){
			$('#username').addClass('bred');
			$('#username_hint').html("<span class='formtips onSuccess'>" + "username invalid "+  "</span>");
		} else {
			checkUsername();
		}
	});
	
	$(function(){
		$('#emp_username').blur(function(){
			var username = $('#emp_username').val();
			if (username==null || username==""){
				$('#emp_username').addClass('bred');
				$('#emp_username_hint').html("<span class='formtips onSuccess'>" + "username invalid "+  "</span>");
			} else {
				checkEmpUsername();
			}
		});
		
	$('#pass1').blur(function(){
		var pass1 = $('#pass1').val();
		if (pass1==null || pass1==""){
			$('#pass1').addClass('bred');
			$('#p1_hint').html("<span class='formtips onSuccess'>" + "password invalid "+  "</span>");
		} else {
			$('#pass1').addClass('bgreen');
			$('#p1_hint').html("");
		}
	});
	$('#pass2').blur(function(){
		var pass1 = $('#pass1').val();
		var pass2 = $('#pass2').val();
		if (pass2==null || pass2==""){
			$('#pass2').addClass('bred');
			$('#p2_hint').html("<span class='formtips onSuccess'>" + "password invalid "+  "</span>");
		} else {
			if (pass1!=pass2){
				$('#pass2').addClass('bred');
				$('#p2_hint').html("<span class='formtips onSuccess'>password not equals</span>");
			} else {
				$('#pass2').addClass('bgreen');
				$('#p2_hint').html("");
			}
		}
	});
	$('#name').blur(function(){
		var name = $('#name').val();
		if (name==null || name==""){
			$('#name').addClass('bred');
			$('#name_hint').html("<span class='formtips onSuccess'>" + "name invalid "+  "</span>");
		} else {
			$('#name').addClass('bgreen');
			$('#name_hint').html("");
		}
	});
	
	$('#desc').blur(function(){
		var desc = $('#desc').val();
		if (desc==null || desc==""){
			$('#desc').addClass('bred');
			$('#desc_hint').html("<span class='formtips onSuccess'>" + "name invalid "+  "</span>");
		} else {
			$('#desc').addClass('bgreen');
			$('#desc_hint').html("");
		}
	});
	
	$('#date').blur(function(){
		var date = $('#title').val();
		if (date==null || date==""){
			$('#date').addClass('bred');
			$('#date_hint').html("<span class='formtips onSuccess'>" + "title invalid "+  "</span>");
		} else {
			$('#date').addClass('bgreen');
			$('#date_hint').html("");
		}
	});
	
	
	$('#email').blur(function(){
		var email = $('#email').val();
		if (!isEmail(email)){
			$('#email').addClass('bred');
			$('#email_hint').html("<span class='formtips onSuccess'>" + "email invalid "+  "</span>");
		} else {
			checkEmail();
		}
	});
});


$('#emp_email').blur(function(){
	var email = $('#emp_email').val();
	if (!isEmail(email)){
		$('#emp_email').addClass('bred');
		$('#emp_email_hint').html("<span class='formtips onSuccess'>" + "email invalid "+  "</span>");
	} else {
		checkEmpEmail();
	}
});
});

function isEmail(str){
    var reg = /^[a-zA-Z0-9]+(\.)*[a-zA-Z0-9_-]+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    return reg.test(str);
}

function checkUsername() {
	var username = $('#username').val();
	var url = "jsCheckUsername.action?js.username=" + username;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			if ('true' == data) {
				$('#submit').attr('disabled', true);
				$('#username').addClass('bred');
				$('#username_hint').html("<span class='formtips onSuccess'>username is exist!</span>").css('color', 'red');
			} else {
				$('#submit').attr('disabled', false);
				$('#username').addClass('bgreen');
				$('#username_hint').html("<span class='formtips onSuccess'>username is valid!</span>").css('color', 'green');
			}
		}
	});
}

function checkEmail() {
	var email = $('#email').val();
	var url = "jsCheckEmail.action?js.email=" + email;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			if ('true' == data) {
				$('#submit').attr('disabled', true);
				$('#email').addClass('bred');
				$('#email_hint').html("<span class='formtips onSuccess'>email is exist!</span>").css('color', 'red');
			} else {
				$('#submit').attr('disabled', false);
				$('#email').addClass('bgreen');
				$('#email_hint').html("<span class='formtips onSuccess'>email is valid!</span>").css('color', 'green');
			}
		}
	});
}


function checkEmpUsername() {
	var emp_username = $('#emp_username').val();
	var url = "empCheckUsername.action?emp.username=" + emp_username;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			if ('true' == data) {
				$('#submit').attr('disabled', true);
				$('#emp_username').addClass('bred');
				$('#emp_username_hint').html("<span class='formtips onSuccess'>username is exist!</span>").css('color', 'red');
			} else {
				$('#submit').attr('disabled', false);
				$('#emp_username').addClass('bgreen');
				$('#emp_username_hint').html("<span class='formtips onSuccess'>username is valid!</span>").css('color', 'green');
			}
		}
	});
}

function checkEmpEmail() {
	var emp_email = $('#emp_email').val();
	var url = "empCheckEmail.action?emp.email=" + emp_email;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			if ('true' == data) {
				$('#submit').attr('disabled', true);
				$('#emp_email').addClass('bred');
				$('#emp_email_hint').html("<span class='formtips onSuccess'>email is exist!</span>").css('color', 'red');
			} else {
				$('#submit').attr('disabled', false);
				$('#emp_email').addClass('bgreen');
				$('#emp_email_hint').html("<span class='formtips onSuccess'>email is valid!</span>").css('color', 'green');
			}
		}
	});
}

function validateForm() {
	$('input[need="true"]').each(function(i, dom){
		var val = $(dom).val();
		if (null == val || '' == val) {
			$(dom).addClass('bred');
		} else {
			$(dom).addClass('bgreen');
		}
	});
	
	var category = $('#category').val();
	if (null == category || '' == category) {
		$('#category_hint').html("<span class='formtips onSuccess'>please select job category</span>");
		return false;
	}

	var skillCategory = $('#skillCategoryId').val();
	if (null == skillCategory || '' == skillCategory) {
		$('#job_hint').html("<span class='formtips onSuccess'>please select job</span>");
		return false;
	}

	var skills = $('#skillId').find("input[type='checkbox']:checked");
	if (skills.length < 1){
		$('#skill_hint').html("<span class='formtips onSuccess'>please select skills</span>");
		return false;
	}
	
	return checkUsername() && checkEmail();

}

function job_validateForm() {
	$('input[need="true"]').each(function(i, dom){
		var val = $(dom).val();
		if (null == val || '' == val) {
			$(dom).addClass('bred');
		} else {
			$(dom).addClass('bgreen');
		}
	});

}







