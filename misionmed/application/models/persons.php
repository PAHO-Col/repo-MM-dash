<?php defined('SYSPATH') OR die('No direct access allowed.');

class Persons_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('persons');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'manager_persons';
	protected $table_prefix = 'manager_persons';

	protected static $manager_persons;

	public function save()
	{
		$table_prefix = Kohana::config('database.default.table_prefix');
		if($this->Id == 0){
			parent::save();
		}
		else{
			$this->db->query('UPDATE manager_persons SET nombre_persons = ?, Cargo = ?, documento_persons= ?, nombre_prestador_servicio= ?, tipo_empresa= ?, direccion_prestardor_servicio= ?, telefono_prestador_servicio= ?, perfil_institucional= ?, otro_perfil_institucional= ?,nombre_representante_legal= ?,correo_representante_legal= ?, cargo_representante_legal  = ? WHERE Id = ? ',$this->nombre_persons, $this->Cargo, $this->documento_persons, $this->nombre_prestador_servicio,$this->tipo_empresa, $this->direccion_prestardor_servicio, $this->telefono_prestador_servicio,$this->perfil_institucional, 	$this->otro_perfil_institucional, $this->nombre_representante_legal,$this->correo_representante_legal, $this->cargo_representante_legal, $this->Id);
			Kohana::log('debug',':::::::::::::::::::::::::::::::: ENTRE EN EL UPDATE');
		}
		
		//print_r("<BR>DESPUES SAVE");
		//echo "<br>".$this->nombre_persons."<br>".$this->Cargo."<br>".$this->Id;
		
		
		
	}
	public static function get_manager_persons($persons_id = NULL)
	{
		//print_r("<BR>INGRESE GET_manager_persons");
		if (! isset(self::$manager_persons))
		{
			//print_r("<BR>INGRESE ! isset(self::");
			$manager_persons = ORM::factory('persons')->find_all();
			//print_r("<BR>VALOR DE manager_persons::");
			//print_r($manager_persons);

			self::$manager_persons = array();
			foreach($manager_persons as $persons)
			{
				self::$manager_persons[$persons->Id]['Id'] = $persons->Id;
				self::$manager_persons[$persons->Id]['nombre_persons'] = $persons->nombre_persons;
				self::$manager_persons[$persons->Id]['Cargo'] = $persons->Cargo;
				self::$manager_persons[$persons->Id]['documento_persons'] = $persons->documento_persons;
				self::$manager_persons[$persons->Id]['nombre_prestador_servicio'] = $persons->nombre_prestador_servicio;
				self::$manager_persons[$persons->Id]['tipo_empresa'] = $persons->tipo_empresa;
				self::$manager_persons[$persons->Id]['direccion_prestardor_servicio'] = $persons->direccion_prestardor_servicio;
				self::$manager_persons[$persons->Id]['telefono_prestador_servicio'] = $persons->telefono_prestador_servicio;
				self::$manager_persons[$persons->Id]['perfil_institucional'] = $persons->perfil_institucional;
				self::$manager_persons[$persons->Id]['otro_perfil_institucional'] = $persons->otro_perfil_institucional;
				self::$manager_persons[$persons->Id]['nombre_representante_legal'] = $persons->nombre_representante_legal;
				self::$manager_persons[$persons->Id]['correo_representante_legal'] = $persons->correo_representante_legal;
				self::$manager_persons[$persons->Id]['cargo_representante_legal'] = $persons->cargo_representante_legal;
				
			}
		}
		
		if ($persons_id)
		{
			//print_r("<BR>INGRESE ! isset(self::");
			return isset(self::$manager_persons[$persons_id]) ? array($persons_id => self::$manager_persons[$persons_id]) : FALSE;
		}
		
		return self::$manager_persons;
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
		$this->db->query('DELETE FROM `'.$table_prefix.'manager_persons` WHERE Id = ?',$this->Id);		
		
		parent::delete();
	}

} // End Permission Model