<?php defined('SYSPATH') OR die('No direct access allowed.');

class Ips_Model extends ORM {
	
//	protected $has_and_belongs_to_many = array('crue');
	
	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'crues_ips';
	protected $table_prefix = 'crues_ips';

	protected static $ipss;

	public function save()
	{
		//print_r("<BR>INGRESE SAVE");	
		//echo "<br>".$this->nombre_ips."<br>".$this->descripcion."<br>".$this->Id;
		Kohana::log('debug', ";:::::::::::::::::::: INGRESE EN EL SAVE" );
		Kohana::log('debug', $this->Id  );
		$table_prefix = Kohana::config('database.default.table_prefix');
		if($this->Id == 0){
			parent::save();
		}
		else{
			$this->db->query('UPDATE crues_ips SET nombre_ips = ?, descripcion = ?, crue_id= ? WHERE Id = ?',
			$this->nombre_ips, $this->descripcion, $this->crue_id, $this->Id
		);
		}
		
		//print_r("<BR>DESPUES SAVE");
		//echo "<br>".$this->nombre_ips."<br>".$this->descripcion."<br>".$this->Id;
		
		
		
	}
	public static function get_ipss($ips_id = NULL)
	{
		//print_r("<BR>////echo  GET_IPS");
		if (! isset(self::$ipss))
		{
			//print_r("<BR>////echo  ! isset(self::");
			$ipss = ORM::factory('ips')->find_all();
			//print_r("<BR>VALOR DE IPS::");
			//print_r($ipss);

			self::$ipss = array();
			foreach($ipss as $ips)
			{
				self::$ipss[$ips->Id]['Id'] = $ips->Id;
				self::$ipss[$ips->Id]['crue_id'] = $ips->crue_id;
				self::$ipss[$ips->Id]['nombre_ips'] = $ips->nombre_ips;
				self::$ipss[$ips->Id]['descripcion'] = $ips->descripcion;
				
			}
		}
		
		if ($ips_id)
		{
			//print_r("<BR>////echo  ips_id::");
			return isset(self::$ipss[$ips_id]) ? array($ips_id => self::$ipss[$ips_id]) : FALSE;
		}
		
		return self::$ipss;
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
		$this->db->query('DELETE FROM `'.$table_prefix.'crues_ips` WHERE Id = ?',$this->Id);		
		
		parent::delete();
	}

} // End Permission Model