$(function(){
	addRequiredValidate("p1");
	addRequiredValidate("p2");
	
	$('#p1').blur(function(){
		var username = $('#p1').val();
		if (username==null || username==""){
			$('#p1').addClass('bred');
			$('#p1_hint').html("<span class='formtips onSuccess'> invalid </span>");
		} else {
			checkCPassword ();
		}
	});
	
	$('#p3').blur(function(){
		var username = $('#p3').val();
		var p2 = $('#p2').val();
		if (username==null || username=="" || p2 != username){
			$('#p3').addClass('bred');
			$('#p3_hint').html("<span class='formtips onSuccess'> invalid </span>");
		} else {
			$('#p3' ).addClass('bgreen');
			$('#p3_hint').html("");
		}
	});
});

function checkCPassword () {
	var p1 = $('#p1').val();
	var url = "checkEmpPassword.action?currentPassword=" + p1 + "&emp.empId=" + $('#empId').val();
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			if ('true' != data) {
				$('#p1').addClass('bred');
				$('#p1_hint').html("<span class='formtips onSuccess'> invalid </span>");
			} else {
				$('#p1' ).addClass('bgreen');
				$('#p1_hint').html("");
			}
		}
	});
}

function validateForm() {
	
	if (!validate("p1"))
		return false;
	
	if (!validate("p2"))
		return false;
	
	
	var p3 = $('#p3').val();
	var p2 = $('#p2').val();
	if (p3==null || p3=="" || p2 != p3){
		$('#p3').addClass('bred');
		$('#p3_hint').html("<span class='formtips onSuccess'> invalid </span>");
		return false;
	} else {
		$('#p3' ).addClass('bgreen');
		$('#p3_hint').html("");
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




