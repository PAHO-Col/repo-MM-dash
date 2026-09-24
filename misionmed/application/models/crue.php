<?php defined('SYSPATH') OR die('No direct access allowed.');

class Crue_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('crue');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'crues';
	protected $table_prefix = 'crues';

	protected static $crues;

	public function save()
	{
		//print_r("<BR>INGRESE SAVE");
		//echo "<br>".$this->Nombre."<br>".$this->Descripcion."<br>".$this->Id;
		$table_prefix = Kohana::config('database.default.table_prefix');
		if($this->Id == 0){
			parent::save();
		}
		else{
			$this->db->query('UPDATE crues SET Nombre = ?, Descripcion = ? WHERE Id = ? ',
			$this->Nombre, $this->Descripcion, $this->Id
		);
		}
		
		//print_r("<BR>DESPUES SAVE");
		//echo "<br>".$this->Nombre."<br>".$this->Descripcion."<br>".$this->Id;
		
		
		
	}
	public static function get_crues($crue_id = NULL)
	{
		//print_r("<BR>INGRESE GET_CRUES");
		if (! isset(self::$crues))
		{
			//print_r("<BR>INGRESE ! isset(self::");
			$crues = ORM::factory('crue')->find_all();
			//print_r("<BR>VALOR DE CRUES::");
			//print_r($crues);

			self::$crues = array();
			foreach($crues as $crue)
			{
				self::$crues[$crue->Id]['Id'] = $crue->Id;
				self::$crues[$crue->Id]['Nombre'] = $crue->Nombre;
				self::$crues[$crue->Id]['Descripcion'] = $crue->Descripcion;
				
			}
		}
		
		if ($crue_id)
		{
			//print_r("<BR>INGRESE ! isset(self::");
			return isset(self::$crues[$crue_id]) ? array($crue_id => self::$crues[$crue_id]) : FALSE;
		}
		
		return self::$crues;
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

		$this->db->query('DELETE FROM `'.$table_prefix.'crues` WHERE Id = ?',$this->Id);		
		
		parent::delete();
	}
	

} // End Permission Model