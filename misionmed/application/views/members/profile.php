<?php
/**
 * Site view page.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     API Controller
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */
?>
			<div class="bg">
				<h2><?php echo Kohana::lang('ui_admin.my_profile');?></h2>
				<?php print form::open(); ?>
				<div class="report-form">
					<?php
					if ($form_error) {
					?>
					<br>
						<!-- alert alert-danger -->
						<div class="alert alert-danger">
							
							<h3><?php echo Kohana::lang('ui_main.error');?></h3>
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
					<br>
						<!-- alert alert-success -->
						<div class="alert alert-success">
							<h3><?php echo Kohana::lang('ui_main.profile_saved');?></h3>
						</div>
					<?php
					}
					?>
					<div class="head">
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
					</div>
					<!-- column -->
					<div class="sms_holder">

						<?php Event::run('ui_admin.profile_shown'); ?>

						<div class="row">
    <div class="col-md-6">
        <h4><i class="glyphicon glyphicon-user"></i> <?php echo Kohana::lang('ui_main.full_name');?><a href="#" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_name"); ?>"><?php echo Kohana::lang('ui_main.full_name');?>?</a> <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span></h4>
        <?php print form::input('name', $form['name'], ' class="form-control"'); ?>
    </div>
    <div class="col-md-6">
        <h4><i class="glyphicon glyphicon-envelope"></i> <?php echo Kohana::lang('ui_main.email');?><a href="#" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_email"); ?>"><?php echo Kohana::lang('ui_main.email');?>?</a> <span class="required"><?php echo Kohana::lang('ui_main.required'); ?></span></h4>
        <?php print form::input('email', $form['email'], ' class="form-control"'); ?>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <h4><i class="glyphicon glyphicon-lock"></i> <?php echo Kohana::lang('ui_main.current_password'); ?><a href="#" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_password"); ?>"><?php echo Kohana::lang('ui_main.current_password'); ?></a> <span class="required"><?php echo Kohana::lang('ui_main.required'); ?>?</span></h4>
        <?php print form::password('current_password', '', ' class="form-control "'); ?>
    </div>
    <div class="col-md-6">
        <h4><?php echo Kohana::lang('ui_main.receive_notifications');?><a href="#" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_notify"); ?>"><?php echo Kohana::lang('ui_main.receive_notifications');?>?</a></h4>
        <?php print form::dropdown('notify', $yesno_array, $form['notify'], 'class="form-control"'); ?>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <h4><i class="glyphicon glyphicon glyphicon-home"></i> <?php echo Kohana::lang('ui_main.public_profile_url');?> <span><?php echo url::site().'profile/user/'; ?></span></h4>
        <?php print form::input('username', $form['username'], ' class="form-control"'); ?>
    </div>
	<div class="col-md-6">
        <h4><?php echo Kohana::lang('ui_main.public_profile');?><a href="#" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_public"); ?>"><?php echo Kohana::lang('ui_main.public_profile');?>:</a></h4>
        <?php
        print form::label('profile_public', Kohana::lang('ui_main.on').': ');
        print form::radio('public_profile', '1', $profile_public, 'id="profile_public"').'&nbsp;&nbsp;&nbsp;&nbsp;';
        print form::label('profile_private', Kohana::lang('ui_main.off').': ');
        print form::radio('public_profile', '0', $profile_private, 'id="profile_private"').'<br />';
        ?>
    </div>
</div>


<div class="row">
    <div class="col-md-6">
        <h4><a href="http://www.gravatar.com/" target="_blank" class="tooltip" title="<?php echo Kohana::lang("tooltips.change_picture"); ?>"><?php echo Kohana::lang('ui_main.change_picture');?></a></h4>
        <a href="http://www.gravatar.com/" target="_blank"><img src="<?php echo members::gravatar($form['email']); ?>" width="80" border="0" /></a>
		<h4><a href="http://www.gravatar.com/" target="_blank" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_color"); ?>"><?php echo Kohana::lang('ui_main.profile_color');?></a></h4>
        <?php print form::input('color', $form['color'], ' class="form-control "'); ?>
        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {
                $('#color').ColorPicker({
                    onSubmit: function(hsb, hex, rgb) {
                        $('#color').val(hex);
                    },
                    onChange: function(hsb, hex, rgb) {
                        $('#color').val(hex);
                    },
                    onBeforeShow: function () {
                        $(this).ColorPickerSetColor(this.value);
                    }
                })
                .bind('keyup', function(){
                    $(this).ColorPickerSetColor(this.value);
                });
            });
        </script>
    </div>
    <div class="col-md-6">
        
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <h4><i class="glyphicon glyphicon-lock"></i> <?php echo Kohana::lang('ui_main.new_password');?><a href="#" class="tooltip" title="<?php echo Kohana::lang("tooltips.profile_new_password"); ?>"><?php echo Kohana::lang('ui_main.new_password');?>?</a></h4>
        <?php print form::password('new_password', $form['new_password'], ' class="form-control "'); ?>
    </div>
    <div class="col-md-6">
        <h4><i class="glyphicon glyphicon-lock"></i><?php echo Kohana::lang('ui_main.password_again');?></h4>
        <?php print form::password('password_again', $form['password_again'], ' class="form-control "'); ?>
    </div>
</div>



						

						

					</div>

					<div class="simple_border"></div>

					<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
				</div>
				<?php print form::close(); ?>
			</div>
