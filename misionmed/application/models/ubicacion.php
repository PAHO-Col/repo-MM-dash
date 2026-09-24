<?php defined('SYSPATH') OR die('No direct access allowed.');

class Ubicacion_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('cars');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'municipios';
	//protected $table_prefix = 'manager_cars';
	
	//protected static $manager_cars;

	// Obtener todos los departamentos
    public function get_departamentos()
    {
        return ORM::factory('departamento')->find_all();
    }
	
	// Obtener municipios de un departamento específico
    public function get_municipios_by_departamento($iddpto)
    {
        return ORM::factory('municipio')->where('iddpto', $iddpto)->find_all();
    }
	
	
	

} // End Permission Model