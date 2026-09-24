

<!-- Cargar dependencias - jQuery moderno -->
 <!-- Cargar dependencias LOCALES -->
<script src="<?php echo url::base(); ?>media/js/jquery-3.6.0.min.js"></script>
<script src="<?php echo url::base(); ?>media/js/plotly-2.27.1.min.js"></script>
<script src="<?php echo url::base(); ?>media/js/jquery-migrate-3.4.0.min.js"></script>
<script>
    jQuery.browser = {};
    (function () {
        var ua = navigator.userAgent.toLowerCase();
        jQuery.browser.msie = /msie/.test(ua) || /trident/.test(ua);
        jQuery.browser.version = (ua.match(/(?:msie |rv:)(\d+(\.\d+)?)/) || [])[1];
    })();
</script>
<div class="bg">
    <h2>
        <?php echo $title; ?> 
        <?php if (isset($navigation_links)): ?>
            <?php foreach ($navigation_links as $link): ?>
                <a href="<?php //echo url::site() . $link['url']; ?>"><?php //echo $link['label']; ?></a>
            <?php endforeach; ?>
        <?php endif; ?>
        
     <!-- <a href="<?php print url::site() ?>admin/stats/reportsc"><?php echo Kohana::lang('stats.report_statspadre');?></a> -->
        <a href="<?php print url::site() ?>admin/stats/formulario_d"><?php echo Kohana::lang('stats.formulario');?></a>   
        <a href="<?php print url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact');?></a> 
      <!--  <a href="<?php print url::site() ?>admin/stats/reports_catdptompio"><?php echo Kohana::lang('stats.catdptompio');?></a>    -->   
    </h2>
        

    <div class="content-wrap clearfix">
        <?php if (!empty($subtitle)): ?>
            <h3><?php echo $subtitle; ?></h3>
        <?php endif; ?>

        <!-- Selector de fecha -->
        <?php if (isset($show_date_range) && $show_date_range): ?>
            
        <div id="time-period-selector">
            <p>
                
                <?php  echo form::open($form_action , array('method' => 'get', 'style' => "display: inline;")); ?> 
                 
                 <?php //echo Kohana::lang('stats.choose_date_range'); ?>:
                    <?php echo Kohana::lang('stats.choose_date_range');?>: 
                    <a href="<?php print url::site() ?>admin/stats/formulario_d/?range=30"><?php echo Kohana::lang('stats.time_range_1');?></a> 
					<a href="<?php print url::site() ?>admin/stats/formulario_d/?range=90"><?php echo Kohana::lang('stats.time_range_2');?></a> 
					<a href="<?php print url::site() ?>admin/stats/formulario_d/?range=180"><?php echo Kohana::lang('stats.time_range_3');?></a> 
					<a href="<?php print url::site() ?>admin/stats/formulario_d/"><?php echo Kohana::lang('stats.time_range_all');?></a>
					
                    
                    <input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" />
                    &nbsp;&nbsp;-&nbsp;&nbsp;
                    <input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" />

                    <br><br>
					<?php
                         //variable
                        print form::dropdown('variable', $variable, (isset($_GET['variable']) ? $_GET['variable'] : null), '  class="form-control-md"');	 

						//mr_koyote ::: adiciono departamento
						print form::dropdown('dpto', $dpto, (isset($_GET['dpto']) ? $_GET['dpto'] : null), 'onchange="myFunctionc(this.value)"  class="form-control-md"');	
						//echo form::dropdown("custom_field[".$field_id.']',$parents_arraydpto,$field_value,'  onchange="myFunction(this.value)" class="form-control"',$id_name);					
						print form::dropdown('mpio',$mpio,  (isset($_GET['mpio']) ? $_GET['mpio'] : null), ' class="form-control-md"');	
                       

					?>


                    <input type="hidden" name="range" value="<?php echo $range; ?>" />
                    <input type="submit" value="Go →" class="button" />
                <?php echo form::close(); ?>
            </p>
        </div>
        <?php endif; ?>

        <!-- Gráfico -->
        <div id="chart_container" style="width: 100%; height: 500px;"></div>
        <!-- Nuevo gráfico de torta -->
        <div id="pie_chart_container" style="width: 100%; height: 500px; margin-top: 30px;"></div>
          
    <?php if (!empty($plotly_labels) && !empty($plotly_values)): ?>
    <h3 style="font-family: Arial, sans-serif; color: #2c3e50; margin-bottom: 10px;">Tabla de Datos</h3>
    <table style="border-collapse: collapse; width: 60%; font-family: Arial, sans-serif; margin-bottom: 20px;">
        <thead>
            <tr style="background-color: #2980b9; color: white;">
                <th style="padding: 10px; border: 1px solid #ddd;">Variable</th>
                <th style="padding: 10px; border: 1px solid #ddd;">Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($table as $t): ?>
                <tr style="background-color: #f9f9f9;">
                    <td style="padding: 10px; border: 1px solid #ddd;"><?php echo html::specialchars($t['label']); ?></td>
                    <td style="padding: 10px; border: 1px solid #ddd; text-align: center;"><?php echo (int) $t['values']; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>


    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        const labels = <?php echo isset($plotly_labels) ? $plotly_labels : '[]'; ?>;
        const values = <?php echo isset($plotly_values) ? $plotly_values : '[]'; ?>;

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
               // color: 'rgba(100,149,237,0.7)',
                color: [
                    '#4CAF50', '#2196F3', '#FFC107', '#FF5722',
                    '#9C27B0', '#009688', '#E91E63', '#795548',
                    '#3F51B5', '#607D8B'
                ]
                //line: { color: 'rgba(100,149,237,1.0)', width: 2 }
            }
        }];

        const layout = {
            title: "<?php echo $chart_title.'Gráfico'; ?>",
            xaxis: { title: "<?php echo $xaxis_title.''; ?>" },
            yaxis: { title: "<?php echo $yaxis_title.''; ?>" },
            margin: { b: 150 },
            <?php if (!empty($horizontal)): ?>
            autosize: true
            <?php endif; ?>
        };

        Plotly.newPlot('chart_container', data, layout);



                // Gráfico de torta (pie)
        const pieData = [{
            labels: labels,
            values: values,
            type: 'pie',
            textinfo: 'label+percent',
            insidetextorientation: 'radial',
            marker: {
                colors: [
                    '#4CAF50', '#2196F3', '#FFC107', '#FF5722',
                    '#9C27B0', '#009688', '#E91E63', '#795548',
                    '#3F51B5', '#607D8B'
                ]
            }
        }];

        const pieLayout = {
            title: "<?php echo $chart_title . ' (Gráfico de Torta)'; ?>",
            showlegend: true
        };

        Plotly.newPlot('pie_chart_container', pieData, pieLayout);

    });
</script>