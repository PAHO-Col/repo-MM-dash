<script>
<?PHP
$edit_mode = false;

$geometries = array();
$longitude = '-78.49104881799232';
$latitude = '39.46009334998073';
$incident_zoom = '4';
$default_zoom = '4';

?>

var proj_4326 = new OpenLayers.Projection('EPSG:4326');
var proj_900913 = new OpenLayers.Projection('EPSG:900913');

function incidentZoom(event) {
			$("#incident_zoom").val(map.getZoom());
		}
/**
		 * Google GeoCoder for homepage
		 */
		function geoCode(map, address, zoom)
		{
			console.log( map );
			$('#find_loading').html('<img src="<?php echo url::file_loc('img')."media/img/loading_g.gif"; ?>">');
			$.post("<?php echo url::site() . 'reports/geocode/' ?>", { address: address },
				function(data){
					if (data.status == 'success'){

						// Create Vector/Drawing layer
						vlayer = new OpenLayers.Layer.Vector( "Editable", {
							rendererOptions: {zIndexing: true}
						});
						// Clear the map first
						vlayer.removeFeatures(vlayer.features);
						$('input[name="geometry[]"]').remove();
						
						point = new OpenLayers.Geometry.Point(data.longitude, data.latitude);
						OpenLayers.Projection.transform(point, proj_4326,proj_900913);
						
						f = new OpenLayers.Feature.Vector(point);
						vlayer.addFeatures(f);
						
						// create a new lat/lon object
						myPoint = new OpenLayers.LonLat(data.longitude, data.latitude);
						myPoint.transform(proj_4326, map.getProjectionObject());

						// display the map centered on a latitude and longitude
						map.panTo(myPoint);
												
						// Update form values
						$("#country_name").val(data.country);
						$("#latitude").val(data.latitude);
						$("#longitude").val(data.longitude);
						$("#location_name").val(data.location_name);
					} else {
						// Alert message to be displayed
						var alertMessage = address + " not found!\n\n***************************\n" + 
						    "Enter more details like city, town, country\nor find a city or town " +
						    "close by and zoom in\nto find your precise location";

						alert(alertMessage)
					}
					$('div#find_loading').html('');
				}, "json");
			return false;
		}
<?php // require SYSPATH.'../themes/default/views/reports/submit_edit_js.php' ?>

$(document).ready(function() {
	navigator.geolocation.getCurrentPosition(function(pos){
	zoom = 10;
	geoCode(map._olMap, pos.coords.latitude + ', ' + pos.coords.longitude, zoom );
});
	

	$('#location_find').bind('keypress', function(e) {
		// console.log( 'keypress on: ' + $(this) );
		var code = (e.keyCode ? e.keyCode : e.which);
		if(code == 13) { //Enter keycode
			address = $(this).val();
			zoom = 10;
			geoCode(map._olMap, address, zoom);
			return false;
		}
	});
});
<?php //require SYSPATH.'../application/views/admin/manage/actions/actions_js.php' ?>
</script>
<style>
input.findtext {
	padding: 5px 3px 0 3px;
	font-size: 120%;
	font-weight: bold;
	color: #666;
	width: 250px;
	border: 1px #CCC solid;
	line-height: 1;
	height: 15px;
}
</style>
<?php print form::input('location_find', '', ' title="'.Kohana::lang('ui_main.location_example').'" class="findtext" placeholder="City, State and/or Country"'); ?>

