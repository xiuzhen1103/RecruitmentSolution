$(function(){
	addRequiredValidate("companyName");
	
	$('#image').blur(function(){
		var image = $('#image').val();
		if (isImage(image)){
			$('#image').addClass('bgreen');
			$('#image_hint').html("");
		} else {
			$('#image').addClass('bred');
			$('#image_hint').html("<span class='formtips onSuccess'>" + "image invalid "+  "</span>");
		}
	});
});

function validateForm() {
	
	if (!validate("companyName"))
		return false;
	
	return true;
}

function isImage(str){
	if (str == null || str == "")
		return true;
	
    return /\.(jpg|png|gif)$/ig.test(str);
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




