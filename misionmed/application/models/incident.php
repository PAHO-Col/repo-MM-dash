<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for reported Incidents
 *@mr_k ::: modelo modificado
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi - http://source.ushahididev.com
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */

class Incident_Model extends ORM {
	/**
	 * One-to-may relationship definition
	 * @var array
	 */
	protected $has_many = array(
		'category' => 'incident_category',
		'media',
		'verify',
		'comment',
		'rating',
		'alert' => 'alert_sent',
		'incident_lang',
		'form_response',
		'cluster' => 'cluster_incident',
		'geometry'
	);

	/**
	 * One-to-one relationship definition
	 * @var array
	 */
	protected $has_one = array(
		'location',
		'incident_person',
		'user',
		'message',
		'twitter',
		'form'
	);

	/**
	 * Database table name
	 * @var string
	 */
	protected $table_name = 'incident';

	/**
	 * Prevents cached items from being reloaded
	 * @var bool
	 */
	protected $reload_on_wakeup   = FALSE;

	/**
	 * Gets a list of all visible categories
	 * @todo Move this to the category model
	 * @return array
	 */
	public static function get_active_categories()
	{
		Kohana::log('debug',":::::MMM  get_active_categories (models incident)");
		// Get all active categories
		$categories = array();
		foreach
		(
			ORM::factory('category')
			    ->where('category_visible', '1')
			    ->find_all() as $category)
		{
			// Create a list of all categories
			$categories[$category->id] = array(
				$category->category_title, 
				$category->category_color
			);
		}
		return $categories;
	}

	/**
	 * Get the total number of reports
	 *
	 * @param boolean $approved - Only count approved reports if true
	 * @return int
	 * return ($approved)
	 *		? ORM::factory('incident')->where('incident_active', '1')->count_all()
	 *		: ORM::factory('incident')->count_all();	
	 * @mr_k ::: se modifica esta funcion para que cuente el numero de reportes de acuerdo 
	 * a si el usuario es ips o crue
	 */

	public static function get_total_reports($approved = FALSE)
	{
		Kohana::log('debug',":::::MMM  get_total_reports (models incident)");
		//@mr_k :: se verifica el perfil del usuario crue o ips
		$user_info = self::get_user_role_and_association();

		if ($user_info['is_ips']) {
			return ($approved)
				? ORM::factory('incident')->where('user_id', $user_info['user_id'])->where('incident_active', '1')->count_all()
				: ORM::factory('incident')->where('user_id', $user_info['user_id'])->count_all();
		}

		if ($user_info['is_crue']) {
			return ($approved)
				? ORM::factory('incident')->where('crue_id', $user_info['crue_id'])->where('incident_active', '1')->count_all()
				: ORM::factory('incident')->where('crue_id', $user_info['crue_id'])->count_all();
		}

		if ($user_info['is_crue']==0 AND $user_info['is_ips']==0)
		{
			return ($approved)
	 		? ORM::factory('incident')->where('incident_active', '1')->count_all()
	 		: ORM::factory('incident')->count_all();
		}

	}



	/**
	 * Get the total number of verified or unverified reports
	 *
	 * @param boolean $verified - Only count verified reports if true, unverified if false
	 * @return int
	 */
	public static function get_total_reports_by_verified($verified = FALSE)
	{
		Kohana::log('debug',":::::MMM  get_total_reports_by_verified (models incident)");
		return ($verified)
			? ORM::factory('incident')->where('incident_verified', '1')->where('incident_active', '1')->count_all()
			: ORM::factory('incident')->where('incident_verified', '0')->where('incident_active', '1')->count_all();
	}

	/* para las AccionesIncidentes aa*/
	public static function get_total_reports_by_incident_action($incident_action = FALSE)
	{
		Kohana::log('debug',":::::MMM  get_total_reports_by_incident_action (models incident)");
		return ($incident_action)
			? ORM::factory('incident')->where('incident_action', '1')->where('incident_active', '1')->count_all()
			: ORM::factory('incident')->where('incident_action', '0')->where('incident_active', '1')->count_all();
	}
	


