<?php
public function cuidad()
{
    $this->template->content = new View('admin/stats/cuidad');
    $this->template->content->title = 'Gráfica por Ciudad';
    $this->themes->protochart_enabled = TRUE;

    $data_raw = array(
        'Medellín' => array(array(0, 19)),
        'Bogotá' => array(array(0, 6))
    );

    $colors = array();
    foreach ($data_raw as $city => $points) {
        $colors[$city] = substr(md5($city), 0, 6);
    }

    $data = array();
    foreach ($data_raw as $city => $points) {
        $data[] = array(
            'name' => $city,
            'data' => $points
        );
    }

    $options = array(
        'bars' => array(
            'show' => 'true',
            'horizontal' => 'true'
        )
    );

    $chart = new protochart;
    $this->template->content->chart = $chart->chart(
        'city_chart',
        $data,
        $options,
        $colors,
        400,
        300
    );

    $this->template->content->chart_data = array(
        'Medellín' => 19,
        'Bogotá' => 6
    );
    $this->template->content->chart_colors = $colors;
}
?>