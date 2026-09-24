<?php 
/**
 * instalacion view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     instalacion View
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		<div class="bg">
			<h2>
			GESTION :: <?php admin::managecu_subtabs(); ?>
			</h2>

			<?php if ($form_error): ?>
				<!-- red-box -->
				<div class="red-box">
					<h3><?php echo Kohana::lang('ui_admin.error_msg');?></h3>
					<ul>
					<?php foreach ($errors as $error_item => $error_description) { ?>
						<?php if ($error_description): ?>
						<li><?php echo $error_description; ?></li>
						<?php endif; ?>
					<?php } ?>
					</ul>
				</div>
			<?php endif; ?>
			<?php if ($form_saved): ?>
				<!-- green-box -->
				<div class="green-box">
					<h3>
						<?php echo $form_action; ?>!
					</h3>
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
					<?php print form::open(NULL, array('id' => 'instalacionMain','name' => 'instalacionMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="instalacion_id" name="instalacion_id" value=""/>					
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_institucionsolicitante');?>:</strong><br />
						<?php print form::input('institucionsolicitante', '', ' class="form-control "'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_ubicacion_emblema');?>:</strong><br />
						<?php print form::input('ubicacion_emblema', '', ' class="text long"'); ?>
					</div>	
					
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_nombre_prestador_servicio');?>:</strong><br />
						<?php print form::input('nombre_prestador_servicio', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_tipo_empresa');?>:</strong><br />
						<?php print form::input('tipo_empresa', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_direccion_prestardor_servicio');?>:</strong><br />
						<?php print form::input('direccion_prestardor_servicio', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_telefono_prestador_servicio');?>:</strong><br />
						<?php print form::input('telefono_prestador_servicio', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_perfil_institucional');?>:</strong><br />
						<?php print form::input('perfil_institucional', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_otro_perfil_institucional');?>:</strong><br />
						<?php print form::input('otro_perfil_institucional', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_nombre_representante_legal');?>:</strong><br />
						<?php print form::input('nombre_representante_legal', '', ' class="text long"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_correo_representante_legal');?>:</strong><br />
						<?php print form::input('correo_representante_legal', '', ' class="text long"'); ?>
					</div>			
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_cargo_representante_legal');?>:</strong><br />
						<?php print form::input('cargo_representante_legal', '', ' class="text long"'); ?>
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
	<?php print form::open(NULL,array('id' => 'instalaListing', 'name' => 'instalaListing')); ?>
		<input type="hidden" name="action" id="instalacion_action_main" value="">
		<input type="hidden" name="instalacion_id" id="instalacion_id" value="">
		
		<div class="table-holder">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="col-1">
							&nbsp;
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('management_cu.header_institucionsolicitante'); ?>
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('management_cu.header_ubicacion_emblema'); ?>
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
				
					foreach ($instalacions as $instala)
					{
						
						?>
						<tr>
							
							<td class="col-1">
								&nbsp;
							</td>
							<td class="col-2">
								<div class="post">
									<h4><?php echo utf8::strtoupper($instala['institucionsolicitante']); ?> </h4>
									<p></p>
								</div>
							</td>
							<td class="col-3"><?php echo $instala['ubicacion_emblema']; ?>
							<?php echo $instala['nombre_prestador_servicio']; ?>
						</td>
							<td class="col-4">
							
								<!--<ul>-->
									<li class="none-separator">
										<a href="#" 
											onClick="fillFields(
																'<?php echo(rawurlencode($instala['Id']));?>',
																'<?php echo(rawurlencode($instala['institucionsolicitante']));?>',
																'<?php echo(rawurlencode($instala['ubicacion_emblema']));?>'
																
																)">
											<?php echo Kohana::lang('ui_admin.edit_action');?>
										</a>
									</li>
									<li>
										<a href="javascript:rolesAction('d','DELETE','<?php //echo(rawurlencode($instala['Id'])); ?>')" class="del">
										<?php echo Kohana::lang('ui_admin.delete_action');?>
										</a>
									</li>
								
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

					

