<?php defined('SYSPATH') OR die('No direct access allowed.');

class Cars_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('cars');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'manager_cars';
	protected $table_prefix = 'manager_cars';
	
	protected static $manager_cars;

	public function save()
	{
		$table_prefix = Kohana::config('database.default.table_prefix');
		if($this->Id == 0){
			parent::save();
		}
		else{
			
			$this->db->query('UPDATE manager_cars SET placa_cars= ?, descripcion= ?, marca_cars= ?,modelo_cars= ?, nombre_prestador_servicio= ?, tipo_empresa= ?, direccion_prestardor_servicio= ?, telefono_prestador_servicio= ?, perfil_institucional= ?, otro_perfil_institucional= ?,nombre_representante_legal= ?,correo_representante_legal= ?, cargo_representante_legal  = ?, fechainicial = ?, fechafinal= ? WHERE Id = ? ',	$this->placa_cars, $this->descripcion, $this->marca_cars,$this->modelo_cars, $this->nombre_prestador_servicio,$this->tipo_empresa, $this->direccion_prestardor_servicio, $this->telefono_prestador_servicio,$this->perfil_institucional, 			$this->otro_perfil_institucional, $this->nombre_representante_legal,$this->correo_representante_legal, $this->cargo_representante_legal, $this->Id, $this->fechainicial, $this->fechainicial,$this->fechafinal, $this->fechafinal);
			
		}
		
		
	}
	public static function get_manager_cars($cars_id = NULL)
	{
		
		if (! isset(self::$manager_cars))
		{
		
			$manager_cars = ORM::factory('cars')->find_all();
		
			self::$manager_cars = array();
			foreach($manager_cars as $cars)
			{
				self::$manager_cars[$cars->Id]['Id'] = $cars->Id;
				self::$manager_cars[$cars->Id]['placa_cars'] = $cars->placa_cars;
				self::$manager_cars[$cars->Id]['descripcion'] = $cars->descripcion;
				self::$manager_cars[$cars->Id]['marca_cars'] = $cars->marca_cars;
				self::$manager_cars[$cars->Id]['modelo_cars'] = $cars->modelo_cars;
				self::$manager_cars[$cars->Id]['nombre_prestador_servicio'] = $cars->nombre_prestador_servicio;
				self::$manager_cars[$cars->Id]['tipo_empresa'] = $cars->tipo_empresa;
				self::$manager_cars[$cars->Id]['direccion_prestardor_servicio'] = $cars->direccion_prestardor_servicio;
				self::$manager_cars[$cars->Id]['telefono_prestador_servicio'] = $cars->telefono_prestador_servicio;
				self::$manager_cars[$cars->Id]['perfil_institucional'] = $cars->perfil_institucional;
				self::$manager_cars[$cars->Id]['otro_perfil_institucional'] = $cars->otro_perfil_institucional;
				self::$manager_cars[$cars->Id]['nombre_representante_legal'] = $cars->nombre_representante_legal;
				self::$manager_cars[$cars->Id]['correo_representante_legal'] = $cars->correo_representante_legal;
				self::$manager_cars[$cars->Id]['cargo_representante_legal'] = $cars->cargo_representante_legal;
				self::$manager_cars[$cars->Id]['fechainicial'] = $cars->fechainicial;
				self::$manager_cars[$cars->Id]['fechafinal'] = $cars->fechafinal;

				
			}
		}
		
		if ($cars_id)
		{		
			return isset(self::$manager_cars[$cars_id]) ? array($cars_id => self::$manager_cars[$cars_id]) : FALSE;
		}
		
		return self::$manager_cars;
	}

	/**
	 * @mr_k ::: Funcion para eliminar
	 * Overrides the default delete method for the ORM.
	 * Deletes roles associated with the cars before cars is removed from DB.
	 */
	public function delete()
	{
		$table_prefix = Kohana::config('database.default.table_prefix');
		
		// Remove assigned roles
		// Have to use db->query() since we don't have an ORM model for roles_users
		$this->db->query('DELETE FROM `'.$table_prefix.'manager_cars` WHERE Id = ?',$this->Id);		
		
		parent::delete();
	}
	

} // End Permission Model