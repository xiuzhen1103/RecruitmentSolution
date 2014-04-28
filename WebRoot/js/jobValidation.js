$(function(){
	addRequiredValidate("title");
	addRequiredValidate("desc");
	addRequiredValidate("address");
	addRequiredValidate("requirement");
});

function checkDistrictId() {
	var username = $('#districtId').val();
	if (username==null || username=="" || username == 0){
		$('#districtId_hint').html("<span class='formtips onSuccess'> invalid </span>");
	} else {
		$('#districtId_hint').html("");
	}
}

function validateForm() {
	
	if (!validate("title"))
		return false;
	
	if (!validate("desc"))
		return false;
	
	if (!validate("address"))
		return false;
	
	if (!validate("requirement"))
		return false;
	
	var username = $('#districtId').val();
	if (username==null || username=="" || username == 0){
		$('#districtId_hint').html("<span class='formtips onSuccess'> invalid </span>");
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




