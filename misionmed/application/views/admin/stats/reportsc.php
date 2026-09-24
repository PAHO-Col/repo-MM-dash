<?php 
/**
 * Feedback view page.
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
	<h2><?php echo $title; ?> 
	
	
	<!--<a href="<?php print url::site() ?>admin/stats/reportsc"><?php echo Kohana::lang('stats.report_statspadre');?></a>-->
	<a href="<?php print url::site() ?>admin/stats/formulario_d"><?php echo Kohana::lang('stats.formulario');?></a>   
	<a href="<?php print url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact');?></a> 
	<a href="https://misionmedica.minsalud.gov.co:5534/" Target="_blank">Analisis de Datos</a> 
	<!--<a href="<?php print url::site() ?>admin/stats/reports_catdptompio"><?php echo Kohana::lang('stats.catdptompio');?></a>-->       
	</h2>
    
    <div class="content-wrap clearfix">
        <h3><?php echo Kohana::lang('stats.reports_statistics');?></h3>
	
        <div id="time-period-selector">
			<p>
				<?php echo form::open('admin/stats/reportsc/', array('method' => 'get', 'style' => "display: inline;")); ?>
					<?php echo Kohana::lang('stats.choose_date_range');?>: <a href="<?php print url::site() ?>admin/stats/reportsc/?range=30"><?php echo Kohana::lang('stats.time_range_1');?></a> 
					<a href="<?php print url::site() ?>admin/stats/reportsc/?range=90"><?php echo Kohana::lang('stats.time_range_2');?></a> 
					<a href="<?php print url::site() ?>admin/stats/reportsc/?range=180"><?php echo Kohana::lang('stats.time_range_3');?></a> 
					<a href="<?php print url::site() ?>admin/stats/reportsc/"><?php echo Kohana::lang('stats.time_range_all');?></a>
					<input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" />&nbsp;&nbsp;-&nbsp;&nbsp; 
					<input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" />
					<br><br>
					<?php 

						//mr_koyote ::: adiciono departamento
						print form::dropdown('dpto', $dpto, (isset($_GET['dpto']) ? $_GET['dpto'] : null), 'onchange="myFunction(this.value)"  class="form-control-md"');	
						//echo form::dropdown("custom_field[".$field_id.']',$parents_arraydpto,$field_value,'  onchange="myFunction(this.value)" class="form-control"',$id_name);					
						print form::dropdown('mpio',$mpio,  (isset($_GET['mpio']) ? $_GET['mpio'] : null), ' class="form-control-md"');	


						//print form::dropdown('categoriap', $parents_arraycatp,  ' class="form-control"'); 
						print form::dropdown('categoriap', $parents_arraycatp, (isset($_GET['categoriap']) ? $_GET['categoriap'] : null), ' class="form-control-md"');
					?>
					
					<input type="hidden" name="range" value="<?php echo $range; ?>" />
					<input type="submit" value="Go &rarr;" class="button" />
				<?php echo form::close(); ?>
			</p>
		</div>
		
        <!-- Left Column -->
        <div class="two-col tc-left reports-charts">
        	
            <h4><?php echo Kohana::lang('stats.reports_categories');?></h4>

			
            <p>
            	<div style="float:left;"><?php echo $reports_chart; ?></div>
            	<div style="float:left;">
            		<table>
            			<?php
					//mr_koyote ::: se muestra esta info cuando se carga todo 
					if (isset($_GET['categoriap'])== null){
						foreach ($parent_categories as $parent) {

							echo "<p> 	{$parent['name']}: {$parent['count']} reportes</p>";						
						}		
					}
					

            			foreach($reports_per_cat as $category_id => $count){
	            			?>
	            			<tr>
	            				<td><div id="little-color-box" style="background-color:#<?php echo $category_data[$category_id]['category_color']; ?>">&nbsp;</div></td>
	            				<td><?php echo $category_data[$category_id]['category_title']; ?></td>
	            				<td style="padding-left:25px;"><?php echo $count; ?></td>
	            			</tr>
	            			<?php
            			}
            			?>
            		</table>
            	</div>
            	<div style="clear:both;"></div>
            </p>

            <h4><?php echo Kohana::lang('stats.reports_status');?></h4>
            <p>

            	<div style="float:left;"><?php echo $report_status_chart_ver; ?></div>
				<div style="float:left;">
					<table>
						<tr>
							<td><div id="little-color-box" style="background-color:#0E7800">&nbsp;</div></td>
							<td><?php echo Kohana::lang('stats.verified');?></td>
							<td style="padding-left:25px;"><?php echo $verified; ?></td>
						</tr>
						<tr>
							<td><div id="little-color-box" style="background-color:#FFCF00">&nbsp;</div></td>
							<td><?php echo Kohana::lang('stats.unverified');?></td>
							<td style="padding-left:25px;"><?php echo $unverified; ?></td>
						</tr>
					</table>
				</div>
            
				<div style="float:left;margin-left:100px;"><?php echo $report_status_chart_app; ?></div>
				<div style="float:left;">
					<table>
						<tr>
							<td><div id="little-color-box" style="background-color:#0E7800">&nbsp;</div></td>
							<td><?php echo Kohana::lang('stats.approved');?></td>
							<td style="padding-left:25px;"><?php echo $approved; ?></td>
						</tr>
						<tr>
							<td><div id="little-color-box" style="background-color:#FFCF00">&nbsp;</div></td>
							<td><?php echo Kohana::lang('stats.unapproved');?></td>
							<td style="padding-left:25px;"><?php echo $unapproved; ?></td>
						</tr>
					</table>
				</div>
				<div style="clear:both;"></div>

            </p> 
        </div>




        <!-- Right Column -->
        <div class="two-col tc-right stats-sidebar">
        	<div class="stats-wrapper clearfix">
                <div class="statistic first">
                    <h4><?php echo Kohana::lang('stats.reports');?></h4>
                    <p><?php echo $num_reports; ?> </p>aprobados & verficados
                </div><br><br><br><br><br><br>
                <div class="statistic">
                    <h4><?php echo Kohana::lang('stats.categories');?></h4>
                    <p><?php echo $num_categories; ?></p>
                </div>
                
            </div>
            <div style="clear:both;"></div>
			
			<?php
			//echo "<br>VALOR DPT<br>";
			//print_r($num_dpto);
					//mr_koyote ::: se muestra esta info cuando se carga todo 
					//echo "<pre>";
					echo "<h4>DEPARTAMENTO</h4>";
						foreach ($num_dpto as $dpto) {

							echo "<p> 	{$dpto['name']}: {$dpto['count']} </p>";						
						}		
					//echo "</pre>";
					echo "<h4>Municipio</h4>";	
					//echo "<pre>";
						foreach ($num_mpio as $mpio) {

							echo "<p> 	{$mpio['name']}: {$mpio['count']} </p>";						
						}		
					//echo "</pre>";	
	
			?>
            
        </div>
    </div>

</div>

