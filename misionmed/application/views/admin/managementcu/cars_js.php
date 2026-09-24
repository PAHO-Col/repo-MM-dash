// Populates the fields in the add/edit form
function fillFields(Id, placa_cars, descripcion,marca_cars,modelo_cars,nombre_prestador_servicio,tipo_empresa,direccion_prestardor_servicio,telefono_prestador_servicio,perfil_institucional,otro_perfil_institucional,nombre_representante_legal,correo_representante_legal,cargo_representante_legal,fechainicial,fechafinal) {

	show_addedit();
	$("#cars_id").attr("value", decodeURIComponent(Id));
	$("#placa_cars").attr("value", decodeURIComponent(placa_cars));
	$("#descripcion").attr("value", decodeURIComponent(descripcion));
	$("#marca_cars").attr("value", decodeURIComponent(marca_cars));
	$("#modelo_cars").attr("value", decodeURIComponent(modelo_cars));
	$("#nombre_prestador_servicio").attr("value", decodeURIComponent(nombre_prestador_servicio));
	$("#tipo_empresa").attr("value", decodeURIComponent(tipo_empresa));
	$("#direccion_prestardor_servicio").attr("value", decodeURIComponent(direccion_prestardor_servicio));
	$("#telefono_prestador_servicio").attr("value", decodeURIComponent(telefono_prestador_servicio));
	$("#perfil_institucional").attr("value", decodeURIComponent(perfil_institucional));
	$("#otro_perfil_institucional").attr("value", decodeURIComponent(otro_perfil_institucional));
	$("#nombre_representante_legal").attr("value", decodeURIComponent(nombre_representante_legal));
	$("#correo_representante_legal").attr("value", decodeURIComponent(correo_representante_legal));
	$("#cargo_representante_legal").attr("value", decodeURIComponent(cargo_representante_legal));
	("#fechainicial").attr("value", decodeURIComponent(fechainicial));
	$("#fechafinal").attr("value", decodeURIComponent(fechafinal));


}

// Ajax Submission
function rolesAction ( action, confirmAction, id, placa )
{

	
	var statusMessage;
	var answer = confirm('<?php echo Kohana::lang('ui_admin.are_you_sure_you_want_to'); ?> ' + confirmAction + ' '+placa)
	if (answer){
		// Set Role ID
		$("#cars_id_main").attr("value", id);
		// Set Submit Type
		$("#cars_action_main").attr("value", action);		
		// Submit Form
		$("#carsListing").submit();
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

function toggleAdditionalFields() {
				var selectedPerfil = $("#perfil_institucional").val();
				
				if (selectedPerfil === '4') {
					// Mostrar el campo 'ips_id' y ocultar 'crue_id'
					$('#perfil_id').show();
					
				} 
			}
