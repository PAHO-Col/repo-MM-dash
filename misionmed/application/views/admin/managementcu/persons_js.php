// Populates the fields in the add/edit form
function fillFields(Id, nombre_persons, Cargo, documento_persons,nombre_prestador_servicio,tipo_empresa,direccion_prestardor_servicio,telefono_prestador_servicio,perfil_institucional,otro_perfil_institucional,nombre_representante_legal,correo_representante_legal,cargo_representante_legal) {

	show_addedit();
	
	$("#persons_id").attr("value", decodeURIComponent(Id));
	$("#nombre_persons").attr("value", decodeURIComponent(nombre_persons));
	$("#Cargo").attr("value", decodeURIComponent(Cargo));
	$("#documento_persons").attr("value", decodeURIComponent(documento_persons));
	$("#nombre_prestador_servicio").attr("value", decodeURIComponent(nombre_prestador_servicio));
	$("#tipo_empresa").attr("value", decodeURIComponent(tipo_empresa));
	$("#direccion_prestardor_servicio").attr("value", decodeURIComponent(direccion_prestardor_servicio));
	$("#telefono_prestador_servicio").attr("value", decodeURIComponent(telefono_prestador_servicio));
	$("#perfil_institucional").attr("value", decodeURIComponent(perfil_institucional));
	$("#otro_perfil_institucional").attr("value", decodeURIComponent(otro_perfil_institucional));
	$("#nombre_representante_legal").attr("value", decodeURIComponent(nombre_representante_legal));
	$("#correo_representante_legal").attr("value", decodeURIComponent(correo_representante_legal));
	$("#cargo_representante_legal").attr("value", decodeURIComponent(cargo_representante_legal));
	
}

// Ajax Submission
function rolesAction ( action, confirmAction, id, nombre )
{
	var statusMessage;
	var answer = confirm('<?php echo Kohana::lang('ui_admin.are_you_sure_you_want_to'); ?> ' + confirmAction+' ::' + nombre)
	if (answer){
		// Set Role ID
		$("#persons_id_main").attr("value", id);
		// Set Submit Type
		$("#persons_action_main").attr("value", action);		
		// Submit Form
		$("#personsListing").submit();
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
