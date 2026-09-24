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
	<h2><?php echo $title; ?> <a href="<?php print url::site() ?>admin/stats/hits"><?php echo Kohana::lang('stats.visitor_summary');?></a> <a href="<?php print url::site() ?>admin/stats/country"><?php echo Kohana::lang('stats.country_breakdown');?></a> <a href="<?php print url::site() ?>admin/stats/reports"><?php echo Kohana::lang('stats.report_stats');?></a> <a href="<?php print url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact');?></a> <a href="<?php print url::site() ?>admin/stats/punchcard"><?php echo Kohana::lang('stats.report_punchcard');?></a></h2>
    
    <div class="content-wrap clearfix">
        <h3><?php echo Kohana::lang('stats.reports_statistics');?></h3>
        
        <div id="time-period-selector">
			<p>
				<?php echo form::open('admin/stats/reports/', array('method' => 'get', 'style' => "display: inline;")); ?>
					<?php echo Kohana::lang('stats.choose_date_range');?>: <a href="<?php print url::site() ?>admin/stats/reports/?range=30"><?php echo Kohana::lang('stats.time_range_1');?></a> <a href="<?php print url::site() ?>admin/stats/reports/?range=90"><?php echo Kohana::lang('stats.time_range_2');?></a> <a href="<?php print url::site() ?>admin/stats/reports/?range=180"><?php echo Kohana::lang('stats.time_range_3');?></a> <a href="<?php print url::site() ?>admin/stats/reports/"><?php echo Kohana::lang('stats.time_range_all');?></a>
					<input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" />&nbsp;&nbsp;-&nbsp;&nbsp; 
					<input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" /> 
					<input type="hidden" name="range" value="<?php echo $range; ?>" />
					<input type="submit" value="Go &rarr;" class="button" />
				<?php echo form::close(); ?>
			</p>
		</div>
		

<h4><?php echo Kohana::lang('stats.reports_by_location'); ?></h4>

<div class="two-col tc-left reports-charts">

<div style="float:left;">111<?php echo $location_chart; ?>111</div>

<!-- <div style="float:left; margin-left: 20px;">-->
</div>    
    <table>
        
<?php print_r($location_chart_colors); ?>

        <?php foreach($location_chart_data as $loc_name => $count): ?>
            
            <tr><?php if (!is_object($location_chart)) { echo "protochart no es un objeto"; } ?>

                <td><div id="little-color-box" style="background-color:#<?php //echo $location_chart_colors[$loc_name]; ?>">&nbsp;</div></td>
                <td><div id="little-color-box" style="background-color:#<?php echo isset($location_chart_colors[$loc_name]) ? $location_chart_colors[$loc_name] : 'cccccc'; ?>">&nbsp;</div></td>

                <td><?php echo html::specialchars($loc_name); ?></td>
                <td style="padding-left:25px;"><?php //echo $count; ?></td>

                <td><div id="little-color-box" style="background-color:#<?php echo isset($location_chart_colors[$loc_name]) ? $location_chart_colors[$loc_name] : 'cccccc'; ?>">&nbsp;</div></td>
            </tr>
        <?php endforeach; ?>
    </table>
</div>
<?php if (!is_object($location_chart)) { echo "protochart no es un objeto"; } ?>

<div style="clear:both;"></div>

        <?php echo "<pre>"; print_r($location_chart); echo "</pre>"; ?>

</div>
<table>
<?php foreach($location_chart_data as $loc_name => $count): ?>
    <tr>
        <td>
            <div id="little-color-box" 
                 style="background-color:#<?php echo isset($location_chart_colors[$loc_name]) ? $location_chart_colors[$loc_name] : 'cccccc'; ?>">&nbsp;
            </div>
        </td>
        <td><?php echo html::specialchars($loc_name); ?></td>
        <td style="padding-left:25px;">
            <?php 
            // Si es array, extraemos el número
            if (is_array($count)) {
                if (isset($count[0][1])) {
                    echo $count[0][1];
                } elseif (isset($count[0])) {
                    echo is_array($count[0]) ? implode(",", $count[0]) : $count[0];
                } else {
                    echo '[Sin datos]';
                }
            } else {
                echo $count;
            }
            ?>
        </td>
    </tr>
<?php endforeach; ?>
</table>


