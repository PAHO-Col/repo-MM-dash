<!-- Cargar dependencias -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.plot.ly/plotly-2.27.1.min.js"></script>

<div class="bg">
    <h2>
        <?php echo $title; ?> 
        <a href="<?php echo url::site() ?>admin/stats/hits"><?php echo Kohana::lang('stats.visitor_summary'); ?></a>
        <a href="<?php echo url::site() ?>admin/stats/country"><?php echo Kohana::lang('stats.country_breakdown'); ?></a>
        <a href="<?php echo url::site() ?>admin/stats/reports"><?php echo Kohana::lang('stats.report_stats'); ?></a>
        <a href="<?php echo url::site() ?>admin/stats/impact"><?php echo Kohana::lang('stats.category_impact'); ?></a>
        <a href="<?php echo url::site() ?>admin/stats/punchcard"><?php echo Kohana::lang('stats.report_punchcard'); ?></a>
    </h2>

    <div class="content-wrap clearfix">
        <h3><?php echo Kohana::lang('stats.reports_statistics'); ?></h3>

        <!-- Selector de periodo -->
        <div id="time-period-selector">
            <p>
                <?php echo form::open('admin/stats/formulario/', ['method' => 'get', 'style' => 'display: inline;']); ?>
                    <?php echo Kohana::lang('stats.choose_date_range'); ?>:
                    <a href="<?php echo url::site() ?>admin/stats/formulario/?range=30"><?php echo Kohana::lang('stats.time_range_1'); ?></a>
                    <a href="<?php echo url::site() ?>admin/stats/formulario/?range=90"><?php echo Kohana::lang('stats.time_range_2'); ?></a>
                    <a href="<?php echo url::site() ?>admin/stats/formulario/?range=180"><?php echo Kohana::lang('stats.time_range_3'); ?></a>
                    <a href="<?php echo url::site() ?>admin/stats/formulario/"><?php echo Kohana::lang('stats.time_range_all'); ?></a>
                    <input type="text" class="dp" name="dp1" id="dp1" value="<?php echo $dp1; ?>" />
                    &nbsp;&nbsp;-&nbsp;&nbsp;
                    <input type="text" class="dp" name="dp2" id="dp2" value="<?php echo $dp2; ?>" />
                    <input type="hidden" name="range" value="<?php echo $range; ?>" />
                    <input type="submit" value="Go →" class="button" />
                <?php echo form::close(); ?>
            </p>
        </div>

        <!-- Gráfico Plotly -->
        <div id="ciudad_chart" style="width: 100%; height: 500px;"></div>
    </div>
</div>

<!-- Generar gráfica con Plotly -->
<script type="text/javascript">
    const labels = <?php echo !empty($plotly_labels) ? $plotly_labels : '[]'; ?>;
    const values = <?php echo !empty($plotly_values) ? $plotly_values : '[]'; ?>;

    const data = [{
        x: labels,
        y: values,
        type: 'bar',
        marker: {
            color: 'rgba(100,149,237,0.7)',
            line: {
                color: 'rgba(100,149,237,1)',
                width: 2
            }
        }
    }];

    const layout = {
        title: 'Reportes por Ciudad',
        xaxis: { title: 'Ciudad' },
        yaxis: { title: 'Cantidad de reportes' },
        margin: { b: 150 }
    };

    Plotly.newPlot('ciudad_chart', data, layout);
</script>




