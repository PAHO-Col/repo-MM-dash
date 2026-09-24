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
					<?php print form::open(NULL, array('id' => 'carsMain','name' => 'carsMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="cars_id" name="cars_id" value=""/>
					<!--<input type="hidden" id="crue_id" name="crue_id" value=""/>-->



					
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_placa_cars');?>:</strong><br />
						<?php print form::input('placa_cars', '', ' class="form-control "'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('management_cu.form_descr_cars');?>:</strong><br />
						<?php print form::input('descripcion', '', ' class="text long"'); ?>
					</div>				
					$this->template->content->parents_arraytipoemp = $parents_arraytipoemp;
		$this->template->content->parents_arrayperfinsti = $parents_arrayperfinsti;
					
					
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
	<?php print form::open(NULL,array('id' => 'ipsListing', 'name' => 'ipsListing')); ?>
		<input type="hidden" name="action" id="ips_action_main" value="">
		<input type="hidden" name="cars_id" id="cars_id_main" value="">
		<!-- <input type="hidden" id="crue_id" name="crue_id" value=""/> -->
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
					//echo "<br> ANTES DEL FOREACH::::::: ";
					//print_r($carss);
					foreach ($carss as $cars)
					{
						/*$cars_id = $role->id;
						$name = $role->name;
						$description = $role->description;									
						*/
						//echo "<br> SIGUE EL VALOR EN LA VISTA::::::: ";
						//print_r($cars	);
						//$name = $cars->placa_cars;
						//echo "<BR>Array ( [placa_cars] => " . $name . " )";
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
							
								<!--<ul>-->
									<li class="none-separator">
										<a href="#" 
											onClick="fillFields(
																'<?php echo(rawurlencode($cars['Id']));?>',
																'<?php echo(rawurlencode($cars['placa_cars']));?>',
																'<?php echo(rawurlencode($cars['descripcion']));?>'
																
																)">
											<?php echo Kohana::lang('ui_admin.edit_action');?>
										</a>
									</li>
									<li>
										<a href="javascript:rolesAction('d','DELETE','<?php //echo(rawurlencode($cars['Id'])); ?>')" class="del">
										<?php echo Kohana::lang('ui_admin.delete_action');?>
										</a>
									</li>
								<!--</ul>	-->
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

					

