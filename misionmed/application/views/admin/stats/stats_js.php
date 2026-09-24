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
(function($) {
	// Función para cargar municipios
	function myFunction(valo) {
		//alert("INGRESE EN LA FUNCION 111");
		//alert("INGRESE EN LA FUNCION 222::: " + valo + " :::");
		var municipioSelect = $('select[name="mpio"]');
		

		$.post("<?php echo url::site().'reports/latomar_mpio'; ?>",
			{ form_id: 1, incident_id: '', dpto: valo },
			function(data) {
				if (data.status == 'success') {
					municipioSelect.empty(); // Limpia opciones anteriores
					municipioSelect.append($('<option></option>').attr('value', '').text('-- Selecciona un Municipio  --'));
					
					$.each(data.response, function(key, value) {
						municipioSelect.append($('<option></option>').attr('value', key).text(value));
					});
				} else {
					alert("No se pudo cargar los municipios.");
				}
			},
			"json"
		);
	}
	function myFunctionc(valo) {
		//alert("INGRESE EN LA FUNCION 111");
		alert("INGRESE EN LA FUNCION 222::: " + valo + " :::");
		var municipioSelect = $('select[name="mpio"]');
		

		$.post("<?php echo url::site().'reports/latomar_mpio_crue'; ?>",
			{  dpto: valo },
			function(data) {
				if (data.status == 'success') {
					//alert("cargar.");
					municipioSelect.empty(); // Limpia opciones anteriores
					municipioSelect.append($('<option></option>').attr('value', '').text('-- Selecciona un Municipio  --'));
					
					$.each(data.response, function(key, value) {
						municipioSelect.append($('<option></option>').attr('value', key).text(value));
					});
				} else {
					alert("No se pudo cargar los municipios.");
				}
			},
			"json"
		);
	}

	// Lo haces global para que sea accesible desde el HTML
	window.myFunction = myFunction;
	window.myFunctionc = myFunctionc;

	// Inicialización de datepickers
	$(document).ready(function() {
		$("#dp1").datepicker({ 
			showOn: "both",
			dateFormat: "yy-mm-dd",
			buttonImage: "<?php echo url::file_loc('img'); ?>media/img/icon-calendar.gif", 
			buttonImageOnly: true 
		});

		$("#dp2").datepicker({ 
			showOn: "both",
			dateFormat: "yy-mm-dd",
			buttonImage: "<?php echo url::file_loc('img'); ?>media/img/icon-calendar.gif", 
			buttonImageOnly: true 
		});

		<?php
		if (Kohana::config('config.enable_auto_upgrader') == TRUE
			AND Router::$controller == 'dashboard'){
		?>
		// Check for a new version
		$.get("<?php echo url::site().'admin/upgrade/check_current_version' ?>", function(data){
			$('#need_to_upgrade').html(data);
			$('#need_to_upgrade').removeAttr("style");
		});
		<?php } ?>
	});
})(jQuery);
