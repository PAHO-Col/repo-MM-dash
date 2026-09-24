// Populates the fields in the add/edit form
function fillFields(Id, nombre_ips, descripcion,crue_id) {

	show_addedit();
	$("#ips_id").attr("value", decodeURIComponent(Id));
	$("#nombre_ips").attr("value", decodeURIComponent(nombre_ips));
	$("#descripcion").attr("value", decodeURIComponent(descripcion));
	$("#crue_id").attr("value", decodeURIComponent(crue_id));


}

// Ajax Submission
function rolesAction ( action, confirmAction, id, nombre )
{
	var statusMessage;
	var answer = confirm('<?php echo Kohana::lang('ui_admin.are_you_sure_you_want_to'); ?> ' + confirmAction +' IPS : ' + nombre + '?')
	if (answer){
		// Set Role ID
		$("#ips_id_main").attr("value", id);
		// Set Submit Type
		$("#ips_action_main").attr("value", action);		
		// Submit Form
		$("#ipsListing").submit();
	}
}

function B( objAny ){
	// Test argument for true / false,
	if (objAny == 1) {
		return(true);
	} else {
		return(false);
	}
}
