<!-- Cargamos jQuery desde CDN -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- Cargamos Flot y el plugin de categorías -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flot/0.8.3/jquery.flot.categories.min.js"></script>

<div style="width:600px; height:400px;" id="chartDiv"></div>

<script type="text/javascript">
$(function() {
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
});
</script>
