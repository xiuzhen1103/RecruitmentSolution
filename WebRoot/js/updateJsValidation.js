$(function(){
	addRequiredValidate("username");
	addRequiredValidate("name");
	addRequiredValidate("email");
});

function checkIm() {
	var image = $('#image').val();
	if (isImage(image)){
		$('#image').addClass('bgreen');
		$('#image_hint').html("");
	} else {
		$('#image').addClass('bred');
		$('#image_hint').html("<span class='formtips onSuccess'>" + "image invalid "+  "</span>");
	}
}

function isImage(str){
	if (str == null || str == "")
		return true;
	
    return /\.(jpg|png|gif)$/ig.test(str);
}

function validateForm() {
	
	if (!validate("username"))
		return false;
	
	if (!validate("name"))
		return false;
	
	if (!validate("email"))
		return false;
	
	var image = $('#image').val();
	if (image== null || image=="" || isImage(image)){
		$('#image').addClass('bgreen');
		$('#image_hint').html("");
	} else {
		$('#image').addClass('bred');
		$('#image_hint').html("<span class='formtips onSuccess'>" + "image invalid "+  "</span>");
		return false;
	}
	
	return true;
}

function validate(name) {
	var username = $('#' + name).val();
	if (username==null || username==""){
		$('#' + name).addClass('bred');
		$('#' + name + '_hint').html("<span class='formtips onSuccess'> invalid </span>");
		
		return false;
	} else {
		$('#' + name).addClass('bgreen');
		$('#' + name + '_hint').html("");
		
		return true;
	}
}

function addRequiredValidate(name) {
	$('#' + name).blur(function(){
		var username = $('#' + name).val();
		if (username==null || username==""){
			$('#' + name).addClass('bred');
			$('#' + name + '_hint').html("<span class='formtips onSuccess'> invalid </span>");
		} else {
			$('#' + name).addClass('bgreen');
			$('#' + name + '_hint').html("");
		}
	});
}




