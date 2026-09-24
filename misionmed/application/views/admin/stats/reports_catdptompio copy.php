<!-- Cargar dependencias - jQuery moderno -->
<!-- Cargar dependencias - jQuery moderno -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.plot.ly/plotly-2.27.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.4.0.min.js"></script>
<script>
    jQuery.browser = {};
    (function () {
        var ua = navigator.userAgent.toLowerCase();
        jQuery.browser.msie = /msie/.test(ua) || /trident/.test(ua);
        jQuery.browser.version = (ua.match(/(?:msie |rv:)(\d+(\.\d+)?)/) || [])[1];
    })();
</script>

<div class="bg">
	<h2><?php echo $title; ?> 
	
	
	<a href="<?php print url::site() ?>admin/stats/reportsc"><?php echo Kohana::lang('stats.report_statspadre');?></a>
	<a href="<?php print url::site() ?>admin/stats/formulario_d"><?php echo Kohana::lang('stats.formulario');?></a>   
	<a href="<?php print url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact');?></a> 
	<a href="<?php print url::site() ?>admin/stats/reports_catdptompio"><?php echo Kohana::lang('stats.catdptompio');?></a>       
	</h2>
    
    <div class="content-wrap clearfix">
        <h3><?php echo Kohana::lang('stats.reports_statistics');?></h3>
	
        <div id="time-period-selector">
			<p>
				<?php echo form::open('admin/stats/reports_catdptompio/', array('method' => 'get', 'style' => "display: inline;")); ?>
					<?php echo Kohana::lang('stats.choose_date_range');?>: <a href="<?php print url::site() ?>admin/stats/reports_catdptompio/?range=30"><?php echo Kohana::lang('stats.time_range_1');?></a> 
					<a href="<?php print url::site() ?>admin/stats/reports_catdptompio/?range=90"><?php echo Kohana::lang('stats.time_range_2');?></a> 
					<a href="<?php print url::site() ?>admin/stats/reports_catdptompio/?range=180"><?php echo Kohana::lang('stats.time_range_3');?></a> 
					<a href="<?php print url::site() ?>admin/stats/reports_catdptompio/"><?php echo Kohana::lang('stats.time_range_all');?></a>
					<input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" />&nbsp;&nbsp;-&nbsp;&nbsp; 
					<input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" />
					<br><br>
					<?php 

                        //mr_koyote ::: adiciono departamento
						print form::dropdown('formu', $formu, (isset($_GET['formu']) ? $_GET['formu'] : null), 'onchange="myFunction_form(this.value)"  class="form-control-md"');	
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
        
		 
		    <div class="two-col tc-left reports-charts">
                <div id="chart_containercp" style="width: 100%; height: 500px;"></div>      
                <div id="chart_container" style="width: 100%; height: 500px;"></div>
            </div>   
             <!-- Right Column -->
        <div class="two-col tc-right stats-sidebar">
        	<div class="stats-wrapper ">
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

<script type="text/javascript">
    $(document).ready(function() {
        const labels = <?php echo isset($plotly_labels) ? $plotly_labels : '[]'; ?>;
        const values = <?php echo isset($plotly_values) ? $plotly_values : '[]'; ?>;
		const labelscp = <?php echo isset($plotly_labelscp) ? $plotly_labelscp : '[]'; ?>;
        const valuescp = <?php echo isset($plotly_valuescp) ? $plotly_valuescp : '[]'; ?>;

        const data = [{
            <?php if (!empty($horizontal)): ?>
            x: values,
            y: labels,
            orientation: 'h',
            <?php else: ?>
            x: labels,
            y: values,
            <?php endif; ?>
            type: 'bar',
            marker: {
                //color: 'rgba(100,149,237,0.7)',
				color: [
                    '#4CAF50', '#2196F3', '#FFC107', '#FF5722',
                    '#9C27B0', '#009688', '#E91E63', '#795548',
                    '#3F51B5', '#607D8B'
                ],
                line: { color: 'rgba(100,149,237,1.0)', width: 2 }
            }
        }];
		const datacp = [{
            <?php if (!empty($horizontal)): ?>
            x: valuescp,
            y: labelscp,
            orientation: 'h',
            <?php else: ?>
            x: labelscp,
            y: valuescp,
            <?php endif; ?>
            type: 'bar',
            marker: {
                color: 'rgba(100,149,237,0.7)',
                line: { color: 'rgba(100,149,237,1.0)', width: 2 }
            }
        }];

        const layout = {
            title: "<?php echo $chart_title.' Gráfico'; ?>",
            xaxis: { title: "<?php echo $xaxis_title.''; ?>" },
            yaxis: { title: "<?php echo $yaxis_title.''; ?>" },
            margin: { b: 150 },
            <?php if (!empty($horizontal)): ?>
            autosize: true
            <?php endif; ?>
        };
		const layoutcp = {
            title: "<?php echo $chart_titlecp.'Categoria Padre'; ?>",
            xaxis: { title: "<?php echo $xaxis_titlecp.''; ?>" },
            yaxis: { title: "<?php echo $yaxis_title.''; ?>" },
            margin: { b: 150 },
            <?php if (!empty($horizontal)): ?>
            autosize: true
            <?php endif; ?>
        };

        Plotly.newPlot('chart_container', data, layout);
		 Plotly.newPlot('chart_containercp', datacp, layoutcp);
    });
</script>