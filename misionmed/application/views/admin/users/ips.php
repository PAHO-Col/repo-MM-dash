<?php 
/**
 * ipss view page.
 * @mr_k VISTA IPS
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     sinergiainformatik Team <team@sinergiainformatik.com> 
 * @package    sinergiainformatik - http://source.sinergiainformatikdev.com
 * @module     ipss View
 * @copyright  sinergiainformatik - http://www.sinergiainformatik.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		<div class="bg">
			<h2>
				<?php admin::user_subtabs("ips", $display_roles); ?>
			</h2>

			<?php if ($form_error): ?>
				<br>
				<!-- alert alert-danger -->
				<div class="alert alert-danger">
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
				<br>
				<!-- alert alert-success -->
				<div class="alert alert-success">
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
					<?php print form::open(NULL, array('id' => 'ipssMain','name' => 'ipssMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="ips_id" name="ips_id" value=""/>
					<!--<input type="hidden" id="crue_id" name="crue_id" value=""/>-->
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('crue_ips.name_ips');?>:</strong><br />
						<?php print form::input('nombre_ips', '', ' class="form-control-lg "'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('crue_ips.descripcion_ips');?>:</strong><br />
						<?php print form::input('descripcion', '', '  class="form-control long"'); ?>
					</div>
					
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('crue_ips.select_crue');?>:</strong><br />
						<?php //print form::input('crue_id', '', ' class="text long"'); ?>
						<?php print form::dropdown('crue_id', $parents_arraycrue, '0',' class="form-control'); ?>
					</div>
					
					<div style="clear:both;"></div>
					
					<div style="clear:both;"></div>
					<div class="tab_form_item">
						<!--
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
						-->	
						<button type="submit" class="save-rep-btn btn btn-primary">
							<i class="glyphicon glyphicon-floppy-disk"></i> 
							<?php echo Kohana::lang('ui_admin.save_settings');?>
							</button>
					</div>
					<?php print form::close(); ?>			
				</div>
			</div>			

			


<!-- report-table -->
<div class="report-form">
	<?php print form::open(NULL,array('id' => 'ipsListing', 'name' => 'ipsListing')); ?>
		<input type="hidden" name="action" id="ips_action_main" value="">
		<input type="hidden" name="ips_id" id="ips_id_main" value="">
		<!-- <input type="hidden" id="crue_id" name="crue_id" value=""/> -->
		<div class="table-holder">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="col-1">
							&nbsp;
						</th>
						<th class="col-2">
							<?php echo Kohana::lang('ui_admin.header_role'); ?>
						</th>
						<th class="col-2">
							&nbsp;
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
					//print_r($ipss);
					foreach ($ipss as $ips)
					{
						/*$ips_id = $role->id;
						$name = $role->name;
						$description = $role->description;									
						*/
						//echo "<br> SIGUE EL VALOR EN LA VISTA::::::: ";
						//print_r($ips	);
						//$name = $ips->nombre_ips;
						//echo "<BR>Array ( [nombre_ips] => " . $name . " )";
						?>
						<tr>
							
							<td class="col-1">
								&nbsp;
							</td>
							<td class="col-2">
								<div class="post">
									<h4><?php echo utf8::strtoupper($ips['nombre_ips']); ?> | Id:<?php echo $ips['crue_id']; ?></p></h4>
									<p><?php echo $ips['descripcion']; ?></p>
								</div>
							</td>
							<td class="col-3">&nbsp;</td>
							<td class="col-4">
								<?php /*if($ips_id == 1 OR $ips_id == 3 OR $ips_id == 4) { echo "&nbsp;";
								
								} else {*/?>
								<ul>
									<li class="none-separator">
										<a href="#" 
											onClick="fillFields(
																'<?php echo(rawurlencode($ips['Id']));?>',
																'<?php echo(rawurlencode($ips['nombre_ips']));?>',
																'<?php echo(rawurlencode($ips['descripcion']));?>',
																'<?php echo(rawurlencode($ips['crue_id']));?>'
																)">
																<i class="glyphicon glyphicon-pencil"></i>
																<?php echo Kohana::lang('ui_admin.edit_action');?>
										</a></li>
										
<li><br><a href="javascript:rolesAction('d','DELETE','<?php echo(rawurlencode($ips['Id'])); ?>','<?php echo(rawurlencode($ips['nombre_ips'])); ?>')" class="del">
<i class="glyphicon glyphicon-trash"></i>
<?php echo Kohana::lang('ui_admin.delete_action');?>
										</a></li>
								</ul>	

								
								<?php //} ?>
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

					

