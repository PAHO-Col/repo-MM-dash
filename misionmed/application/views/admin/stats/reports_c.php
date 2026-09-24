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
	
    
    <div class="content-wrap clearfix">
        <h3><?php echo Kohana::lang('stats.reports_statistics');?></h3>
	
      


		<div class="container">
    <h2>Reportes por Categoría</h2>
    <canvas id="reportChart"></canvas>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        let ctx = document.getElementById("reportChart").getContext("2d");
        let data = {
            labels: [<?php foreach ($categorias as $cat) { echo "'" . $cat['name'] . "',"; } ?>],
            datasets: [{
                label: "Cantidad de Reportes",
                data: [<?php foreach ($categorias as $cat) { echo $cat['count'] . ","; } ?>],
                backgroundColor: "rgba(54, 162, 235, 0.5)"
            }]
        };
        new Chart(ctx, {
            type: "bar",
            data: data,
        });
    });
</script>








		
        <!-- Left Column -->
        <div class="two-col tc-left reports-charts">
        	
            <h4><?php echo Kohana::lang('stats.reports_categories');?></h4>
            <p>
            	<div style="float:left;">1111<?php echo $reports_chart; ?></div>
            	<div style="float:left;">
            		<table>
            			<?php
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
       111 <div class="two-col tc-right stats-sidebar">
        	<div class="stats-wrapper clearfix">
                <div class="statistic first">
                    <h4><?php echo Kohana::lang('stats.reports');?></h4>
                    <p><?php echo $num_reports; ?></p>
                </div>
                <div class="statistic">
                    <h4><?php echo Kohana::lang('stats.categories');?></h4>
                    <p><?php echo $num_categories; ?></p>
                </div>
                
            </div>
            <div style="clear:both;"></div>
            
        </div>
    </div>

</div>

