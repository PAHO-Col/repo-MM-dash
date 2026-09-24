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

			function searchUser(busqueda) 
			{
				alert("ID Rol seleccionado: " + busqueda);

				// Hacer una llamada AJAX al servidor para filtrar los usuarios por rol
				$.ajax({
					url: "<?php echo url::site('admin/users/'); ?>", // Asegúrate de crear esta ruta
					type: "POST",
					data: { role_id: busqueda }, // Enviamos el ID del rol seleccionado
					success: function(data) {
						// Mostrar los usuarios filtrados en la vista
						$('#users_list').html(data);  // Actualiza el contenido de la lista de usuarios
					}
				});
			}
		
		

		
			function toggleAdditionalFields() {
				var selectedRole = $("#role").val();
				//alert("ooooooooooooooeeeeeeeeeeeeeeeeee"+selectedRole);
				if (selectedRole === 'IPS') {
					// Mostrar el campo 'ips_id' y ocultar 'crue_id'
					$('#ips_id').show();
					$('#crue_id').hide();
				} else if (selectedRole === 'CRUE') {
					// Mostrar el campo 'crue_id' y ocultar 'ips_id'
					$('#crue_id').show();
					$('#ips_id').hide();
				} else {
					// Ocultar ambos campos si no se selecciona 'IPS' o 'CRUE'
					$('#crue_id').hide();
					$('#ips_id').hide();
				}
			}
