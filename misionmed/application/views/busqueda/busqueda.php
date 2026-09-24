
<!--
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
-->
<!------ Include the above in your HEAD tag ---------->
<!--
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
-->

<div id="content">
<h1>Búsqueda</h1>
    <p>Selecciona el tipo de búsqueda que deseas realizar:..........................</p>
    
	<ul class="list-group">
            <li class="list-group-item">
                <a href="#"  onclick="show_addedit(true)">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Búsqueda de Personas
                </a>
            </li>
            <li class="list-group-item">
                <a href="busqueda_vehiculos.html">
                    <span class="glyphicon glyphicon-road" aria-hidden="true"></span> Búsqueda de Vehículos
                </a>
            </li>
            <li class="list-group-item">
                <a href="busqueda_instalaciones.html">
                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Búsqueda de Instalaciones
                </a>
            </li>
        </ul>
		<div class="tab" id="addedit" style="display: none">
					<?php print form::open(NULL, array('id' => 'ipssMain','name' => 'ipssMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="ips_id" name="ips_id" value=""/>
					<!--<input type="hidden" id="crue_id" name="crue_id" value=""/>-->
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('crue_ips.name_ips');?>:</strong><br />
						<?php print form::input('nombre_ips', '', ' class="form-control "'); ?>
					</div>
					
					
					<div style="clear:both;"></div>
					
					<div style="clear:both;"></div>
					<div class="tab_form_item">
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
					</div>
					<?php print form::close(); ?>			
				</div>
</div>