	/**
	 * Get the earliest report date
	 *mr_K ::: ---AKI VERFIFICAR SI EL RANGO DE TIEMPO --- 
	 * @param boolean $approved - Oldest approved report timestamp if true (oldest overall if false)
	 * @return string
	 */
	public static function get_oldest_report_timestamp($approved = TRUE)
	{
		Kohana::log('debug',":::::MMM  get_oldest_report_timestamp (models incident)");
		$result = ($approved)
			? ORM::factory('incident')->where('incident_active', '1')->orderby(array('incident_date'=>'ASC'))->find_all(1,0)
			: ORM::factory('incident')->where('incident_active', '0')->orderby(array('incident_date'=>'ASC'))->find_all(1,0);

		foreach($result as $report)
		{
			return strtotime($report->incident_date);
		}
	}

	/**
	 * Get the latest report date
	 * @return string
	 */
	public static function get_latest_report_timestamp($approved = TRUE)
	{
		Kohana::log('debug',":::::MMM  get_latest_report_timestamp (models incident)");
		$result = ($approved)
			? ORM::factory('incident')->where('incident_active', '1')->orderby(array('incident_date'=>'DESC'))->find_all(1,0)
			: ORM::factory('incident')->where('incident_active', '0')->orderby(array('incident_date'=>'DESC'))->find_all(1,0);

		foreach($result as $report)
		{
			return strtotime($report->incident_date);
		}
	}

	/**
	 * Get the number of reports by date for dashboard chart
	 *
	 * @param int $range No. of days in the past
	 * @param int $user_id
	 * @return array
	 */
	public static function get_number_reports_by_date($range = NULL, $user_id = NULL)
	{
		Kohana::log('debug',":::::MMM  get_number_reports_by_date (models incident)");
		// Table Prefix
		$table_prefix = Kohana::config('database.default.table_prefix');
		$user_info = self::get_user_role_and_association();

		// Database instance
		$db = new Database();

		$params = array();
		
		$db->select(
				'COUNT(id) as count',
				'DATE(incident_date) as date',
				'MONTH(incident_date) as month',
				'DAY(incident_date) as day',
				'YEAR(incident_date) as year'
			)
			->from('incident')
			->groupby('date')
			->orderby('incident_date', 'ASC');
		//aki se modifica el timeline
		Kohana::log('debug',"::::::::: MMMM MOSTRAR EL VALOR DEL USER_ID");
		Kohana::log('debug',$user_id);
		if ($user_info['is_ips']) {
			Kohana::log('debug',$user_info['is_ips']);
			$db->where('user_id', $user_info['user_id']);			
		}
		if ($user_info['is_crue']) {
			Kohana::log('debug',$user_info['is_crue']);
			$db->where('crue_id', $user_info['crue_id']);			
		}
		if ($user_info['is_crue']==0 AND $user_info['is_ips']==0) {
			Kohana::log('debug',"ADMIN");
			//$db->where('user_id', $user_id);
			if (!empty($user_id))
		{
			Kohana::log('debug',"::::::::: MMMM empty(user_id) USER_ID");
			$db->where('user_id', $user_id);
		}			
		}	

		/*if (!empty($user_id))
		{
			Kohana::log('debug',"::::::::: MMMM empty(user_id) USER_ID");
			$db->where('user_id', $user_id);
		}*/
		
		if (!empty($range))
		{
			// Use Database_Expression to sanitize range param
			$range_expr = new Database_Expression('incident_date  >= DATE_SUB(CURDATE(), INTERVAL :range DAY)', array(':range' => (int)$range));
			$db->where(
				$range_expr->compile()
			);
		}
		$query = $db->get();
		$result = $query->result_array(FALSE);

		$array = array();
		foreach ($result AS $row)
		{
			$timestamp = mktime(0, 0, 0, $row['month'], $row['day'], $row['year']) * 1000;
			$array["$timestamp"] = $row['count'];
		}

		return $array;
	}

