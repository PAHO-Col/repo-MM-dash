<?php 
/**
 * crues view page.
 * mr_k ::: se crea la siguiente vista
 * PHP version 5
 *  
 * @author     sinergiainformatik Team <team@sinergiainformatik.com> 
 * @module     crues View
 * @copyright  sinergiainformatik - http://www.sinergiainformatik.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		<div class="bg">
			<h2>
				<?php admin::user_subtabs("crue", $display_roles); ?>
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
					<?php print form::open(NULL, array('id' => 'cruesMain','name' => 'cruesMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="crue_id" name="crue_id" value=""/>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('ui_main.name');?>:</strong><br />
						<?php print form::input('Nombre', '', ' class="form-control-lg"'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('ui_main.description');?>:</strong><br />
						<?php print form::input('Descripcion', '', ' class="form-control long"'); ?>
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
				<?php print form::open(NULL,array('id' => 'crueListing', 'name' => 'crueListing')); ?>
					<input type="hidden" name="action" id="crue_action_main" value="">
					<input type="hidden" name="crue_id" id="crue_id_main" value="">
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
								
								
								foreach ($crues as $crue)
								{
									/*$crue_id = $role->id;
									$name = $role->name;
									$description = $role->description;									
									*/
									?>
									<tr>
										
										<td class="col-1">
											&nbsp;
										</td>
										<td class="col-3">
											<div class="post">
												<h4><?php echo utf8::strtoupper($crue['Nombre']); ?> | id: <?php echo $crue['Id']; ?></h4> 
												<p><?php echo $crue['Descripcion']; ?></p>
											</div>
										</td>
										<td class="col-3">&nbsp;</td>
										<td class="col-4">
											<?php /*if($crue_id == 1 OR $crue_id == 3 OR $crue_id == 4) { echo "&nbsp;";
											
											} else {*/?>
											<ul>
												<li class="none-separator">
													<a href="#" 
														onClick="fillFields(
																			'<?php echo(rawurlencode($crue['Id']));?>',
																			'<?php echo(rawurlencode($crue['Nombre']));?>',
																			'<?php echo(rawurlencode($crue['Descripcion']));?>'
																			)">
																			<i class="glyphicon glyphicon-pencil"></i>
													<?php echo Kohana::lang('ui_admin.edit_action');?>
													</a></li>
	<li><br><a href="javascript:rolesAction('d','DELETE','<?php echo(rawurlencode($crue['Id'])); ?>','<?php echo(rawurlencode($crue['Nombre'])); ?>')" class="del">
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

