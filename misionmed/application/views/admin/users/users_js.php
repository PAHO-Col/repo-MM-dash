/**
 * Users js file.
 *
 * Handles javascript stuff related to users function
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     API Controller
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
		// Users JS
		function fillFields(id, username, name, role, email, crue_id)
		{
			$("#user_id").attr("value", decodeURIComponent(id));
			$("#username").attr("value", decodeURIComponent(username));
			$("#name").attr("value", decodeURIComponent(name));
			$('#role').attr("value", decodeURIComponent(role) );
			$('#email').attr("value", decodeURIComponent(email ) );
			$('#crue_id').attr("value", decodeURIComponent(crue_id) );
			
			// Agregar aquí la lógica para mostrar u ocultar campos adicionales según el rol
			
    		toggleAdditionalFields(role);
			
		}
		
		// Form Submission
		function userAction ( action, confirmAction, id )
		{
			var statusMessage;
			var answer = confirm('<?php echo Kohana::lang('ui_admin.are_you_sure_you_want_to'); ?> ' 
				+ confirmAction + ' user with ID: ' + id + '?')
			if (answer){
				// Set User ID
				$("#user_id_action").attr("value", id);
				// Set Submit Type
				$("#action").attr("value", action);		
				// Submit Form
				$("#userMain").submit();			

			}
		}

		
		
			function searchUser(tipo, id) 
			{	
				
				let role_id = document.querySelector("select[name='role']").value;
				let elcrue_id = document.querySelector("select[name='crue_id']").value;
				let elips_id = document.querySelector("select[name='ips_id']").value;
    			console.log("Rol seleccionado: " + role_id);
				console.log("elcrue_id seleccionado: " + elcrue_id);
				console.log("elips_id seleccionado: " + elips_id);
				console.log("EL TIPO: " + tipo);
				/*alert("Rol seleccionado: " + role_id);
				alert("elcrue_id seleccionado: " + elcrue_id);
				alert("elips_id seleccionado: " + elips_id);
				alert("EL TIPO: " + tipo);*/

				if (role_id === '8') {
					// Mostrar el campo 'ips_id' y ocultar 'crue_id'
					$('#ips_id').show();
					$('#crue_id').show();

							}
				if (role_id === '7') {
					// Mostrar el campo 'ips_id' y ocultar 'crue_id'
					$('#ips_id').hide();
					$('#crue_id').show();
				}
				if (role_id != '8' && role_id != '7') {
					localStorage.clear();
					
					window.location.href = "<?php echo url::site('admin/users'); ?>?role_id=" + encodeURIComponent(id);
			//		//window.location.href = "<?php echo url::site('admin/users'); ?>?role_id=" + encodeURIComponent(id) + "&tipo=" + encodeURIComponent(tipo)+"&id_ips_crue=";
				}
				if(tipo==="ips" && role_id==='8'){

					//console.log("tipo seleccionado: " + tipo);
					//console.log("ID crue o ips seleccionado: " + id);
					//console.log("Rol seleccionado: " + role_id);
					//localStorage.clear();
					window.location.href = "<?php echo url::site('admin/users'); ?>?tipo=" + tipo+"&id_ips_crue="+id+"&role_id="+role_id;
				}
				if(tipo==="crue" && role_id==='7'){
					localStorage.clear();
					//console.log("tipo seleccionado: " + tipo);
					//console.log("ID crue o ips seleccionado: " + id);
					//console.log("Rol seleccionado: " + role_id);
					$('#ips_id').hide();
					$('#crue_id').hide();
					window.location.href = "<?php echo url::site('admin/users'); ?>?tipo=" + tipo+"&id_ips_crue="+id+"&role_id="+role_id;
				}

				if(tipo==="crue" && role_id==='8'){

					////console.log("tipo seleccionado: " + tipo);
					////console.log("ID crue o ips seleccionado: " + id);
					////console.log("Rol seleccionado: " + role_id);
					////console.log("elcrue_id seleccionado: " + elcrue_id);
					////console.log("elips_id seleccionado: " + elips_id);
					localStorage.setItem("selectedrole_id", role_id);
					window.location.href = "<?php echo url::site('admin/users'); ?>?tipo=" + tipo+"&id_ips_crue="+id+"&role_id="+role_id;
					}
				
  			
			}


			function buscarIps(crueId) {
    var $ipsSelect = $("#ips_id");  // Asegurar que el select existe
	alert("VALOR"+crueId);
    //$ipsSelect.empty(); // 🔥 Limpia solo los <option>, NO el <select>

    if (crueId) {
        $.ajax({
            url: "<?php echo url::site('admin/users/get_ips'); ?>",
            type: "GET",
            data: { crue_id: crueId },
            dataType: "json",
            success: function(response) {
               // console.log("Respuesta del servidor:", response); // Para depuración
                
                if (response.length > 0) {
                    $ipsSelect.append('<option value="">--- Selecciona una IPS ---</option>');
                    response.forEach(function(item) {  
                        $ipsSelect.append('<option value="' + item.id + '">' + item.nombre + '</option>');
                    });
                    $ipsSelect.show();  
                } else {
                    $ipsSelect.append('<option value="">No hay IPS disponibles</option>'); // Evita que el select quede vacío
                    $ipsSelect.show();
                }
            },
            error: function() {
                alert("Error al obtener las IPS.");
            }
        });
    } else {
        $ipsSelect.append('<option value="">Seleccione un CRUE primero</option>');
        $ipsSelect.show();
    }
}


		
			function toggleAdditionalFields() {
				var selectedRole = $("#role").val();
				//alert("EL VALOR SELECCIONADO ES "+selectedRole);
				if (selectedRole === 'IPS') {
					// Mostrar el campo 'ips_id' y ocultar 'crue_id'
					$('#ips_ids').show();
					$('#crue_ids').hide();
					$('#crue_id2').show();
				} else if (selectedRole === 'CRUE') {
					// Mostrar el campo 'crue_id' y ocultar 'ips_id'
					$('#crue_ids').show();
					$('#ips_ids').hide();
					//$('#ips_id2').hide();
					$('#crue_id2').hide();
				} else {
					// Ocultar ambos campos si no se selecciona 'IPS' o 'CRUE'
					$('#crue_ids').hide();
					$('#ips_ids').hide();
					$('#crue_id2').hide();
					//$('#ips_id2').hide();
				}
			}

			// Al cargar la página, recuperar el role_id de localStorage y seleccionarlo en el dropdown
			$(document).ready(function () {
				let savedRole = localStorage.getItem("selectedrole_id");
				//alert("EL VALOR:::::::"+savedRole);
				if(savedRole!=null){
				$('#ips_id').show();
				$('#crue_id').show();
				
				}
				//$('#ips_id').show();
				//$('#crue_id').show();
				//if (savedRole) {
				//	$('select[name="role"]').val(savedRole);
				//}
			});

