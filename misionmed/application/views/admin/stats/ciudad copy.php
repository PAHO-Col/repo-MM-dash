<!-- Cargamos jQuery desde CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Cargamos Flot y el plugin de categorías -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.categories.min.js"></script>
<div style="width:600px; height:400px;" id="chartDiv"></div>

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
    	<h2><?php echo $title; ?> <a href="<?php print url::site() ?>admin/stats/hits"><?php echo Kohana::lang('stats.visitor_summary');?></a> 
	<a href="<?php print url::site() ?>admin/stats/country"><?php echo Kohana::lang('stats.country_breakdown');?></a> 
	<a href="<?php print url::site() ?>admin/stats/reports"><?php echo Kohana::lang('stats.report_stats');?></a> 
	
	<a href="<?php print url::site() ?>admin/stats/reportsc"><?php echo Kohana::lang('stats.report_statspadre');?></a>  
	<a href="<?php print url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact');?></a> 
	<a href="<?php print url::site() ?>admin/stats/punchcard"><?php echo Kohana::lang('stats.report_punchcard');?></a></h2>
    
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
						//print form::dropdown('dpto', $dpto, (isset($_GET['dpto']) ? $_GET['dpto'] : null), 'onchange="myFunction(this.value)"  class="form-control-md"');	
						//echo form::dropdown("custom_field[".$field_id.']',$parents_arraydpto,$field_value,'  onchange="myFunction(this.value)" class="form-control"',$id_name);					
						//print form::dropdown('mpio',$mpio,  (isset($_GET['mpio']) ? $_GET['mpio'] : null), ' class="form-control-md"');	


						//print form::dropdown('categoriap', $parents_arraycatp,  ' class="form-control"'); 
						//print form::dropdown('categoriap', $parents_arraycatp, (isset($_GET['categoriap']) ? $_GET['categoriap'] : null), ' class="form-control-md"');
					?>
					
					<input type="hidden" name="range" value="<?php echo $range; ?>" />
					<input type="submit" value="Go &rarr;" class="button" />
				<?php echo form::close(); ?>
			</p>
		</div>
    <h2><?php echo $title; ?></h2>
    <div class="content-wrap clearfix">
        <h3>Gráfico por ciudad11111111</h3>
        <?php echo $grafico_ciudad; ?>
    </div>

 <h2>Gráfica por Ciudad</h2>

    <div class="content-wrap clearfix">
        <h3>Estadísticas2222222222222</h3>

        <div class="two-col tc-left reports-charts">
            <?php// echo $grafico_ciudad; ?>
        </div>
222222222222222222222222222222222222
        <table>
            <?php// foreach ($chart_data as $city => $value): ?>
                <tr>
                    <td>
                        <div style="width:20px; height:20px; background-color:#<?php //echo $chart_colors[$city]; ?>;"></div>
                    </td>
                    <td><?php// echo html::specialchars($city); ?></td>
                    <td><?php// echo $value; ?></td>
                </tr>
            <?php //endforeach; ?>
        </table>
    </div>
</div>

33333333333333
 <div class="two-col tc-left reports-charts">
            <?php echo $ciudad_chart; ?>
        </div>
</div>
33333333333333333333
