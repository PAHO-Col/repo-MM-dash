<div class="bg">
    <h2>Gráfica por Ciudad</h2>

    <div class="content-wrap clearfix">
        <h3>Estadísticas</h3>

        <div class="two-col tc-left reports-charts">
            <?php echo $chart; ?>
        </div>

        <table>
            <?php foreach ($chart_data as $city => $value): ?>
                <tr>
                    <td>
                        <div style="width:20px; height:20px; background-color:#<?php echo $chart_colors[$city]; ?>;"></div>
                    </td>
                    <td><?php echo html::specialchars($city); ?></td>
                    <td><?php echo $value; ?></td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
</div>
