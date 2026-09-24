<?php 
/**
 * Roles view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Roles View
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		<div class="bg">
			<h2>
				<?php admin::user_subtabs("roles", $display_roles); ?>
			</h2>

			<?php if ($form_error): ?>
				<!-- red-box -->
				<div class="alert alert-danger">
				<br>
					<h3><i class="glyphicon glyphicon-remove"></i>  <?php echo Kohana::lang('ui_admin.error_msg');?></h3>
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
					<?php print form::open(NULL, array('id' => 'rolesMain','name' => 'rolesMain')); ?>
					<input type="hidden" name="action" id="action" value="a"/>
					<input type="hidden" id="role_id" name="role_id" value=""/>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('ui_main.name');?>:</strong><br />
						<?php print form::input('name', '', ' class="form-control "'); ?>
					</div>
					<div class="tab_form_item">
						<strong><?php echo Kohana::lang('ui_main.description');?>:</strong><br />
						<?php print form::input('description', '', ' class="form-control"'); ?>
					</div>
					<div class="tab_form_item">
						<strong>
						<?php echo  Kohana::lang('ui_admin.access_level'); ?>:<a href="#" class="tooltip" style="background-position-y:0px" title="<?php echo Kohana::lang("tooltips.settings_access_level"); ?>">
								<?php echo  Kohana::lang('ui_admin.access_level'); ?>: </a></h4>
						<?php print form::input('access_level','', ' class="form-control "'); ?>
					</div>
					<div style="clear:both;"></div>
					<div class="tab_form_item">
					<?php
					$i = 0;
					foreach ($permissions as $permission_id => $permission_name)
					{
						echo "<div style=\"width:200px;float:left;margin-bottom:3px;\">";
						echo form::checkbox('permissions[]', $permission_id, FALSE, "id='permission_$permission_name'");
						echo form::label("permission_$permission_name", Kohana::lang('permissions.'.$permission_name));
						echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						echo "</div>";
						$i++;
					}
					?>
					</div>
					<div style="clear:both;"></div>
					<div class="tab_form_item">
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
					</div>
					<?php print form::close(); ?>			
				</div>
			</div>			
			
			
			<!-- report-table -->
			<div class="report-form">
				<?php print form::open(NULL,array('id' => 'roleListing', 'name' => 'roleListing')); ?>
					<input type="hidden" name="action" id="role_action_main" value="">
					<input type="hidden" name="role_id" id="role_id_main" value="">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead class="thead-dark">
								<tr>
									<!-- <th>&nbsp;</th> -->
									<th><?php echo Kohana::lang('ui_admin.header_role'); ?></th>
									<!-- <th>&nbsp;</th> -->
									<th><?php echo Kohana::lang('ui_admin.header_actions')?></th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<!-- <td colspan="4">
										&nbsp;
									</td>-->
								</tr>
							</tfoot>
							<tbody>
								<?php
								foreach ($roles as $role)
								{
									$role_id = $role->id;
									$name = $role->name;
									$description = $role->description;
									$access_level = $role->access_level;
									$role_permissions = array();
									foreach($role->permissions as $perm)
									{
										$role_permissions[] = $perm->name;
									}
									?>
									<tr>
										
										<!-- <td class="col-1">
											&nbsp;
										</td>-->
										<td class="col-2">
											<div class="post">
												<h4><?php echo utf8::strtoupper($name); ?></h4>
												<p><?php echo $description; ?></p>
											</div>
										</td>
										<!--<td class="col-3">&nbsp;</td>-->
										<td>
											<?php if($role_id == 1 OR $role_id == 3 OR $role_id == 4 ) { echo "&nbsp;";
											
											} else {?>
											<a href="#" 
													onClick="fillFields(
													'<?php echo(rawurlencode($role_id)); ?>',
													'<?php echo(rawurlencode($name)); ?>',
													'<?php echo(rawurlencode($description)); ?>',
													'<?php echo(rawurlencode($access_level)); ?>',
													[<?php echo("'".implode("','",$role_permissions)."'");?>])" class="btn btn-sm btn-primary mb-1">
													<i class="glyphicon glyphicon-pencil"></i>
													<?php echo Kohana::lang('ui_admin.edit_action');?>
													</a>
													<?php if($role_id == 7 OR $role_id == 8 ) { echo "&nbsp;";
													} else { ?>	
													<a href="javascript:rolesAction('d','DELETE','<?php echo(rawurlencode($role_id)); ?>')" class="btn btn-sm btn-danger">
													<i class="glyphicon glyphicon-trash"></i>
													<?php echo Kohana::lang('ui_admin.delete_action');?>
													<?php } ?>	
													
													</a>
											</ul>
											<?php } ?>
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
