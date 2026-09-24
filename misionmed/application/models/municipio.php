<?php defined('SYSPATH') OR die('No direct access allowed.');

class Municipio_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('cars');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'municipios';
	protected $table_prefix = 'municipios';
	
	protected static $manager_dpto;

	// Obtener todos los municipios
    public function get_municipios()
    {
        //return ORM::factory('departamento')->find_all();
		if (! isset(self::$manager_dpto))
		{
		
			$manager_dpto = ORM::factory('municipio')->find_all();
		
			self::$manager_dpto = array();
			foreach($manager_dpto as $eldpto)
			{
				self::$manager_dpto[$eldpto->Id]['Id'] = $eldpto->Id;
				self::$manager_dpto[$eldpto->Id]['nombre'] = $eldpto->nombre;
			}
		}	

		return self::$manager_dpto;

    }
	
	// Obtener municipios de un departamento específico
    //public function get_municipios_by_departamento($iddpto)
	public function get_municipios_by_departamento()
    {
        return ORM::factory('municipio')->where('iddpto', 1)->find_all();
    }
	
	
	

} // End Permission Model