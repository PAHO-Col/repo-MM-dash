<?php
/**
 * Stats js file.
 *
 * Handles javascript stuff related to stats function.
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
?>

//@mr_k ::: la siguiente funcion consulta el codigo del municipio en el select
function myFunction(valo) {				

			alert("INGRESE EN LA FUNCION 111");		
			alert("INGRESE EN LA FUNCION 222::: "+valo+" :::");
			var municipioSelect = $('select[name="mpio"]');
			
			// Obtener el ID del select de municipios
			//var municipioSelectxx = $('#campomunicipio').val();		
							
			//var municipioSelect = $('#custom_field_'+municipioSelectxx); // Asegúrate de que sea el ID correcto
			//var municipioSelect = $('#custom_field_345'); // Asegúrate de que sea el ID correcto
							
			// Confirmación

				$.post("<?php echo url::site().'reports/latomar_mpio'; ?>",{ form_id: 1, incident_id: '', dpto: valo },  // Asegúrate de enviar form_id correcto				
					function(data) {
						if (data.status == 'success') {
							
							//mpio.empty(); // Limpia el select de municipios
							municipioSelect.empty();
							// Agregar nuevas opciones al select de municipios
							$.each(data.response, function(key, value) {
								municipioSelect.append($('<option></option>').attr('value', key).text(value));
							});
									
							//$('#form_loader').html(''); // Quita el loader
						}
					}, 
					"json"
				);
			
}


// Date Picker JS
jQuery(document).ready(function() {
	jQuery("#dp1").datepicker({ 
	    showOn: "both",
		dateFormat: "yy-mm-dd",
	    buttonImage: "<?php echo url::file_loc('img'); ?>media/img/icon-calendar.gif", 
	    buttonImageOnly: true 
	});
	
	jQuery("#dp2").datepicker({ 
	    showOn: "both",
		dateFormat: "yy-mm-dd",
	    buttonImage: "<?php echo url::file_loc('img'); ?>media/img/icon-calendar.gif", 
	    buttonImageOnly: true 
	});


	
	
	
<?php
	// Prevent an HTTP call if auto upgrading isn't enabled and
	//   make sure we are looking at the dashboard
	if (Kohana::config('config.enable_auto_upgrader') == TRUE
		AND Router::$controller == 'dashboard'){
?>

// Check for a new version of the Ushahidi Software
jQuery(document).ready(function() {
	// Check if we need to upgrade this deployment of Ushahidi
	//   if we're on the dashboard, check for a new version
	jQuery.get("<?php echo url::site().'admin/upgrade/check_current_version' ?>", function(data){
			jQuery('#need_to_upgrade').html(data);
			jQuery('#need_to_upgrade').removeAttr("style");
		});
		
});

<?php
	}
?>
	
	
});