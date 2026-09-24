<?php defined('SYSPATH') OR die('No direct access allowed.');

class Instalacion_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('instalacion');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'manager_instalacion';
	protected $table_prefix = 'manager_instalacion';

	protected static $manager_instalacion;

	public function save()
	{
		
		$table_prefix = Kohana::config('database.default.table_prefix');
		if($this->Id == 0){
			parent::save();
		}
		else{
			$this->db->query('UPDATE manager_instalacion SET institucionsolicitante= ?, ubicacion_emblema= ?,nombre_prestador_servicio= ?, tipo_empresa= ?, direccion_prestardor_servicio= ?, telefono_prestador_servicio= ?, perfil_institucional= ?, otro_perfil_institucional= ?,nombre_representante_legal= ?,correo_representante_legal= ?, cargo_representante_legal  = ? WHERE Id = ? ',			$this->institucionsolicitante, $this->ubicacion_emblema, $this->nombre_prestador_servicio,$this->tipo_empresa, $this->direccion_prestardor_servicio, $this->telefono_prestador_servicio,$this->perfil_institucional, 			$this->otro_perfil_institucional, $this->nombre_representante_legal,$this->correo_representante_legal, $this->cargo_representante_legal, $this->Id);



		}
		
		//print_r("<BR>DESPUES SAVE");
		//echo "<br>".$this->institucionsolicitante."<br>".$this->ubicacion_emblema."<br>".$this->Id;
		
		
		
	}
	public static function get_manager_instalacion($instalacion_id = NULL)
	{
		//print_r("<BR>INGRESE GET_manager_instalacion");
		if (! isset(self::$manager_instalacion))
		{
			//print_r("<BR>INGRESE ! isset(self::");
			$manager_instalacion = ORM::factory('instalacion')->find_all();
			//print_r("<BR>VALOR DE manager_instalacion::");
			//print_r($manager_instalacion);

			self::$manager_instalacion = array();
			foreach($manager_instalacion as $instalacion)
			{
				self::$manager_instalacion[$instalacion->Id]['Id'] = $instalacion->Id;
				self::$manager_instalacion[$instalacion->Id]['institucionsolicitante'] = $instalacion->institucionsolicitante;
				self::$manager_instalacion[$instalacion->Id]['ubicacion_emblema'] = $instalacion->ubicacion_emblema;
				self::$manager_instalacion[$instalacion->Id]['nombre_prestador_servicio'] = $instalacion->nombre_prestador_servicio;
				self::$manager_instalacion[$instalacion->Id]['tipo_empresa'] = $instalacion->tipo_empresa;
				self::$manager_instalacion[$instalacion->Id]['direccion_prestardor_servicio'] = $instalacion->direccion_prestardor_servicio;
				self::$manager_instalacion[$instalacion->Id]['telefono_prestador_servicio'] = $instalacion->telefono_prestador_servicio;
				self::$manager_instalacion[$instalacion->Id]['perfil_institucional'] = $instalacion->perfil_institucional;
				self::$manager_instalacion[$instalacion->Id]['otro_perfil_institucional'] = $instalacion->otro_perfil_institucional;
				self::$manager_instalacion[$instalacion->Id]['nombre_representante_legal'] = $instalacion->nombre_representante_legal;
				self::$manager_instalacion[$instalacion->Id]['correo_representante_legal'] = $instalacion->correo_representante_legal;
				self::$manager_instalacion[$instalacion->Id]['cargo_representante_legal'] = $instalacion->cargo_representante_legal;
				
			}
		}
		
		if ($instalacion_id)
		{
			//print_r("<BR>INGRESE ! isset(self::");
			return isset(self::$manager_instalacion[$instalacion_id]) ? array($instalacion_id => self::$manager_instalacion[$instalacion_id]) : FALSE;
		}
		
		return self::$manager_instalacion;
	}
	
	/**
	 * @mr_k ::: Funcion para eliminar
	 * Overrides the default delete method for the ORM.
	 * Deletes roles associated with the instalacion before instalacion is removed from DB.
	 */
	public function delete()
	{
		$table_prefix = Kohana::config('database.default.table_prefix');
		
		// Remove assigned roles
		// Have to use db->query() since we don't have an ORM model for roles_users
		$this->db->query('DELETE FROM `'.$table_prefix.'manager_instalacion` WHERE Id = ?',$this->Id);		
		
		parent::delete();
	}

} // End Permission Model