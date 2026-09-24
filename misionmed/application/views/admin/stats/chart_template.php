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
    <h2>
        <?php echo $title; ?> 
        <?php if (isset($navigation_links)): ?>
            <?php foreach ($navigation_links as $link): ?>
                <a href="<?php echo url::site() . $link['url']; ?>"><?php echo $link['label']; ?></a>
            <?php endforeach; ?>
        <?php endif; ?>
    </h2>

    <div class="content-wrap clearfix">
        <?php if (!empty($subtitle)): ?>
            <h3>sssssssssss<?php echo $subtitle; ?></h3>
        <?php endif; ?>

        <!-- Selector de fecha -->
        <?php if (isset($show_date_range) && $show_date_range): ?>

            
        <div id="time-period-selector">
            <p>
                
                <?php  echo form::open($form_action , array('method' => 'get', 'style' => "display: inline;")); ?> 
                 
                 <?php //echo Kohana::lang('stats.choose_date_range'); ?>:
                    <?php echo Kohana::lang('stats.choose_date_range');?>: 
                    <a href="<?php print url::site() ?>admin/stats/ejemplo_chart/?range=30"><?php echo Kohana::lang('stats.time_range_1');?></a> 
					<a href="<?php print url::site() ?>admin/stats/ejemplo_chart/?range=90"><?php echo Kohana::lang('stats.time_range_2');?></a> 
					<a href="<?php print url::site() ?>admin/stats/ejemplo_chart/?range=180"><?php echo Kohana::lang('stats.time_range_3');?></a> 
					<a href="<?php print url::site() ?>admin/stats/ejemplo_chart/"><?php echo Kohana::lang('stats.time_range_all');?></a>
					
                    
                    <input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" />
                    &nbsp;&nbsp;-&nbsp;&nbsp;
                    <input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" />
                    
                    
                    <input type="hidden" name="range" value="<?php echo $range; ?>" />
                    <input type="submit" value="Go →" class="button" />
                <?php echo form::close(); ?>
            </p>
        </div>
        <?php endif; ?>

        <!-- Gráfico -->
        <div id="chart_container" style="width: 100%; height: 500px;"></div>
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
                color: 'rgba(100,149,237,0.7)',
                line: { color: 'rgba(100,149,237,1.0)', width: 2 }
            }
        }];

        const layout = {
            title: "<?php echo $chart_title.'Gráfico'; ?>",
            xaxis: { title: "<?php echo $xaxis_title.'Etiqueta X'; ?>" },
            yaxis: { title: "<?php echo $yaxis_title.'Etiqueta Y'; ?>" },
            margin: { b: 150 },
            <?php if (!empty($horizontal)): ?>
            autosize: true
            <?php endif; ?>
        };

        Plotly.newPlot('chart_container', data, layout);
    });
</script>