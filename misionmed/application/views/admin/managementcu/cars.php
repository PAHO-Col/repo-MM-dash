<?php 
/**
 * carss view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     carss View
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		<div class="bg">
			<h2>
			 
			 <?php admin::managecu_subtabs("cars"); ?>
			</h2>

			<?php if ($form_error): ?>
				<br>
				<!-- red-box -->
				<div class="alert alert-danger ">
					<h3>
					<i class="glyphicon glyphicon-remove"></i> <?php echo Kohana::lang('ui_admin.error_msg');?></h3>
					<ul>
					<?php foreach ($errors as $error_item => $error_description) { ?>
						<?php if ($error_description): ?>
						<li><?php echo $error_description; ?></li>
						<?php endif; ?>
					<?php } ?>
					</ul>
				</div>
			<?php endif; ?>
				<!-- green-box -->
			
			<?php if ($form_saved): ?>
				<br>
			    <div class="alert alert-success">
				<h4 class="alert-heading"><i class="glyphicon glyphicon-ok"></i> <?php echo $form_action; ?>!</h4>
    			</div>
			<?php endif; ?>



<!-- tabs -->

				<!-- tabs -->
			<div class="tabs">
				<a name="add"></a>
				<!-- tabset -->
				<ul class="tabset">
					<li>
						<a href="#" class="active" onclick="show_addedit(true)">
							<?php echo Kohana::lang('ui_admin.header_add_edit'); ?>
						</a>
					</li>
				</ul>
				<!-- tab -->
				<div class="tab" id="addedit" style="display: none">
					<?php print form::open(NULL, array('id' => 'carsMain','name' => 'carsMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="cars_id" name="cars_id" value=""/>
					

						
					
					<div class="row">
						<div class="col-md-6">
							<div class="tab_form_item">
											<strong><?php echo Kohana::lang('management_cu.form_placa_cars');?>:</strong><br />
											<?php print form::input('placa_cars', '', ' class="form-control-lg text "'); ?>
										</div>
										<div class="tab_form_item">
											<strong><?php echo Kohana::lang('management_cu.form_descr_cars');?>:</strong><br />
											<?php print form::input('descripcion', '', ' class="form-control-lg text"'); ?>
										</div>
										
										<div class="tab_form_item">
											<strong><?php echo Kohana::lang('management_cu.form_marca_cars');?>:</strong><br />
											<?php print form::input('marca_cars', '', ' class="form-control-lg text "'); ?>
										</div>

										<div class="tab_form_item">
											<strong><?php echo Kohana::lang('management_cu.form_modelo_cars');?>:</strong><br />
											<?php print form::input('modelo_cars', '', ' class="form-control-lg text "'); ?>
										</div>
				
							<div class="tab_form_item">
								<strong><?php echo Kohana::lang('management_cu.form_nombre_prestador_servicio');?>:</strong><br />
								<?php print form::input('nombre_prestador_servicio', '', ' class="form-control-lg text"'); ?>
							</div>
							<div class="tab_form_item">
								<strong><?php echo Kohana::lang('management_cu.form_tipo_empresa');?>:</strong><br />
								<?php //print form::input('tipo_empresa', '', ' class="form-control "'); ?>
								<?php print form::dropdown('tipo_empresa', $parents_arraytipoemp, '0', ' class="form-control long "'); ?>
							</div>
						</div>
						<div class="col-md-6">
							<div class="tab_form_item">
								<strong><?php echo Kohana::lang('management_cu.form_direccion_prestardor_servicio');?>:</strong><br />
								<?php print form::input('direccion_prestardor_servicio', '', ' class="form-control-lg text "'); ?>
							</div>
							<div class="tab_form_item">
								<strong><?php echo Kohana::lang('management_cu.form_telefono_prestador_servicio');?>:</strong><br />
								<?php print form::input('telefono_prestador_servicio', '', ' class="form-control-lg text "'); ?>
							</div>
							<div class="tab_form_item">
								<strong><?php echo Kohana::lang('management_cu.form_perfil_institucional');?>:</strong><br />
								<?php //print form::input('perfil_institucional', '', ' class="form-control "'); ?>
								<?php print form::dropdown('perfil_institucional', $parents_arrayperfinsti, '0', ' onchange="toggleAdditionalFields()" class="form-control "'); ?>
							</div>
							<div class="tab_form_item"  id="perfil_id" style="display: none;">
								<strong><?php echo Kohana::lang('management_cu.form_otro_perfil_institucional');?>:</strong><br />
								<?php print form::input('otro_perfil_institucional', '', ' class="form-control-lg text "'); ?>
							</div>
						</div>
    				</div>
    
    <div class="row">
        <div class="col-md-6">
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_nombre_representante_legal');?>:</strong><br />
                <?php print form::input('nombre_representante_legal', '', ' class="form-control-lg text "'); ?>
            </div>
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_correo_representante_legal');?>:</strong><br />
                <?php print form::input('correo_representante_legal', '', ' class="form-control-lg text "'); ?>
            </div>
        </div>
        <div class="col-md-6">
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_cargo_representante_legal');?>:</strong><br />
                <?php print form::input('cargo_representante_legal', '', ' class="form-control-lg text "'); ?>
            </div>
        </div>
    </div>		
	<div class="row">
        <div class="col-md-6">
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_fechainicial');?>:</strong><br />
             <!--   1<?php print form::input('fechainicial', '', ' class="form-control "  type="date"'); ?>
				2<?php echo form::input('fechainicial', '', 'type="date"',' class="form-control"'); ?>
				3<?php echo form::input('fechainicialx', '', 'class=\"form-control\" type=\"date\"'); ?>
			 -->

				<?php
    $attributes = array(
        'name' => 'fechainicial',
        'id' => 'fechainicial',
        'class' => 'form-control',
        'type' => 'date',  // Configura el tipo como "date"
    );
	$attributesff = array(
        'name' => 'fechafinal',
        'id' => 'fechafinal',
        'class' => 'form-control',
        'type' => 'date',  // Configura el tipo como "date"
    );
	//echo "<br>".$attributes."<br>";
    echo form::input($attributes);
    ?>
            </div>
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_fechafinal');?>:</strong><br />
              
				<?php echo form::input($attributesff); ?>
            </div>
        </div>
        <div class="col-md-6">
		<div class="tab_form_item form-group">
    <label for="correo_representante_legal"><strong><?php echo Kohana::lang('management_cu.form_correo_representante_legal');?>:</strong></label>
    
</div>



        </div>
    </div>				
					
					<div style="clear:both;"></div>
					
					<div style="clear:both;"></div>
					<div class="tab_form_item">
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
					</div>
					<?php print form::close(); ?>			
				</div>
			</div>			

			

<!-- report-table -->
<div class="report-form">
	<?php print form::open(NULL,array('id' => 'carsListing', 'name' => 'carsListing')); ?>
		<input type="hidden" name="action" id="cars_action_main" value="">
		<input type="hidden" name="cars_id" id="cars_id_main" value="">
		
		<div class="table-holder">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="col-1">
							&nbsp;
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('management_cu.header_placacars'); ?>
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('management_cu.header_descr_cars'); ?>
						</th>
						<th class="col-4">
							<?php echo Kohana::lang('ui_admin.header_actions')?>
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr class="foot">
						<td colspan="4">
							&nbsp;
						</td>
					</tr>
				</tfoot>
				<tbody>
					<?php
					
					foreach ($carss as $cars)
					{
						
						?>
						<tr>
							
							<td class="col-1">
								&nbsp;
							</td>
							<td class="col-2">
								<div class="post">
									<h4><?php echo utf8::strtoupper($cars['placa_cars']); ?> </h4>
									<p></p>
								</div>
							</td>
							<td class="col-3"><?php echo $cars['descripcion']; ?></td>
							<td class="col-4">
							
								<ul>
									<li class="none-separator">
										<a href="#" 
											onClick="fillFields(
																'<?php echo(rawurlencode($cars['Id']));?>',
																'<?php echo(rawurlencode($cars['placa_cars']));?>',
																'<?php echo(rawurlencode($cars['descripcion']));?>',
																'<?php echo(rawurlencode($cars['marca_cars']));?>',
																'<?php echo(rawurlencode($cars['modelo_cars']));?>',
																'<?php echo(rawurlencode($cars['nombre_prestador_servicio']));?>',
																'<?php echo(rawurlencode($cars['tipo_empresa']));?>',
																'<?php echo(rawurlencode($cars['direccion_prestardor_servicio']));?>',
																'<?php echo(rawurlencode($cars['telefono_prestador_servicio']));?>',
																'<?php echo(rawurlencode($cars['perfil_institucional']));?>',
																'<?php echo(rawurlencode($cars['otro_perfil_institucional']));?>',
																'<?php echo(rawurlencode($cars['nombre_representante_legal']));?>',
																'<?php echo(rawurlencode($cars['correo_representante_legal']));?>',
																'<?php echo(rawurlencode($cars['cargo_representante_legal']));?>'																
																)">
																<i class="glyphicon glyphicon-pencil"></i> 
																	<?php echo Kohana::lang('ui_admin.edit_action');?>
										</a>
									</li>
									<li>
										<br><a href="javascript:rolesAction('d','DELETE','<?php echo(rawurlencode($cars['Id'])); ?>','<?php echo(rawurlencode($cars['placa_cars'])); ?>')" class="del">
										<i class="glyphicon glyphicon-trash"></i> 
										<?php echo Kohana::lang('ui_admin.delete_action');?>
										</a>
									</li>
								</ul>	
							</td>
						</tr>
						<?php
					}
					?>
				</tbody>
			</table>
		</div>
	<?php print form::close(); ?>	
</div>
</div>

					