	/**
	 * Gets a list of dates of all approved incidents
	 *
	 * @return array
	 */
	public static function get_incident_dates()
	{
		Kohana::log('debug',":::::MMM  get_incident_dates ********* (models incident)");
		//$incidents = ORM::factory('incident')->where('incident_active',1)->incident_date->find_all();
		$incidents = ORM::factory('incident')->where('incident_active',1)->select_list('id', 'incident_date');
		$array = array();
		foreach ($incidents as $id => $incident_date)
		{
			$array[] = $incident_date;
		}
		return $array;
	}

	/**
	 * Checks if a specified incident id is numeric and exists in the database
	 *
	 * @param int $incident_id ID of the incident to be looked up
	 * @param bool $approved Whether to include un-approved reports
	 * @return bool
	 */
	public static function is_valid_incident($incident_id, $approved = TRUE)
	{
		Kohana::log('debug',":::::MMM  is_valid_incident (models incident)");
		$where = ($approved == TRUE) ? array("incident_active" => "1") : array("id >" => 0);
		return (intval($incident_id) > 0)
			? ORM::factory('incident')->where($where)->find(intval($incident_id))->loaded
			: FALSE;
	}

	/**
	 * Gets the reports that match the conditions specified in the $where parameter
	 * The conditions must relate to columns in the incident, location, incident_category
	 * category and media tables
	 *Obtiene los informes que coinciden con las condiciones especificadas en el parámetro where
	 * Las condiciones deben estar relacionadas con las columnas de incidente, ubicación, categoría_incidente
	 * tablas de categorías y medios
	 * @param array $where List of conditions to apply to the query
	 * @param mixed $limit No. of records to fetch or an instance of Pagination
	 * @param string $order_field Column by which to order the records
	 * @param string $sort How to order the records - only ASC or DESC are allowed
	 * @return Database_Result
	 * 
	 * mr_k ::: modificado para ser consultado por datos de usuario = ips o crue
	 */
	public static function get_incidents($where = array(), $limit = NULL, $order_field = NULL, $sort = NULL, $count = FALSE)
	{
		
		Kohana::log('debug',":::::MMM  get_incidents (models incident)");
		// Get the table prefix
		$table_prefix = Kohana::config('database.default.table_prefix');

		// To store radius parameters
		$radius = array();
		$having_clause = "";
		if (array_key_exists('radius', $where))
		{
			// Grab the radius parameter
			$radius = $where['radius'];

			// Delete radius parameter from the list of predicates
			unset ($where['radius']);
		}

		// Query
		// Normal query
		if (! $count)
		{
			Kohana::log('debug',":::::MMM  Normal query       (models incident)");
			$sql = 'SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, '
				. 'i.incident_verified, i.location_id,i.incident_action, l.country_id, l.location_name, l.latitude, l.longitude ';
		}		
		// Count query
		else
		{
			Kohana::log('debug',":::::MMM   Count query   (models incident)");
			$sql = 'SELECT COUNT(DISTINCT i.id) as report_count ';
		}

		//print_r("<br>1 ++ EL VALOR DE LA CONSULTA EN EL MODELO<br>".$sql);
		
		// Check if all the parameters exist
		if (count($radius) > 0 AND array_key_exists('latitude', $radius) AND array_key_exists('longitude', $radius)
			AND array_key_exists('distance', $radius))
		{

			// Calculate the distance of each point from the starting point using Spherical Law of Cosines
			// 60 = nautical miles per degree of latitude, 1.1515 miles in every nautical mile, 1.609344 km = 1 km
			// more details about the math here: http://sgowtham.net/ramblings/2009/08/04/php-calculating-distance-between-two-locations-given-their-gps-coordinates/
			$sql .= ", ((ACOS(SIN(%s * PI() / 180) * SIN(l.`latitude` * PI() / 180) + COS(%s * PI() / 180) * "
				. "	COS(l.`latitude` * PI() / 180) * COS((%s - l.`longitude`) * PI() / 180)) * 180 / PI()) * 60 * 1.1515 * 1.609344) AS distance ";

			$sql = sprintf($sql, $radius['latitude'], $radius['latitude'], $radius['longitude']);

			// Set the "HAVING" clause
			$having_clause = "HAVING distance <= ".intval($radius['distance'])." ";
		}
		//print_r("<br>2 ++ EL VALOR DE LA CONSULTA EN EL MODELO<br>".$sql);

		$sql .=  'FROM '.$table_prefix.'incident i '
			. 'LEFT JOIN '.$table_prefix.'location l ON (i.location_id = l.id) '
			. 'LEFT JOIN '.$table_prefix.'incident_category ic ON (ic.incident_id = i.id) '
			. 'LEFT JOIN '.$table_prefix.'category c ON (ic.category_id = c.id) ';
		//print_r("<br>3 ++ EL VALOR DE LA CONSULTA EN EL MODELO<br>".$sql);

			Kohana::log('debug',":::::MMM   Check if all the parameters exist   (models incident)".$sql);
//**************************************************************************************************** */
//ESTA ENCERRADO ES MALA PRACTICA DEBE ESTAR EN EL PPAL
			//@mr_k :::  se toma el id del usuario y id de crue y se verifica su rol
			$logged_in_id = Auth::instance()->get_user()->id;
			$crue_in_id = Auth::instance()->get_user()->crue_id;
			$bandera_usr=0;
			 // Llamamos a la función del controlador helper
			// $admin_in = admin_v::getAdminPermission();
			//$admin_in =$this->auth->has_permission('admin_ui');

			$sql_ips ="SELECT role_id FROM roles_users WHERE role_id=8 and user_id=".$logged_in_id;
			$sql_crue ="SELECT role_id FROM roles_users WHERE role_id=7 and user_id=".$logged_in_id;
			$resultado_ips=Database::instance()->query($sql_ips);
			$resultado_crue=Database::instance()->query($sql_crue);
			$resultado_ips_count = count($resultado_ips);
			$resultado_crue_count = count($resultado_crue);	
//**************************************************************************************************** */
		// Check if the all reports flag has been specified
		if (array_key_exists('all_reports', $where) AND $where['all_reports'] == TRUE)
		{
			unset ($where['all_reports']);
			/*mr_k ::: comentariado como prueba  mr_k listado de los incidentes
			/* se adiciona busqueda por usuario remplazando el activo.
			$sql .= 'WHERE 1=1 ';
			*/	

			//@mr_koyote ::: se verifica si es usr ip
			if ($resultado_ips_count > 0)
			{
			$sql .= 'WHERE 1=1 AND i.user_id='.$logged_in_id.' ';
			$bandera_usr=1;
			}
			if ($resultado_crue_count > 0)
			{
			$sql .= 'WHERE  1=1 AND i.crue_id='.$crue_in_id.' ';
			$bandera_usr=1;	
			}
			if ($bandera_usr == 0)
			{
				$sql .= 'WHERE 1=1 ';	
			}
			/*if ($admin_in > 0)
			{
			$sql .= 'WHERE 1=1 ';
			}*/
			

		}
		else
		{
			/*mr_k ::: comentariado como prueba  mr_k listado de los incidentes
			/* se adiciona busqueda por usuario remplazando el activo.
			/*$sql .= 'WHERE i.incident_active = 1';*/		
			if ($resultado_ips_count > 0)
			{
				$sql .= 'WHERE  i.user_id='.$logged_in_id.' and i.incident_active = 1 ';
				$bandera_usr=1;	
			}
			if ($resultado_crue_count > 0)
			{
				$sql .= 'WHERE  i.crue_id='.$crue_in_id.' and i.incident_active = 1 ';
				$bandera_usr=1;	
			}
			if ($bandera_usr == 0)
			{
				$sql .= 'WHERE i.incident_active = 1 ';
			}
			
			
			
		}
		//print_r("<br>4 ++ EL VALOR DE LA CONSULTA EN EL MODELO<br>".$sql);

		// Check for the additional conditions for the query
		if ( ! empty($where) AND count($where) > 0)
		{
			foreach ($where as $predicate)
			{
				$sql .= 'AND '.$predicate.' ';
			}
		}

		if (isset($_GET['documento']) AND !empty($_GET['documento']))
				{	
					$mivalor=Database::instance()->escape($_GET['documento']);		
					if ( $mivalor != "('')")
					{	
					$document = Database::instance()->escape($_GET['documento']);					
					$mivalor=isset($_GET['documento']);										
					//$documento_id = 344; // ID del campo de formulario para el departamento	
					$documento_id = ORM::factory('form_field')->where('field_type','10')->find_all();
					var_dump($documento_id);
					//print_r	("EL VALOR ".$documento_id);
					$sql .= "AND i.id IN (SELECT DISTINCT incident_id FROM form_response WHERE form_field_id=346 AND form_response = $document) ";
					//$sql .= "AND i.id IN (SELECT DISTINCT incident_id FROM form_response WHERE form_field_id=344 AND form_response = $document) ";
					print_r("<br>++++++++++++++ EL VALOR DE CONSULTA ES <br>".$sql);
					}	
				}
		//print_r("<br>5 ++ EL VALOR DE LA CONSULTA EN EL MODELO<br>".$sql);		
		// Might need "GROUP BY i.id" do avoid dupes
		
		// Add the having clause
		$sql .= $having_clause;

		// Check for the order field and sort parameters
		if ( ! empty($order_field) AND ! empty($sort) AND (strtoupper($sort) == 'ASC' OR strtoupper($sort) == 'DESC'))
		{
			$sql .= 'ORDER BY '.$order_field.' '.$sort.' ';
		}
		else
		{
			$sql .= 'ORDER BY i.incident_date DESC ';
		}

		// Check if the record limit has been specified
		if ( ! empty($limit) AND is_int($limit) AND intval($limit) > 0)
		{
			$sql .= 'LIMIT 0, '.$limit;
		}
		elseif ( ! empty($limit) AND $limit instanceof Pagination_Core)
		{
			$sql .= 'LIMIT '.$limit->sql_offset.', '.$limit->items_per_page;
		}
		//print_r("<br>6 ++ EL VALOR DE LA CONSULTA EN EL MODELO<br>".$sql);

		Kohana::log('debug',":::::MMM  SQL  (models incident) ".$sql);
		
		// Event to alter SQL
		Event::run('ushahidi_filter.get_incidents_sql', $sql);

		// Kohana::log('debug', $sql);
		return Database::instance()->query($sql);
	}

