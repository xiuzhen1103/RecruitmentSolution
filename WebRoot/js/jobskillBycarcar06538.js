$(function() {

	/* job skill */
	$('#categoryId').select2({
		placeholder : "Select a Job Category",
		allowClear : true
	});
	$('#skillCategoryId').select2({
		placeholder : "Select a Skill Category",
		allowClear : true
	});
	$('#skillId2').select2({
		placeholder : "Select a Job Skill"
	});
});

function getSubSkillCategory(c) {
	var skillCategoryId = $(c).select2('val');
	var url = "listSubSkills.action?skillCategory.skillCategoryId=" + skillCategoryId;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			var scSelect = document.getElementById("skillCategoryId");
			scSelect.options.length = 0;
			if (data.length > 0 && data.indexOf(',') > -1) {
				var scs = data.split(",");// 1_a 1_2d
				var varItem = new Option('Select a Skill Category', '');
				scSelect.options.add(varItem);
				for (var i = 0; i < scs.length - 1; i++) {
					var inner = scs[i].split("_");
					var varItem = new Option(inner[1], inner[0]);
					scSelect.options.add(varItem);
				}
			}
		}
	});
}

function getSkill(c) {
	var skillId = $(c).select2('val');
	var url = "listSkills.action?skillCategory.skillCategoryId=" + skillId;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			$("#skillId").html(data);
		}
	});
}

function getSkill2(c) {
	var skillId = $(c).select2('val');
	var url = "listSkills2.action?skillCategory.skillCategoryId=" + skillId;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			var scSelect = document.getElementById("skillId");
			scSelect.options.length = 0;
			if (data.length > 0 && data.indexOf(',') > -1) {
				var scs = data.split(",");// a_b,c_d
				for (var i = 0; i < scs.length; i++) {
					var inner = scs[i].split("_");
					var varItem = new Option(inner[1], inner[0]);
					scSelect.options.add(varItem);
				}
			}
		}
	});
}