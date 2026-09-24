<?php
/*
*@mr_koyote ::: se modifica este hooks. en las consultas enfocandolas en el esquema de usuario.
*se modifica la funcion block() y se adiciona la referencia del usuario para no mostrar todos los 
*si no solo los de el.
consulta remplazada.
$content->incidents = ORM::factory('incident')
			->with('location')
			->where('incident_active', '1')
			->limit('10')
			->orderby('incident_date', 'desc')
			->find_all();
*/
?>
<?php defined('SYSPATH') or die('No direct script access.');

class reports_block {

	public function __construct()
	{
		$block = array(
			"classname" => "reports_block",
			"name" => "Reports",
			"description" => "List the 10 latest reports in the system"
		);

		blocks::register($block);
	}

	public function block()
	{
		$content = new View('blocks/main_reports');
		//@mr_k :: tomar informacion de roles desde el modelo incident
		$incident_model = ORM::factory('incident');
		$superadmin_role = ORM::factory('role','superadmin');
		$admin_role = ORM::factory('role','Administrador');
		//$admin_in =$this->auth->get_user()->has( $admin_role );	
		$admin_in =Auth::instance()->get_user()->has( $admin_role );
		//$superadmin_in =$this->auth->get_user()->has( $superadmin_role );
		$superadmin_in =Auth::instance()->get_user()->has( $superadmin_role );
		//@mr_k :: Call the get_user_role_and_association function from the Incident model
		$user_role_info = $incident_model->get_user_role_and_association();		
		//@mr_k ::: se inicia validacion por el perfil de usuario.
		if ($user_role_info['is_ips']) {
			// User has IPS role
			$content->incidents = ORM::factory('incident')
			->with('location')
			->where('incident_active', '1')
			->where('user_id', $user_role_info['user_id'])
			->limit('10')
			->orderby('incident_date', 'desc')
			->find_all();
		}
		if ($user_role_info['is_crue']) {
			// User has CRUE role			
			$content->incidents = ORM::factory('incident')
			->with('location')
			->where('incident_active', '1')
			->where('crue_id', $user_role_info['crue_id'])
			->limit('10')
			->orderby('incident_date', 'desc')
			->find_all();
		}		
		//if (Auth::instance()->get_user()->has( $superadmin_role )==3 o)
		if ($admin_in==5 || $superadmin_in==3)
		{
			$content->incidents = ORM::factory('incident')
			->with('location')
			->where('incident_active', '1')
			->limit('10')
			->orderby('incident_date', 'desc')
			->find_all();
		}
		echo $content;
	}
}

new reports_block;


class news_block {

	public function __construct()
	{
		$block = array(
			"classname" => "news_block",
			"name" => "Main Stream News",
			"description" => "List the 10 latest news items from available news feeds"
		);

		blocks::register($block);
	}

	public function block()
	{
		$content = new View('blocks/main_news');
		// Get RSS News Feeds
		$content->feeds = ORM::factory('feed_item')
			->with('feed')
			->limit('10')
			->orderby('item_date', 'desc')
			->find_all();

		echo $content;
	}
}

new news_block;