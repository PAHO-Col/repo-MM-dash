<?php 
/**
 * persons view page. administracion de personas
 *
 * PHP version 5
 * @author    @mr_k
  
 */
?>
		<div class="bg">
		<h2>
			
			 <?php admin::managecu_subtabs("persons"); ?>
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
					<?php print form::open(NULL, array('id' => 'personsMain','name' => 'personsMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="persons_id" name="persons_id" value=""/>
					<!--<input type="hidden" id="crue_id" name="crue_id" value=""/>-->
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_nombre_persons');?>:</strong><br />
						<?php print form::input('nombre_persons', '', ' class="form-control-lg text"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_cargo_persons');?>:</strong><br />
						<?php print form::input('Cargo', '', ' class="form-control-lg text"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_documento_persons');?>:</strong><br />
						<?php print form::input('documento_persons', '', ' class="form-control-lg text"'); ?>
					</div>
					<div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_nombre_prestador_servicio');?>:</strong><br />
                <?php print form::input('nombre_prestador_servicio', '', ' class="form-control-lg text"'); ?>
            </div>
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_tipo_empresa');?>:</strong><br />
                <?php //print form::input('tipo_empresa', '', ' class="form-control-lg text"'); ?>
				<?php print form::dropdown('tipo_empresa', $parents_arraytipoemp, '0', ' class="form-control-lg text"'); ?>
            </div>
			<div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_direccion_prestardor_servicio');?>:</strong><br />
                <?php print form::input('direccion_prestardor_servicio', '', ' class="form-control-lg text"'); ?>
            </div>
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_telefono_prestador_servicio');?>:</strong><br />
                <?php print form::input('telefono_prestador_servicio', '', ' class="form-control-lg text"'); ?>
            </div>
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_perfil_institucional');?>:</strong><br />
                <?php //print form::input('perfil_institucional', '', ' class="form-control-lg text"'); ?>
				<?php print form::dropdown('perfil_institucional', $parents_arrayperfinsti, '0', ' class="form-control-lg text"'); ?>
            </div>
            <div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_otro_perfil_institucional');?>:</strong><br />
                <?php print form::input('otro_perfil_institucional', '', ' class="form-control-lg text"'); ?>
            </div>

			<div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_nombre_representante_legal');?>:</strong><br />
                <?php print form::input('nombre_representante_legal', '', ' class="form-control-lg text"'); ?>
            </div>

			<div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_correo_representante_legal');?>:</strong><br />
                <?php print form::input('correo_representante_legal', '', ' class="form-control-lg text"'); ?>
            </div>

			<div class="tab_form_item">
                <strong><?php echo Kohana::lang('management_cu.form_cargo_representante_legal');?>:</strong><br />
                <?php print form::input('cargo_representante_legal', '', ' class="form-control-lg text"'); ?>
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
	<?php print form::open(NULL,array('id' => 'personsListing', 'name' => 'personsListing')); ?>
		<input type="hidden" name="action" id="persons_action_main" value="">
		<input type="hidden" name="persons_id" id="persons_id_main" value="">
		<!-- <input type="hidden" id="crue_id" name="crue_id" value=""/> -->
		<div class="table-holder">
			<table class="table table-hover">
			<thead>
					<tr>
						<th class="col-1">
							&nbsp;
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('management_cu.header_persons'); ?>
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('management_cu.header_cargopersons'); ?>
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
					//echo "<br> ANTES DEL FOREACH::::::: ";
					//print_r($persons);
					foreach ($personss as $persons)
					{
				
						?>
						<tr>
							
							<td class="col-1">
								&nbsp;
							</td>
							<td class="col-2">
								<div class="post">
									<h4><?php echo utf8::strtoupper($persons['nombre_persons']); ?> </p></h4>
									<p><?php echo $persons['Cargo']; ?></p>
									<p><?php echo $persons['documento_persons']; ?></p>
								</div>
							</td>
							<td class="col-3">&nbsp;</td>
							<td class="col-4">
								
								<ul>
									<li class="none-separator">
										<a href="#" 
											onClick="fillFields(
																'<?php echo(rawurlencode($persons['Id']));?>',
																'<?php echo(rawurlencode($persons['nombre_persons']));?>',
																'<?php echo(rawurlencode($persons['Cargo']));?>',
																'<?php echo(rawurlencode($persons['documento_persons']));?>',
																'<?php echo(rawurlencode($persons['nombre_prestador_servicio']));?>',
																'<?php echo(rawurlencode($persons['tipo_empresa']));?>',
																'<?php echo(rawurlencode($persons['direccion_prestardor_servicio']));?>',
																'<?php echo(rawurlencode($persons['telefono_prestador_servicio']));?>',
																'<?php echo(rawurlencode($persons['perfil_institucional']));?>',
																'<?php echo(rawurlencode($persons['otro_perfil_institucional']));?>',
																'<?php echo(rawurlencode($persons['nombre_representante_legal']));?>',
																'<?php echo(rawurlencode($persons['correo_representante_legal']));?>',
																'<?php echo(rawurlencode($persons['cargo_representante_legal']));?>'
																
																)">
																<i class="glyphicon glyphicon-pencil"></i> <?php echo Kohana::lang('ui_admin.edit_action');?>
										</a></li>
<li><br><a href="javascript:rolesAction('d','DELETE','<?php echo(rawurlencode($persons['Id'])); ?>','<?php echo(rawurlencode($persons['nombre_persons'])); ?>')" class="del">
<i class="glyphicon glyphicon-trash"></i> <?php echo Kohana::lang('ui_admin.delete_action');?>
										</a></li>
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

					

