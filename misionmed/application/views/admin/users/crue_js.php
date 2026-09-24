// Populates the fields in the add/edit form
function fillFields(Id, Nombre, Descripcion) {

	show_addedit();
	$("#crue_id").attr("value", decodeURIComponent(Id));
	$("#Nombre").attr("value", decodeURIComponent(Nombre));
	$("#Descripcion").attr("value", decodeURIComponent(Descripcion));


}

// Ajax Submission
function rolesAction ( action, confirmAction, id,nombre )
{
	var statusMessage;
	var answer = confirm('<?php echo Kohana::lang('ui_admin.are_you_sure_you_want_to'); ?> ' + confirmAction+' Crue ID: ' + nombre + '?')
	if (answer){
		// Set Role ID
		$("#crue_id_main").attr("value", id);
		// Set Submit Type
		$("#crue_action_main").attr("value", action);		
		// Submit Form
		$("#crueListing").submit();
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
