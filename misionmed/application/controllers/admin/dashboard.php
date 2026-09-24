<?php defined('SYSPATH') or die('No direct script access.');
/**
 * This controller is used for the main Admin panel
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi - http://source.ushahididev.com
 * @subpackage Admin
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */

class Dashboard_Controller extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();
	}

	//@mr_k :: Modificado todo el index acorde al sistema de roles de ips y crue
	// se adiciona la configuracion de jerarquia de usuario
 	public function index()
	{		
		// Don't show auto-upgrader when disabled.
		if (Kohana::config('config.enable_auto_upgrader') AND Kohana::config('version.ushahidi_db_version') > Kohana::config('settings.db_version'))
		{
			url::redirect('admin/upgrade/database');
		}
		
		$this->template->content = new View('admin/dashboard/main');
		$this->template->content->title = Kohana::lang('ui_admin.dashboard');
		$this->template->this_page = 'dashboard';
		/******************************************************************************/
		//@mr_k :: tomar informacion de roles desde el modelo incident
		$incident_model = ORM::factory('incident');	

		//@mr_k :: tomar informacion de roles desde el modelo role
		$admin_role = ORM::factory('role','Administrador');			
		$superadmin_role = ORM::factory('role','superadmin');
		$user_role_info = $incident_model->get_user_role_and_association();	

		//@mr_k :: tomo el valor para verificar si el usuario es admin
		$admin_in =$this->auth->get_user()->has( $admin_role );	
		$superadmin_in =$this->auth->get_user()->has( $superadmin_role );	
		
	
		
		// Database instance
		$db = new Database();
			
		//@mr_k :: Conteos del panel Total de registros depende el usuario : 
		//pendiente las categorias, location, 
		//Retrieve Dashboard Count...		
		if ($user_role_info['is_ips']) {
			// Total Reports  
			$this->template->content->reports_total = ORM::factory('incident')->where('user_id', $user_role_info['user_id'])->count_all();			
			// Total Unapproved Reports
			$this->template->content->reports_unapproved = ORM::factory('incident')->where('user_id',$user_role_info['user_id'])->where('incident_active', '0')->count_all();
			// Total Unverified Reports			
			$this->template->content->reports_unverified = ORM::factory('incident')->where('user_id',$user_role_info['user_id'])->where('incident_verified', '0')->count_all();
			// Total unAccion Reports			
			$this->template->content->reports_unaction = ORM::factory('incident')->where('user_id',$user_role_info['user_id'])->where('incident_action', '0')->count_all();
			// Total Categories
			$this->template->content->categories = ORM::factory('category')->count_all();
			//definir si esta nos sirve para las categorias determinar ahora
			$user_id = 25;
			/*$db->select(array(('COUNT(DISTINCT ic.category_id)'), 'category_count'))
				->from(array('incident_category', 'ic'))
				->join(array('incident', 'i'))->on('ic.incident_id', '=', 'i.id')
				->where('i.user_id', '=', $user_id)
				->execute()
				->get('category_count');
				$query = $db->get();
				*/
				/*
				$this->template->content->categories = $db->select(array(('COUNT(DISTINCT ic.category_id)'), 'category_count'))
				->from(array('incident_category', 'ic'))
				->join(array('incident', 'i'), 'LEFT')->on('ic.incident_id',  'i.id')
				->where('i.user_id',  $user_id)
				->execute()
				->get('category_count');
				*/

				//$this->template->content->categories = $count;
				// $count ahora contiene el número de categorías que tiene el usuario con ID 25


//			$this->template->content->categories = ORM::Factory('category')->join('incident_category', 'incident.category_id', 'incident_category.category.id')->where('incident.user_id', $user_role_info['user_id'])->count_all();
			// Total Locations
			$this->template->content->locations = ORM::factory('location')->count_all();
			// Total Incoming Media
			$this->template->content->incoming_media = ORM::factory('feed_item')->count_all();
			// Get reports for display	
			$incidents = ORM::factory('incident')->where('user_id',$user_role_info['user_id'])->limit(5)->orderby('incident_dateadd', 'DESC')->find_all();
		}

		if ($user_role_info['is_crue']) {
			// Total Reports  
			$this->template->content->reports_total = ORM::factory('incident')->where('crue_id', $user_role_info['crue_id'])->count_all();			
			// Total Unapproved Reports
			$this->template->content->reports_unapproved = ORM::factory('incident')->where('crue_id',$user_role_info['crue_id'])->where('incident_active', '0')->count_all();		
			// Total Unverified Reports
			$this->template->content->reports_unverified = ORM::factory('incident')->where('crue_id',$user_role_info['crue_id'])->where('incident_verified', '0')->count_all();
			// Total unAccion Reports			
			$this->template->content->reports_unaction = ORM::factory('incident')->where('user_id',$user_role_info['crue_id'])->where('incident_action', '0')->count_all();
			// Total Categories
			$this->template->content->categories = ORM::factory('category')->count_all();
			// Total Locations
			$this->template->content->locations = ORM::factory('location')->count_all();
			// Total Incoming Media
			$this->template->content->incoming_media = ORM::factory('feed_item')->count_all();
			// Get reports for display	
			$incidents = ORM::factory('incident')->where('crue_id',$user_role_info['crue_id'])->limit(5)->orderby('incident_dateadd', 'DESC')->find_all();	

		}
		
		if ($admin_in==5 || $superadmin_in==3)
		{
			// Total de reportes	
			$this->template->content->reports_total = ORM::factory('incident')->count_all();	
			// Total Unapproved Reports
			$this->template->content->reports_unapproved = ORM::factory('incident')->where('incident_active', '0')->count_all();					
			// Total Unverified Reports
			$this->template->content->reports_unverified = ORM::factory('incident')->where('incident_verified', '0')->count_all();	
			// Total unAccion Reports			
			$this->template->content->reports_unaction = ORM::factory('incident')->where('incident_action', '0')->count_all();
			
			// Total Categories
			$this->template->content->categories = ORM::factory('category')->count_all();
			// Total Locations
			$this->template->content->locations = ORM::factory('location')->count_all();
			// Total Incoming Media
			$this->template->content->incoming_media = ORM::factory('feed_item')->count_all();	
			// Get reports for display	
			$incidents = ORM::factory('incident')->limit(5)->orderby('incident_dateadd', 'DESC')->find_all();
		}
//********************************************************************************************* */
// mr_k ::: Obtener el conteo de respuestas por departamento
$query = "SELECT d.nombre, COUNT(fr.form_response) AS total
          FROM form_response fr
          JOIN form_field ff ON fr.form_field_id = ff.id
          JOIN departamentos d ON fr.form_response = d.Id
          WHERE ff.field_type = 10
          GROUP BY fr.form_response, d.nombre
          ORDER BY total DESC;";

$departamentos_count = Database::instance()->query($query);



	// Pasar los resultados a la vista
	$this->template->content->departamentos_count = $departamentos_count;

// mr_k ::: Obtener el conteo de respuestas por municipios
$query = "SELECT d.nombre, COUNT(fr.form_response) AS total
          FROM form_response fr
          JOIN form_field ff ON fr.form_field_id = ff.id
          JOIN municipios d ON fr.form_response = d.Id
          WHERE ff.field_type = 11
          GROUP BY fr.form_response, d.nombre
          ORDER BY total DESC;";

$municipios_count = Database::instance()->query($query);



	// Pasar los resultados a la vista
	$this->template->content->municipios_count = $municipios_count;


/********************************************************************************************************** */
		// Messages By Service
		$total_message_count = 0;
		$message_services = array();
		$services = ORM::factory('service')->find_all();

		foreach ($services as $service)
		{
			$message_count = ORM::factory('message')
							->join('reporter','message.reporter_id','reporter.id')
							->where('service_id', $service->id)
							->where('message_type', '1')
							->count_all();

			$message_services[] = array(
				'id'    => $service->id,
				'name'  => $service->service_name,
				'count' => $message_count
			);

			$total_message_count += $message_count;
		}

		$this->template->content->message_services = $message_services;

		// Total Messages
		$this->template->content->message_count = $total_message_count;

		//@mr_k :: incidentes a mostrar			
		$this->template->content->incidents = $incidents;

		// Get Incoming Media (We'll Use NewsFeeds for now)
		$this->template->content->feeds = ORM::factory('feed_item')
											->limit('3')
											->orderby('item_date', 'desc')
											->find_all();

		// Javascript Header
		$this->themes->protochart_enabled = TRUE;
		$this->themes->js = new View('admin/stats/stats_js');

		$this->template->content->failure = '';

		// Build dashboard chart

		// Set the date range (how many days in the past from today?)
		// Default to all time if not set
		$range = (!empty($_GET['range']))
			? $_GET['range']
			: 0;
		
		$incident_data = Incident_Model::get_number_reports_by_date($range);
		$data = array('Reports'=>$incident_data);
		$options = array('xaxis'=>array('mode'=>'"time"'));
		
		$this->template->content->report_chart = protochart::chart('report_chart', $data, $options, 
		    array('Reports'=>'CC0000'), 410, 310);
		
		// Render version sync checks if enabled
		$this->template->content->version_sync = NULL;
		if (Kohana::config('config.enable_ver_sync_warning') == TRUE)
		{
			$this->template->content->version_sync = View::factory('admin/version_sync');
		}
		
		// Render security checks if enabled
		$this->template->content->security_info = NULL;
		if (Kohana::config('config.enable_security_info') == TRUE)
		{
			$this->template->content->security_info = View::factory('admin/security_info');
		}
		
	}
}
?>
