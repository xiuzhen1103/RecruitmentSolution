$(function() {
	/* area */
	$('#areaId').select2({
		placeholder : "Select a Country",
		allowClear : true
	});
	$('#countyId').select2({
		placeholder : "Select a City",
		allowClear : true
	});
	$('#districtId').select2({
		placeholder : "Select a District",
		allowClear : true
	});
});

function getCountry(c) {
	var countryId = $(c).select2("val");
	var url = "listCountry.action?area.areaId=" + countryId;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			var countys = data.split(",");// 1_a 1_2d
			var countySelect = document.getElementById("countyId");
			countySelect.options.length = 0;
			for (var i = 0; i < countys.length - 1; i++) {
				var inner = countys[i].split("_");
				var varItem = new Option(inner[1], inner[0]);
				countySelect.options.add(varItem);

			}
		}
	});
}

function getDistrict(d) {
	var districtId = $(d).select2("val");
	var url = "listDistrict.action?area.areaId=" + districtId;
	$.ajax({
		type : 'POST',
		url : url,
		success : function(data) {
			var districts = data.split(",");// 1_a 1_2d
			var districtSelect = document.getElementById("districtId");
			districtSelect.options.length = 0;
			for (var i = 0; i < districts.length - 1; i++) {
				var inner = districts[i].split("_");
				var varItem = new Option(inner[1], inner[0]);
				districtSelect.options.add(varItem);

			}
		}
	});
}