	/**
	 * Gets the comments for an incident
	 * @param int $incident_id Database ID of the incident
	 * @return mixed FALSE if the incident id is non-existent, ORM_Iterator if it exists
	 */
	public static function get_comments($incident_id)
	{
		Kohana::log('debug',":::::MMM  get_comments (models incident)");
		if (self::is_valid_incident($incident_id))
		{
			$where = array(
				'comment.incident_id' => $incident_id,
				'comment_active' => '1',
				'comment_spam' => '0'
			);

			// Fetch the comments
			return ORM::factory('comment')
					->where($where)
					->orderby('comment_date', 'asc')
					->find_all();
		}
		else
		{
			return FALSE;
		}
	}

	/**
	 * Given an incident, gets the list of incidents within a specified radius
	 *
	 * @param int $incident_id Database ID of the incident to be used to fetch the neighbours
	 * @param int $distance Radius within which to fetch the neighbouring incidents
	 * @param int $num_neigbours Number of neigbouring incidents to fetch
	 * @return mixed FALSE is the parameters are invalid, Result otherwise
	 */
	public static function get_neighbouring_incidents($incident_id, $order_by_distance = FALSE, $distance = 0, $num_neighbours = 100)
	{
		Kohana::log('debug',":::::MMM  get_neighbouring_incidents (models incident)");
		if (self::is_valid_incident($incident_id))
		{
			// Get the table prefix
			$table_prefix = Kohana::config('database.default.table_prefix');

			$incident_id = (intval($incident_id));

			// Get the location object and extract the latitude and longitude
			$location = self::factory('incident', $incident_id)->location;
			$latitude = $location->latitude;
			$longitude = $location->longitude;

			// Garbage collection
			unset ($location);

			// Query to fetch the neighbour
			// 60 = nautical miles per degree of latitude, 1.1515 miles in every nautical mile, 1.609344 km = 1 km
			// more details about the math here: http://sgowtham.net/ramblings/2009/08/04/php-calculating-distance-between-two-locations-given-their-gps-coordinates/
			$sql = "SELECT DISTINCT i.*, l.`latitude`, l.`longitude`, l.location_name, "
				. "((ACOS(SIN( :lat * PI() / 180) * SIN(l.`latitude` * PI() / 180) + COS( :lat * PI() / 180) * "
				. "	COS(l.`latitude` * PI() / 180) * COS(( :lon - l.`longitude`) * PI() / 180)) * 180 / PI()) * 60 * 1.1515 * 1.609344) AS distance "
				. "FROM `".$table_prefix."incident` AS i "
				. "INNER JOIN `".$table_prefix."location` AS l ON (l.`id` = i.`location_id`) "
				. "WHERE i.incident_active = 1 "
				. "AND i.id <> :incidentid ";

			// Check if the distance has been specified
			if (intval($distance) > 0)
			{
				$sql .= "HAVING distance <= :distance ";
			}

			// If the order by distance parameter is TRUE
			if ($order_by_distance)
			{
				$sql .= "ORDER BY distance ASC ";
			}
			else
			{
				$sql .= "ORDER BY i.`incident_date` DESC ";
			}

			// Has the no. of neigbours been specified
			if (intval($num_neighbours) > 0)
			{
				$sql .= "LIMIT :limit";
			}
		
			// Event to alter SQL
			Event::run('ushahidi_filter.get_neighbouring_incidents_sql', $sql);

			// Fetch records and return
			return Database::instance()->query($sql,
				array(':lat' => $latitude, ':lon' => $longitude, ':incidentid' => $incident_id, ':limit' => (int)$num_neighbours, ':distance' => (int)$distance)
			);
		}
		else
		{
			return FALSE;
		}
	}

