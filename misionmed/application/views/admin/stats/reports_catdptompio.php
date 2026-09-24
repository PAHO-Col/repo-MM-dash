<!-- Dependencias -->
<!-- Cargar dependencias LOCALES -->
<script src="<?php echo url::base(); ?>media/js/jquery-3.6.0.min.js"></script>
<script src="<?php echo url::base(); ?>media/js/plotly-2.27.1.min.js"></script>
<script src="<?php echo url::base(); ?>media/js/jquery-migrate-3.4.0.min.js"></script>

<!-- Compatibilidad legacy -->
<script>
    jQuery.browser = {};
    (function () {
        var ua = navigator.userAgent.toLowerCase();
        jQuery.browser.msie = /msie/.test(ua) || /trident/.test(ua);
        jQuery.browser.version = (ua.match(/(?:msie |rv:)(\d+(\.\d+)?)/) || [])[1];
    })();
</script>

<style>
    .content-wrap { margin-top: 20px; }
    .reports-charts { margin-bottom: 30px; }
    .stats-sidebar h4 { margin-top: 20px; }
    .stats-list { border-collapse: collapse; width: 100%; margin-top: 10px; }
    .stats-list th, .stats-list td {
        border: 1px solid #ccc;
        padding: 6px 10px;
        text-align: left;
    }
    .stats-list th { background: #f5f5f5; }
</style>

<div class="bg">
    <h2>
        <?php echo $title; ?> 
        <a href="<?php print url::site() ?>admin/stats/reportsc"><?php echo Kohana::lang('stats.report_statspadre');?></a>
        <a href="<?php print url::site() ?>admin/stats/formulario_d"><?php echo Kohana::lang('stats.formulario');?></a>   
        <a href="<?php print url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact');?></a> 
        <a href="<?php print url::site() ?>admin/stats/reports_catdptompio"><?php echo Kohana::lang('stats.catdptompio');?></a>       
    </h2>
    
    <div class="content-wrap clearfix">
        <h3><?php echo Kohana::lang('stats.reports_statistics');?></h3>
	
        <div id="time-period-selector">
            <p>
                <?php echo form::open('admin/stats/reports_catdptompio/', ['method' => 'get', 'style' => "display: inline;"]); ?>
                    <?php echo Kohana::lang('stats.choose_date_range');?>: 
                    <a href="?range=30"><?php echo Kohana::lang('stats.time_range_1');?></a> 
                    <a href="?range=90"><?php echo Kohana::lang('stats.time_range_2');?></a> 
                    <a href="?range=180"><?php echo Kohana::lang('stats.time_range_3');?></a> 
                    <a href="?"><?php echo Kohana::lang('stats.time_range_all');?></a>
                    <input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" /> &nbsp;-&nbsp; 
                    <input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" />
                    <br>
                    <?php 
                    
                        //mr_koyote ::: adiciono departamento
						//print form::dropdown('formu', $formu, (isset($_GET['formu']) ? $_GET['formu'] : null), 'onchange="myFunction_form(this.value)"  class="form-control-md"');	
                         //variable
                        print form::dropdown('formu_campo', $formu_campo, (isset($_GET['formu_campo']) ? $_GET['formu_campo'] : null), '  class="form-control-md"');	     
                        
						//mr_koyote ::: adiciono departamento
						print form::dropdown('dpto', $dpto, (isset($_GET['dpto']) ? $_GET['dpto'] : null), 'onchange="myFunction(this.value)"  class="form-control-md"');	
						//echo form::dropdown("custom_field[".$field_id.']',$parents_arraydpto,$field_value,'  onchange="myFunction(this.value)" class="form-control"',$id_name);					
						print form::dropdown('mpio',$mpio,  (isset($_GET['mpio']) ? $_GET['mpio'] : null), ' class="form-control-md"');	
						//print form::dropdown('categoriap', $parents_arraycatp,  ' class="form-control"'); 
						print form::dropdown('categoriap', $parents_arraycatp, (isset($_GET['categoriap']) ? $_GET['categoriap'] : null), ' class="form-control-md"');
                    ?>

                    <input type="hidden" name="range" value="<?php echo $range; ?>" />
                    <input type="submit" value="Go →" class="button" />
                <?php echo form::close(); ?>
            </p>
        </div>
        
        <!-- Gráficas -->
        <div class="two-col tc-left reports-charts">

            <div id="chart_containercp" style="width: 100%; height: 500px;"></div> 
            <div id="chart_containerc" style="width: 100%; height: 500px;"></div>      
            <div id="chart_container" style="width: 100%; height: 500px;"></div>
            <div id="chart_containermpio" style="width: 100%; height: 500px;"></div>
                        
        </div>   

        <!-- Sidebar -->
        <div class="two-col tc-right stats-sidebar">
            <div class="stats-wrapper">             
                    <h2><?php echo Kohana::lang('stats.reports');?></h2>
                    <p><?php echo $num_reports; ?> aprobados & verificados</p>                
            </div>
            <div class="stats-wrapper">               
                    <h2><?php echo Kohana::lang('stats.categories');?></h2>
                   <?php echo $num_categories; ?></p>  
                   <table class="stats-list">
                    <thead>
                        <tr><th>Categoria</th><th>Cantidad</th></tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach($reports_per_cat as $category_id => $count){
	            		?>
	            		<tr>	            				
	            		<td><?php echo $category_data[$category_id]['category_title']; ?></td>
	            		<td><?php echo $count; ?></td>
	            		</tr>
	            		<?php
            		    }
            		    ?>
                </tbody>
            </table>
                                 
            </div>
            <div style="clear:both;"></div>

            <h4>Departamentos</h4>
            <table class="stats-list">
                <thead>
                    <tr><th>Nombre</th><th>Cantidad</th></tr>
                </thead>
                <tbody>
                    <?php foreach ($num_dpto as $d): ?>
                        <tr>
                            <td><?php echo $d['name']; ?></td>
                            <td><?php echo $d['count']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <h4>Municipios</h4>
            <table class="stats-list">
                <thead>
                    <tr><th>Nombre</th><th>Cantidad</th></tr>
                </thead>
                <tbody>
                    <?php foreach ($num_mpio as $m): ?>
                        <tr><td><?php echo $m['name']; ?></td><td><?php echo $m['count']; ?></td></tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Gráficas con Plotly -->
<script>
$(function() {
        const labels = <?php echo isset($plotly_labels) ? $plotly_labels : '[]'; ?>;
        const values = <?php echo isset($plotly_values) ? $plotly_values : '[]'; ?>;
		const labelscp = <?php echo isset($plotly_labelscp) ? $plotly_labelscp : '[]'; ?>;
        const valuescp = <?php echo isset($plotly_valuescp) ? $plotly_valuescp : '[]'; ?>;
        const labelsc = <?php echo isset($plotly_labelsc) ? $plotly_labelsc : '[]'; ?>;
        const valuesc = <?php echo isset($plotly_valuesc) ? $plotly_valuesc : '[]'; ?>;
        const labelsmpio = <?php echo isset($plotly_labelsmpio) ? $plotly_labelsmpio : '[]'; ?>;
        const valuesmpio = <?php echo isset($plotly_valuesmpio) ? $plotly_valuesmpio : '[]'; ?>;

   /* const colors = [
        '#4CAF50','#2196F3','#FFC107','#FF5722',
        '#9C27B0','#009688','#E91E63','#795548',
        '#3F51B5','#607D8B'
    ];*/
    function generateColors(count) {
        const colors = [];
        for (let i = 0; i < count; i++) {
            const hue = (i * 360 / count) % 360;  // distribuye en el círculo cromático
            colors.push(`hsl(${hue}, 45%, 60%)`);
        }
        return colors;
    }
    
    // Colores dinámicos para cada gráfico
    const colorsDepto = generateColors(labels.length);
    const colorsMpio = generateColors(labelsmpio.length);
    const colorsCp   = generateColors(labelscp.length);
    const colorsC   = generateColors(labelsc.length);

    Plotly.newPlot('chart_container', [{
        x: <?php echo !empty($horizontal) ? 'values' : 'labels'; ?>,
        y: <?php echo !empty($horizontal) ? 'labels' : 'values'; ?>,
        orientation: <?php echo !empty($horizontal) ? "'h'" : "''"; ?>,
        type: 'bar',
        marker: { color: colorsDepto }
    }], {
        title: "<?php echo $chart_title.' Gráfico'; ?>",
        xaxis: { title: "<?php echo $xaxis_title; ?>" },
        yaxis: { title: "<?php echo $yaxis_title; ?>" },
        margin: { b: 150 }
    });

    Plotly.newPlot('chart_containermpio', [{
        x: <?php echo !empty($horizontal) ? 'valuesmpio' : 'labelsmpio'; ?>,
        y: <?php echo !empty($horizontal) ? 'labelsmpio' : 'valuesmpio'; ?>,
        orientation: <?php echo !empty($horizontal) ? "'h'" : "''"; ?>,
        type: 'bar',
        marker: { color: colorsMpio }
    }], {
        title: "<?php echo $chart_titlempio.' Gráfico'; ?>",
        xaxis: { title: "<?php echo $xaxis_titlempio; ?>" },
        yaxis: { title: "<?php echo $yaxis_title; ?>" },
        margin: { b: 150 }
    });
    Plotly.newPlot('chart_containercp', [{
        x: <?php echo !empty($horizontal) ? 'valuescp' : 'labelscp'; ?>,
        y: <?php echo !empty($horizontal) ? 'labelscp' : 'valuescp'; ?>,
        orientation: <?php echo !empty($horizontal) ? "'h'" : "''"; ?>,
        type: 'bar',
       // marker: { color: 'rgba(100,149,237,0.7)' }
        marker: { color: colorsCp }
    }], {
        title: "<?php echo $chart_titlecp.''; ?>",
        xaxis: { title: "<?php echo $xaxis_titlecp; ?>" },
        yaxis: { title: "<?php echo $yaxis_title; ?>" },
        margin: { b: 150 }
    });
    Plotly.newPlot('chart_containerc', [{
        x: <?php echo !empty($horizontal) ? 'valuesc' : 'labelsc'; ?>,
        y: <?php echo !empty($horizontal) ? 'labelsc' : 'valuesc'; ?>,
        orientation: <?php echo !empty($horizontal) ? "'h'" : "''"; ?>,
        type: 'bar',
       // marker: { color: 'rgba(100,149,237,0.7)' }
        marker: { color: colorsC }
    }], {
        title: "<?php echo $chart_titlec.''; ?>",
        xaxis: { title: "<?php echo $xaxis_titlec; ?>" },
        yaxis: { title: "<?php echo $yaxis_title; ?>" },
        margin: { b: 150 }
    });
    

});
</script>
