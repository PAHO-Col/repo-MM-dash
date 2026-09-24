<?php
/**
 * Edit User
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Edit User View
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */
?>
			<div class="bg">
				<h2>
					<?php admin::user_subtabs("users_edit", $display_roles); ?>
				</h2>
                <br>
				<?php
				if ($form_error) {
				?>
					<!-- red-box -->
					<div class="alert alert-danger ">
                    
						<h3> <i class="glyphicon glyphicon-remove"></i> <?php echo Kohana::lang('ui_main.error');?></h3>
						<ul>
						<?php
						foreach ($errors as $error_item => $error_description)
						{
							print (!$error_description) ? '' : "<li>" . $error_description . "</li>";
						}
						?>
						</ul>
					</div>
				<?php
				}

				if ($form_saved) {
				?>
					<!-- alert alert-success -->
					<div class="alert alert-success">
                    
						<h3><?php echo Kohana::lang('ui_main.profile_saved');?></h3>
					</div>
				<?php
				}
				?>
				<?php print form::open(); ?>
<div class="report-form">
    <div class="head">
        <input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings'); ?>" />
    </div>


    <div class="sms_holder">
        <div class="row">
            <div class="col-md-6">
                <h4><i class="glyphicon glyphicon-user"></i> <?php echo Kohana::lang('ui_main.full_name'); ?>
                        <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span></h4>
                    <?php print form::input('name', $form['name'], ' class="form-control "'); ?>
            </div>
            <div class="col-md-6">
                <h4><i class="glyphicon glyphicon-setings"></i> <?php echo Kohana::lang('ui_main.role'); ?>
                        <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span></h4>
                    <?php
                    if ($user AND $user->loaded AND $user->id == 1) {
                        print form::dropdown('role', $role_array, $form['role'], ' readonly="readonly" onchange="toggleAdditionalFields()" class="form-control"');
                    } else {
                        print form::dropdown('role', $role_array, $form['role'], 'onchange="toggleAdditionalFields();" class="form-control"');
                    }
                    ?>
                    <div class="tab_form_item" id="crue_id2" style="display: none;">
                        <h4><?php echo Kohana::lang('crue_ips.select_crue'); ?></h4>
                        <?php //print form::dropdown('crue_id2', $parents_arraycrue, $form['crue_id'], 'onchange="toggleAdditionalFields(); class="form-control"'); ?>
                        <?php print form::dropdown('crue_id2', $parents_arraycrue, $form['crue_id'], 'onchange="buscarIps( this.value);" class="form-control"'); ?>
                    </div>
                   
                    <div class="tab_form_item" id="crue_ids" style="display: none;">
                        <h4><?php echo Kohana::lang('crue_ips.select_crue'); ?></h4>
                        <?php print form::dropdown('crue_id', $parents_arraycrue, $form['crue_id'], ' class="form-control"'); ?>
                    </div>

                    <div class="tab_form_item" id="ips_ids" style="display: none;">
                        <h4><?php echo Kohana::lang('crue_ips.select_ips'); ?></h4>
                        <?php //print form::dropdown('ips_id', $parents_arrayips, $form['crue_id'], ' class="form-control"'); ?>
                        <?php //print form::dropdown('ips_id',  array(), $form['ips_id'], ' class="form-control"'); ?>
                        <?php print form::dropdown('ips_id', array(), isset($form['ips_id']) ? $form['ips_id'] : null, ' class="form-control"'); ?>
                        <?php //print form::dropdown('ips_id', array('' => '--- Selecciona una IPS ---'), '', ' class="form-control" id="ips_id"'); ?>

                    </div>

            </div>  
        </div>
        <div class="row">
            <div class="col-md-6">
                <h4>
                <i class="glyphicon glyphicon glyphicon-envelope"></i>
 <?php echo Kohana::lang('ui_main.email');?> <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span>
                </h4>					
                    <?php print form::input('email', $form['email'], 'class="form-control"'); ?>
            </div>
            <div class="col-md-6">
                <h4><i class="glyphicon glyphicon glyphicon-home"></i>
 
                    <?php echo Kohana::lang('ui_main.public_profile_url');?> <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span>
                </h4>
                    <span style="float:left;"><?php echo url::site().'profile/user/'; ?></span>
                    <?php print form::input('username', $form['username'], ' class="form-control"'); ?>
                   
            </div>  
        </div>

        <div class="row">
        
            <div class="col-md-6">
                
                <h4><?php echo Kohana::lang('ui_main.receive_notifications'); ?>?</h4>
                <?php print form::dropdown('notify', $yesno_array, $form['notify'], 'class="form-control"'); ?>				
                    
            </div>            
        </div>

        <div class="row">
        <?php if ($user_id == FALSE) { ?> 
            <div class="col-md-6">
            <h4>
                <a href="#" title="<?php echo Kohana::lang("tooltips.profile_new_users_password"); ?>">
                    <?php echo Kohana::lang('ui_main.password'); ?>
                    <i class="glyphicon glyphicon-lock"></i> <!-- Icono de candado -->
                </a>
                    <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span>
            </h4>
                    <?php print form::password('password', '', ' class="form-control "'); ?>
            </div>
            <div class="col-md-6">
            <h4><?php echo Kohana::lang('ui_main.password_again'); ?></h4>
                            <i class="glyphicon glyphicon-lock"></i> <!-- Icono de candado -->
                            <?php print form::password('password_again', $form['password_again'], ' class="form-control "'); ?>
                    
            </div>
            <?php } elseif (kohana::config('riverid.enable') == FALSE) { ?>
            <div class="col-md-6">
            <h4><?php echo Kohana::lang('ui_admin.new_password'); ?> <i class="glyphicon glyphicon-lock"></i> <!-- Icono de candado --></h4>
                        <?php print form::password('new_password', '', ' class="form-control"'); ?>
            </div>
            <?php }?>
        </div>
        <div class="simple_border"></div>
    <input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings'); ?>" />
    
    <div class="row">

    <?php
            if ($user AND $user->loaded) {
            ?>
              
                    <div class="row">
                        <h4><?php echo Kohana::lang('ui_admin.user_no_logins'); ?></h4>
                        <p class="bold_desc"><?php echo $user->logins; ?></p>
                    </div>

                    <div class="row">
                        <h4><?php echo Kohana::lang('ui_admin.user_last_login'); ?></h4>
                        <p class="bold_desc"><?php echo date("m/d/Y g:ia", $user->last_login); ?> <?php echo date_default_timezone_get(); ?></p>
                    </div>

                    <div class="row">
                        <h4><?php echo Kohana::lang('ui_admin.user_confirmed_account'); ?></h4>
                        <p class="bold_desc"><?php echo Kohana::lang('ui_admin.' . ($user->confirmed ? "yes" : "no")); ?></p>
                    </div>
                </div>
            <?php
            }
            ?>

    </div>
            </div>



            <?php
            // users_form_admin - add content to users from
            Event::run('ushahidi_action.users_form_admin', $id);
            ?>
        </div>
    </div>
   
</div>
<?php print form::close(); ?>

				
			</div>