	/**
	 * Sets approval of an incident
	 * @param int $incident_id
	 * @param int $val Set to 1 or 0 for approved or not approved
	 * @return bool
	 */
	public static function set_approve($incident_id,$val)
	{
		Kohana::log('debug',":::::MMM  set_approve (models incident)");
		$incident = ORM::factory('incident',$incident_id);
		$incident->incident_active = $val;
		return $incident->save();
	}

	/**
	 * Sets incident as verified or not
	 * @param int $incident_id
	 * @param int $val Set to 1 or 0 for verified or not verified
	 * @return bool
	 */
	public static function set_verification($incident_id,$val)
	{
		Kohana::log('debug',":::::MMM  set_verification (models incident)");
		$incident = ORM::factory('incident',$incident_id);
		$incident->incident_verified = $val;
		return $incident->save();
	}

	public static function set_incident_action($incident_id,$val)
	{
		Kohana::log('debug',":::::MMM  set_incident_action (models incident)");
		$incident = ORM::factory('incident',$incident_id);
		$incident->incident_action = $val;
		return $incident->save();
	}

	/**
	 * Overrides the default delete method for the ORM.
	 * Deletes all other content related to the incident - performs
	 * an SQL destroy
	 */
	public function delete()
	{
		// Delete Location
		ORM::factory('location')
			->where('id', $this->location_id)
			->delete_all();

		// Delete Categories
		ORM::factory('incident_category')
		    ->where('incident_id', $this->id)
		    ->delete_all();

		// Delete Translations
		ORM::factory('incident_lang')
		    ->where('incident_id', $this->id)
		    ->delete_all();

		// Delete Photos From Directory
		$photos = ORM::factory('media')
				      ->where('incident_id', $this->id)
				      ->where('media_type', 1)
				      ->find_all();
		
		foreach ($photos as $photo)
		{
			Media_Model::delete_photo($photo->id);
		}

		// Delete Media
		ORM::factory('media')
		    ->where('incident_id', $this->id)
		    ->delete_all();

		// Delete Sender
		ORM::factory('incident_person')
		    ->where('incident_id', $this->id)
		    ->delete_all();

		// Delete relationship to SMS message
		$updatemessage = ORM::factory('message')
						     ->where('incident_id', $this->id)
						     ->find();

		if ($updatemessage->loaded)
		{
			$updatemessage->incident_id = 0;
			$updatemessage->save();
		}

		// Delete Comments
		ORM::factory('comment')
			->where('incident_id', $this->id)
			->delete_all();
			
		// Delete ratings
		ORM::factory('rating')
			->where('incident_id', $this->id)
			->delete_all();

		// Delete form responses
		ORM::factory('form_response')
			->where('incident_id', $this->id)
			->delete_all();

		$incident_id = $this->id;

		// Action::report_delete - Deleted a Report
		Event::run('ushahidi_action.report_delete', $incident_id);

		parent::delete();
	}

