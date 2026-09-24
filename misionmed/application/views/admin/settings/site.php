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
				<h2>
					<?php admin::settings_subtabs("site"); ?>

				</h2>
				<?php print form::open(NULL,array('enctype' => 'multipart/form-data', 'id' => 'siteForm', 'name' => 'siteForm')); ?>
				<div class="report-form">
					<?php
					if ($form_error) {
					?>
							<br>
				<!-- red-box -->
				<div class="alert alert-danger ">
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
						<!-- green-box -->
						<br>
			    <div class="alert alert-success">
						<div class="green-box">
							<h3><?php echo Kohana::lang('ui_main.configuration_saved');?></h3>
						</div>
					<?php
					}
					?>
					<div class="head">
						<h3><?php echo Kohana::lang('settings.site.title');?></h3>
						<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
					</div>
					<!-- column -->
					<div class="sms_holder">
						<div id="need_to_upgrade" style="display:none;"></div>
							<div class="row">
            					<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_name"); ?>"><?php echo Kohana::lang('settings.site.name');?></h4>
									<?php print form::input('site_name', $form['site_name'], ' class="form-control " maxlength="250"'); ?>
								</div>
								<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_tagline"); ?>"><?php echo Kohana::lang('settings.site.tagline');?></h4>
									<?php print form::input('site_tagline', $form['site_tagline'], ' class="form-control " maxlength="250"'); ?>
								</div>
							</div>								
						<div class="row">
							<h4 title="<?php echo Kohana::lang("tooltips.settings_banner"); ?>"><?php echo Kohana::lang('settings.site.banner');?></h4>
							<?php if($banner_m != NULL) { ?>
								<img src="<?php echo $banner_m; ?>" alt="<?php Kohana::lang('settings.site.banner'); ?>" /><br/>
							<?php } ?>
							<?php echo form::upload('banner_image', '', ''); ?> (&lt;&#61; 250k)
							<br/>
							<?php
								echo form::checkbox('delete_banner_image', '1');
								echo form::label('delete_banner_image', Kohana::lang("settings.site.delete_banner_image"));

							?>
						</div>
						<div class="row">
            					<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_email"); ?>"><?php echo Kohana::lang('settings.site.email_site');?></a>
									<br /><?php echo Kohana::lang('settings.site.email_notice');?></h4>
									<?php print form::input('site_email', $form['site_email'], ' class="form-control "'); ?>
								</div>
								<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_message"); ?>"><?php echo Kohana::lang('settings.site.message');?></h4>
									<?php print form::textarea('site_message', $form['site_message'], ' class="form-control " style="height:40px;"'); ?>
								</div>
							</div>		
							<div class="row">
            					<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_copyright_statement"); ?>"><?php echo Kohana::lang('settings.site.copyright_statement');?></h4>
									<?php print form::textarea('site_copyright_statement', $form['site_copyright_statement'], ' style="height:40px;"'); ?>
								</div>
								<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_submit_report_message"); ?>"><?php echo Kohana::lang('settings.site.submit_report_message');?></h4>
									<?php print form::textarea('site_submit_report_message', $form['site_submit_report_message'], ' style="height:40px;"'); ?>
								</div>
							</div>
							<div class="row">
            					<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_locale"); ?>"><?php echo Kohana::lang('settings.site.language');?></a> (Locale)</h4>
									<span class="sel-holder">
									<?php print form::dropdown('site_language', $locales_array, $form['site_language']); ?>
									</span>
								</div>
								<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_site_timezone"); ?>"><?php echo Kohana::lang('settings.site.timezone');?></h4>
									<span class="sel-holder">
									<?php print form::dropdown('site_timezone',$site_timezone_array, $form['site_timezone']); ?>
									</span>
									<div style="clear:both;"></div>
							<small><?php echo Kohana::lang('ui_admin.server_time').' '.date("m/d/Y H:i:s",time()).' ('.$form['site_timezone'].')'; ?></small>
								</div>
							</div>			
							<div class="row">
            					<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_display_contact"); ?>"><?php echo Kohana::lang('settings.site.display_contact_page');?></h4>
									<?php print form::dropdown('site_contact_page', $yesno_array, $form['site_contact_page']); ?>
								</div>
								<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_display_items_per_page"); ?>"><?php echo Kohana::lang('settings.site.items_per_page');?></h4>
									<span class="sel-holder">
									<?php print form::dropdown('items_per_page', $items_per_page_array, $form['items_per_page']); ?>
									</span>
								</div>
							</div>			
							<div class="row">
            					<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_display_items_per_page_admin"); ?>"><?php echo Kohana::lang('settings.site.items_per_page_admin');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('items_per_page_admin', $items_per_page_array, $form['items_per_page_admin']); ?>
									</span>
								</div>
								<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_blocks_per_row"); ?>"><?php echo Kohana::lang('settings.site.blocks_per_row');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('blocks_per_row', $blocks_per_row_array, $form['blocks_per_row']); ?>
									</span>
								</div>
							</div>		
						
							<div class="row">
            					<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_allow_reports"); ?>"><?php echo Kohana::lang('settings.site.allow_reports');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('allow_reports', $yesno_array, $form['allow_reports']); ?>
									</span>
								</div>
								<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_max_upload_size"); ?>"><?php echo Kohana::lang('settings.site.max_upload_size');?></h4>
									<span class="sel-holder">
										<?php print form::input('max_upload_size', $form['max_upload_size'], ' class="form-control "', 'id = max_upload_size'); ?>
									</span>
								</div>
							</div>		
							<div class="row">
            					<div class="col-md-6" id="alerts_selector">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_allow_alerts"); ?>"><?php echo Kohana::lang('settings.site.allow_alerts');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('allow_alerts', $yesno_array, $form['allow_alerts']); ?>
									</span>
								</div>
								<div class="col-md-6"  id="alerts_selector">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_alert_email"); ?>"><?php echo Kohana::lang('settings.site.email_alerts');?></h4>
									<?php print form::input('alerts_email', $form['alerts_email'], ' class="form-control "', 'id = alert_email'); ?>
								</div>
							</div>		
							<div class="row">
            					<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_allow_comments"); ?>"><?php echo Kohana::lang('settings.site.allow_comments');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('allow_comments', $comments_array, $form['allow_comments']); ?>
									</span>
								</div>
								<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_alert_days"); ?>"><?php echo Kohana::lang('settings.site.alert_days');?></a>
									<br /><?php echo Kohana::lang('settings.site.alert_days_notice');?></h4>
									<?php print form::input('alert_days', $form['alert_days'], ' class="form-control "'); ?>

								</div>
							</div>		

							<div class="row">
            					<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_allow_feed"); ?>"><?php echo Kohana::lang('settings.site.allow_feed');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('allow_feed', $yesno_array, $form['allow_feed']); ?>
									</span>
								</div>
								<div class="col-md-6">
											<h4 title="<?php echo Kohana::lang("tooltips.settings_allow_feed_category"); ?>"><?php echo Kohana::lang('settings.site.allow_feed_category');?></h4>
										<span class="sel-holder">
											<?php print form::dropdown('allow_feed_category', $yesno_array, $form['allow_feed_category']); ?>
										</span>
								</div>
							</div>		

							<div class="row">
            					<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.feed_geolocation_user"); ?>"><?php echo Kohana::lang('settings.site.feed_geolocation_user');?></h4>
									<?php print form::input('feed_geolocation_user', $form['feed_geolocation_user'], ' class="form-control "', 'id = alert_email'); ?>
								</div>
								<div class="col-md-6">
										<h4 title="<?php echo Kohana::lang("tooltips.settings_share_site_stats"); ?>"><?php echo Kohana::lang('settings.site.share_site_stats');?></h4>
									<span class="sel-holder">
										<?php print form::dropdown('allow_stat_sharing', $yesno_array, $form['allow_stat_sharing']); ?>
									</span>
								</div>
							</div>		
						
							<div class="row">
            					<div class="col-md-6">
								<h4 title="<?php echo Kohana::lang("tooltips.settings_cache_pages"); ?>"><?php echo Kohana::lang('settings.site.cache_pages');?></h4>
							<span class="sel-holder">
								<?php print form::dropdown('cache_pages', $yesno_array, $form['cache_pages']); ?>
							</span>
								</div>
								<div class="col-md-6">
								<h4 title="<?php echo Kohana::lang("tooltips.settings_cache_pages_lifetime"); ?>"><?php echo Kohana::lang('settings.site.cache_pages_lifetime');?></h4>
							<span class="sel-holder">
								<?php print form::dropdown('cache_pages_lifetime', $cache_pages_lifetime_array, $form['cache_pages_lifetime']); ?>
							</span>

								</div>
							</div>		

							<div class="row">
            					<div class="col-md-6">
								<h4 title="<?php echo Kohana::lang("tooltips.settings_private_deployment"); ?>"><?php echo Kohana::lang('settings.site.private_deployment');?></h4>
							<span class="sel-holder">
								<?php print form::dropdown('private_deployment', $yesno_array, $form['private_deployment']); ?>
							</span>
								</div>
								<div class="col-md-6">	
								<h4 title="<?php echo Kohana::lang("tooltips.settings_manually_approve_users"); ?>"><?php echo Kohana::lang('settings.site.manually_approve_users');?></h4>
							<span class="sel-holder">
								<?php print form::dropdown('manually_approve_users', $yesno_array, $form['manually_approve_users']); ?>
							</span>
								</div>
							</div>			
							<div class="row">
            					<div class="col-md-6">
								<h4 title="<?php echo Kohana::lang("tooltips.settings_require_email_confirmation"); ?>"><?php echo Kohana::lang('settings.site.require_email_confirmation');?></h4>
							<span class="sel-holder">
								<?php print form::dropdown('require_email_confirmation', $yesno_array, $form['require_email_confirmation']); ?>
							</span>
								</div>
								<div class="col-md-6">
									<h4 title="<?php echo Kohana::lang("tooltips.settings_google_analytics"); ?>"><?php echo Kohana::lang('settings.site.google_analytics');?></h4>
								<?php echo Kohana::lang('settings.site.google_analytics_example');?> &nbsp;&nbsp;
								<?php print form::input('google_analytics', $form['google_analytics'], ' class="form-control "'); ?>
								</div>
							</div>		
							<div class="row">
            					<div class="col-md-6">
								<h4><?php echo Kohana::lang('settings.site.api_akismet');?></h4>
							<?php echo Kohana::lang('settings.site.kismet_notice');?>.
							<?php print form::input('api_akismet', $form['api_akismet'], ' class="form-control "'); ?>
								</div>
								<div class="col-md-6">
								</div>
							</div>		
							<div class="row">
							<div class="simple_border"></div>
					<input type="submit" class="save-rep-btn" value="<?php echo Kohana::lang('ui_admin.save_settings');?>" />
								</div>
							</div>				
							
						
					</div>

					
				</div>
				<?php print form::close(); ?>
			</div>
