/*<script type="text/javascript"src="admin/base/ry/js/ry_A.js"></script>*/

function postData() {
	post_json(path_home+'base/ry/update.jw', getFormData());
	/*$.post(path_home+'base/ry/update.jw',getFormData(),function(result){	
		if (result.statusCode == 99) {	
		var msg ='';	
		for ( var i in result.msg) {	
			msg = msg + result.msg[i] + '\n';	
		}	
		alert(msg);	
//		post_json("${path_home}/base/ry/dell.jw", {"ids": ids})
		} else if (
			result.statusCode == 0	
			|| result.statusCode == 1	
			|| result.statusCode == -1) {	
			alert(result.msg);	
		}
	setTimeout(function() {
	}, 1100);
	},'json');*/
}



function getFormData(){
	var data={};
	data.ry_id=$('#ry_id').val()
	data.bm_id=$('#bm_id').val()
	data.bm_name=$('#bm_id2').val()
	data.gw_id=$('#gw_id').val()
	data.gw_name=$('#gw_name').val()
	data.ry_cdate=$('#ry_cdate').val()
	data.ry_style=$('#ry_style').val()
	data.ry_sort=$('#ry_sort').val()
	data.ry_name=$('#ry_name').val()
	data.ry_sex=$('#ry_sex').val()
	data.ry_email=$('#ry_email').val()
	data.ry_phone=$('#ry_phone').val()
	data.ry_info=$('#ry_info').val()
	data.ry_account=$('#ry_account').val()
	data.ry_password=$('#ry_password').val()
return data;
}
