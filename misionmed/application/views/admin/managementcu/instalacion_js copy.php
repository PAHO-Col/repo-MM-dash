// Populates the fields in the add/edit form
function fillFields(Id, institucionsolicitante, ubicacion_emblema,nombre_prestador_servicio,tipo_empresa,direccion_prestardor_servicio,telefono_prestador_servicio,perfil_institucional,otro_perfil_institucional,nombre_representante_legal,correo_representante_legal,cargo_representante_legal) {

	show_addedit();
	alert("HOLAAAAAAAAAAAAAAAAAA"+decodeURIComponent(nombre_prestador_servicio));
	$("#instalacion_id").attr("value", decodeURIComponent(Id));
	$("#institucionsolicitante").attr("value", decodeURIComponent(institucionsolicitante));
	$("#ubicacion_emblema").attr("value", decodeURIComponent(ubicacion_emblema));
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
function rolesAction ( action, confirmAction, id )
{
	var statusMessage;
	var answer = confirm('<?php echo Kohana::lang('ui_admin.are_you_sure_you_want_to'); ?> ' + confirmAction)
	if (answer){
		// Set Role ID
		$("#instalacion_id").attr("value", id);
		// Set Submit Type
		$("#instalacion_action_main").attr("value", action);		
		// Submit Form
		$("#instalaListing").submit();
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