	/**
	 * Get url of this incident
	 * @return string
	 **/
	public function url()
	{
		return self::get_url($this);
	}
	
	/**
	 * Get url for the incident object passed
	 * @param object|int
	 * @return string
	 **/
	public static function get_url($incident)
	{
		if (is_object($incident))
		{
			$id = isset($incident->incident_id) ? $incident->incident_id : $incident->id;
		}
		elseif (intval($incident) > 0)
		{
			$id = intval($incident);
		}
		else
		{
			return false;
		}
		
		return url::site('reports/view/'.$id);
	}

	/**
	 * Overrides the default save method for the ORM.
	 * 
	 */
	public function save()
	{
		Kohana::log('debug', ":::::::: FUNCION SAVE DENTRO DEL MODEL INCIDENT ::::::::");
		Event::run('ushahidi_action.report_save', $this);		
		parent::save();
	}
	
	public function savem()
	{
		Kohana::log('debug', ":::::::: FUNCION SAVEm DENTRO DEL MODEL INCIDENT ::::::::");
		Event::run('ushahidi_action.report_save', $this);		
		parent::savem();
	}


/***
 * 
 * @mr_k se crea un nuevo getincidentes para mostrar todo
 * 
 */

public static function get_incidents_noactivos($where = array(), $limit = NULL, $order_field = NULL, $sort = NULL, $count = FALSE)
	{
		// Get the table prefix
		$table_prefix = Kohana::config('database.default.table_prefix');

		// To store radius parameters
		$radius = array();
		$having_clause = "";
		if (array_key_exists('radius', $where))
		{
			// Grab the radius parameter
			$radius = $where['radius'];

			// Delete radius parameter from the list of predicates
			unset ($where['radius']);
		}

		// Query
		// Normal query
		if (! $count)
		{
			$sql = 'SELECT DISTINCT i.id incident_id, i.incident_title, i.incident_description, i.incident_date, i.incident_mode, i.incident_active, '
				. 'i.incident_verified, i.location_id, l.country_id, l.location_name, l.latitude, l.longitude ';
		}
		// Count query
		else
		{
			$sql = 'SELECT COUNT(DISTINCT i.id) as report_count ';
		}
		
		// Check if all the parameters exist
		if (count($radius) > 0 AND array_key_exists('latitude', $radius) AND array_key_exists('longitude', $radius)
			AND array_key_exists('distance', $radius))
		{

			// Calculate the distance of each point from the starting point using Spherical Law of Cosines
			// 60 = nautical miles per degree of latitude, 1.1515 miles in every nautical mile, 1.609344 km = 1 km
			// more details about the math here: http://sgowtham.net/ramblings/2009/08/04/php-calculating-distance-between-two-locations-given-their-gps-coordinates/
			$sql .= ", ((ACOS(SIN(%s * PI() / 180) * SIN(l.`latitude` * PI() / 180) + COS(%s * PI() / 180) * "
				. "	COS(l.`latitude` * PI() / 180) * COS((%s - l.`longitude`) * PI() / 180)) * 180 / PI()) * 60 * 1.1515 * 1.609344) AS distance ";

			$sql = sprintf($sql, $radius['latitude'], $radius['latitude'], $radius['longitude']);

			// Set the "HAVING" clause
			$having_clause = "HAVING distance <= ".intval($radius['distance'])." ";
		}

		$sql .=  'FROM '.$table_prefix.'incident i '
			. 'LEFT JOIN '.$table_prefix.'location l ON (i.location_id = l.id) '
			. 'LEFT JOIN '.$table_prefix.'incident_category ic ON (ic.incident_id = i.id) '
			. 'LEFT JOIN '.$table_prefix.'category c ON (ic.category_id = c.id) ';
		
		// Check if the all reports flag has been specified
		if (array_key_exists('all_reports', $where) AND $where['all_reports'] == TRUE)
		{
			unset ($where['all_reports']);
			$sql .= 'WHERE 1=1 ';
		}
		else
		{
			$sql .= 'WHERE i.incident_active = 0 ';
		}

		// Check for the additional conditions for the query
		if ( ! empty($where) AND count($where) > 0)
		{
			foreach ($where as $predicate)
			{
				$sql .= 'AND '.$predicate.' ';
			}
		}

		// Might need "GROUP BY i.id" do avoid dupes
		
		// Add the having clause
		$sql .= $having_clause;

		// Check for the order field and sort parameters
		if ( ! empty($order_field) AND ! empty($sort) AND (strtoupper($sort) == 'ASC' OR strtoupper($sort) == 'DESC'))
		{
			$sql .= 'ORDER BY '.$order_field.' '.$sort.' ';
		}
		else
		{
			$sql .= 'ORDER BY i.incident_date DESC ';
		}

		// Check if the record limit has been specified
		if ( ! empty($limit) AND is_int($limit) AND intval($limit) > 0)
		{
			$sql .= 'LIMIT 0, '.$limit;
		}
		elseif ( ! empty($limit) AND $limit instanceof Pagination_Core)
		{
			$sql .= 'LIMIT '.$limit->sql_offset.', '.$limit->items_per_page;
		}

		// Event to alter SQL
		Event::run('ushahidi_filter.get_incidents_sql', $sql);

		// Kohana::log('debug', $sql);
		return Database::instance()->query($sql);
	}
/////// @mr_k

/***
 * 
 *  Verificar  que tipo de usuario es segun su rol (ips,crue)
 * @author    @mr_k 
 * @descripcion :se crea get_user_role_and_association para poder consultar el tipo de usuario ips o crue
 * 
 */

public static function get_user_role_and_association()
{
    $logged_in_user = Auth::instance()->get_user();
	//echo "<br>ESTE ES MI VALOR ..........".$logged_in_user;
	//exit;
    // Check if the user has the IPS role
    $sql_ips = "SELECT role_id FROM roles_users WHERE role_id = 8 AND user_id = " . $logged_in_user->id;
    $resultado_ips = Database::instance()->query($sql_ips);
    $resultado_ips_count = count($resultado_ips);

    // Check if the user has the CRUE role
    $sql_crue = "SELECT role_id FROM roles_users WHERE role_id = 7 AND user_id = " . $logged_in_user->id;
    $resultado_crue = Database::instance()->query($sql_crue);
    $resultado_crue_count = count($resultado_crue);

	

    // Return the results as an associative array
    return [
        'is_ips' => ($resultado_ips_count > 0),
        'is_crue' => ($resultado_crue_count > 0),
        'user_id' => $logged_in_user->id,
        'crue_id' => $logged_in_user->crue_id
    ];
}

}
