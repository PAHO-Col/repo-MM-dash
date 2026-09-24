<?php defined('SYSPATH') or die('No direct script access.');

class Ubicacion_Controller extends Template_Controller
{
    public function departamentos()
    {
        $departamentos = ORM::factory('departamento')->find_all();
        $result = [];

        foreach ($departamentos as $dpto) {
            $result[] = ['id' => $dpto->id, 'nombre' => $dpto->nombre];
        }

        echo json_encode($result);
    }

    public function municipios($iddpto)
    {
        $municipios = ORM::factory('municipio')->where('iddpto', $iddpto)->find_all();
        $result = [];

        foreach ($municipios as $mun) {
            $result[] = ['id' => $mun->id, 'nombre' => $mun->nombre];
        }

        echo json_encode($result);
    }
}
?>
