<!-- Cargamos jQuery desde CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Cargamos Flot y el plugin de categorías -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.categories.min.js"></script>


<script type="text/javascript">
/*$(function() {
    var data = [
        ["Bogotá", 6],
        ["Medellín", 19]
    ];
    
    $.plot("#chartDiv", [ data ], {
        series: {
            bars: {
                show: true,
                barWidth: 0.6,
                align: "center"
            }
        },
        xaxis: {
            mode: "categories",
            tickLength: 0
        }
    });
});*/
</script>
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
		
        <!-- Left Column -->
       
        	
            <h4><?php echo Kohana::lang('stats.reports_categories');?></h4>
            <p>
            	<div style="float:left;">111<?php echo $grafico_ciudad; ?></div>
            	<div style="float:left;">
            		<table>
            			<?php
            			//foreach($reports_per_cat as $category_id => $count){
	            			?>
	            			<tr>
	            				<td><div id="little-color-box" style="background-color:#<?php //echo $category_data[$category_id]['category_color']; ?>">&nbsp;</div></td>
	            				<td><?php //echo $category_data[$category_id]['category_title']; ?></td>
	            				<td style="padding-left:25px;"><?php //echo $count; ?></td>
	            			</tr>
	            			<?php
            			//}
            			?>
            		</table>
            	</div>
            	<div style="clear:both;"></div>
            </p>

<?php //echo $ciudad_chart; ?>


 

</div>

