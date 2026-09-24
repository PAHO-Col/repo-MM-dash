<?php defined('SYSPATH') or die('No direct script access.');
/**
 * This controller is used to manage users
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

class Users_Controller extends Admin_Controller {

	private $display_roles = FALSE;

	public function __construct()
	{
		parent::__construct();

		$this->template->this_page = 'users';

		// If user doesn't have access, redirect to dashboard
		if (!$this->auth->has_permission("users"))
		{
			url::redirect(url::site() . 'admin/dashboard');
		}

		$this->display_roles = $this->auth->has_permission('manage_roles');
	}

	public function index()
	{
		$this->template->content = new View('admin/users/main');
		$this->themes->js = new View('admin/users/users_js');

		//@mr_k :: Call the get_user_role_and_association function from the Incident model
		$incident_model = ORM::factory('incident');	
		$user_role_info = $incident_model->get_user_role_and_association();			  

		// Check, has the form been submitted, if so, setup validation

		if ($_POST)
		{
			$post = Validation::factory(array_merge($_POST, $_FILES));

			// Add some filters
			$post->pre_filter('trim', TRUE);

			// As far as I know, the only time we submit a form here is to delete a user

			if ($post->action == 'd')
			{
				// We don't want to delete the first user

				if ($post->user_id_action != 1)
				{
					// Delete the user

					$user = ORM::factory('user', $post->user_id_action)->delete();

				}

				$form_saved = TRUE;
				$form_action = utf8::strtoupper(Kohana::lang('ui_admin.deleted'));
			}
		}

		// Pagination
		$pagination = new Pagination( array('query_string' => 'page', 'items_per_page' => (int)Kohana::config('settings.items_per_page_admin'), 'total_items' => ORM::factory('user')->count_all()));

		// definir donde va
		$users_query = ORM::factory('user')->orderby('name', 'asc');
		
		$superadmin_role = ORM::factory('role','superadmin');

		// Obtener el ID del usuario actual
		$logged_in_user_id = Auth::instance()->get_user()->id;


		$crue_id=$user_role_info['crue_id'];
		if ($user_role_info['is_crue']) {
			$users_query = ORM::factory('user')
				->join('crues_ips', 'LEFT')
				->on('users.crue_id', '=', 'crues_ips.Id')
				->orderby('users.name', 'asc');
		} else {
			if (!$this->auth->get_user()->has($superadmin_role)) {
				$users_query
					->where(
						"`{$this->table_prefix}users`.`id` NOT IN (
								SELECT `ru`.`user_id` FROM `{$this->table_prefix}roles` r
								INNER JOIN `{$this->table_prefix}roles_users` ru ON `ru`.`role_id` = `r`.`id`
								WHERE `r`.`name` = 'superadmin'
							)"
					);
			}
		}
		
		$users = $users_query->find_all((int) Kohana::config('settings.items_per_page_admin'), $pagination->sql_offset);
		
		
		//$users = $users_query;

		// Set the flag for displaying the roles link
		$this->template->content->display_roles = $this->display_roles;

		$this->template->content->pagination = $pagination;
		$this->template->content->total_items = $pagination->total_items;
		$this->template->content->users = $users;
	}

	/**
	 * Edit a user
	 * @param bool|int $user_id The id no. of the user
	 * @param bool|string $saved
	 * @mr_k ::: ya se habia adionado ips  ::: se continua modificando  para que salga el listado de crue
	 */
	public function edit($user_id = FALSE, $saved = FALSE)
	{
		$this->template->content = new View('admin/users/edit');
		$this->themes->js = new View('admin/users/users_js');
		$parents_arrayips = array();
		//$roles = ORM::factory('crue')->where('Id', $post->Id)->find();

		//@mr_k :: Call the get_user_role_and_association function from the Incident model
		$incident_model = ORM::factory('incident');	
		$user_role_info = $incident_model->get_user_role_and_association();			  

		//mr_k ::: se adiciona para verificar si el que crea un usuario es tipo crue y genere la lista respectiva
		if ($user_role_info['is_crue']) {
			$parents_arrayips = ORM::factory('ips')->where('crue_id', $user_role_info['crue_id'])->select_list('Id', 'nombre_ips');
		}
		else{
			$parents_arrayips = ORM::factory('ips')							
							->select_list('Id', 'nombre_ips');
		}
		
							
		$parents_arrayips[0] = "--- Selecciona una IPS ---";
		ksort($parents_arrayips);

		$parents_arraycrue = array();
		//$roles = ORM::factory('crue')->where('Id', $post->Id)->find();
		$parents_arraycrue = ORM::factory('crue')							
							->select_list('Id', 'Nombre');
							
		$parents_arraycrue[0] = "--- Selecciona una CRUE ---";
		ksort($parents_arraycrue);



		if ($user_id)
		{
			$user_exists = ORM::factory('user')->find($user_id);
			

			if ( ! $user_exists->loaded OR
					($user_exists->has( ORM::factory('role','superadmin') ) && !$this->auth->get_user()->has( ORM::factory('role','superadmin') ) )
				)
			{
				// Redirect
				url::redirect(url::site() . 'admin/users/');
			}
		}

		// Setup and initialize form field names
		$form = array('username' => '', 'name' => '', 'email' => '', 'password' => '', 'notify' => '', 'role' => '', 'crue_id' => '', 'ips_id' => '');

		$this->template->content->user_id = $user_id;

		if ($user_id == FALSE)
		{
			// Tack this on when adding a new user
			$form['password'] = '';
			$form['password_again'] = '';
		}

		// Copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";
		$user = "";

		// check, has the form been submitted, if so, setup validation
		if ($_POST)
		{
			// Get the submitted data
			$post = $_POST;
			Kohana::log('debug', ":::::::::. Valor de ips_id: " . $post['ips_id']);
			Kohana::log('debug', ":::::::::. Valor de crue_id: " . $post['crue_id']);
			if ( $post['ips_id']==0)
			{
				$post['ips_id']=$post['crue_id'];
			}
			if ( $post['crue_id']==0)
			{
				$post['crue_id']=$post['ips_id'];
			}
			// Add the user_id to the $_POST data
			$user_id = ($user_id) ? $user_id : NULL;
			$post = array_merge($post, array('user_id' => $user_id));
			Kohana::log('debug', "VALORES DE SELECT");
			

			if (User_Model::custom_validate($post))
			{
				$user = ORM::factory('user', $user_id);
				$user->name = $post->name;
				$user->email = $post->email;
				$user->notify = $post->notify;
				$user->crue_id = $post->crue_id;
				if ($user_id == NULL)
				{
					$user->password = $post->password;
				}

				// We can only set a new password if we are using the standard ORM method,
				//    otherwise it won't actually change the password used for authentication
				if (isset($post->new_password) AND Kohana::config('riverid.enable') == FALSE AND strlen($post->new_password) > 0)
				{
					$user->password = $post->new_password;
				}

				// Existing User??
				if ($user->loaded)
				{
					// Prevent modification of the main admin account username or role
					if ($user->id != 1)
					{
						$user->username = $post->username;

						// Flag if user was previously unapproved
						$previously_unapproved = FALSE;
						if (count($user->roles) == 0) $previously_unapproved = TRUE;

						// Remove Old Roles
						foreach ($user->roles as $role)
						{
							$user->remove($role);
						}

						// Add New Roles
						if ($post->role != 'none')
						{
							$user->add(ORM::factory('role', 'login'));
							$user->add(ORM::factory('role', $post->role));
							
							if ($previously_unapproved)
							{
								// Send approved email
								$this->_send_email_approved($user);
							}
						}
					}
				}
				// New User
				else
				{
					$user->username = $post->username;

					// Add New Roles
					if ($post->role != 'none')
					{
						$user->add(ORM::factory('role', 'login'));
						$user->add(ORM::factory('role', $post->role));
					}
				}
				$user->save();

				//Event for adding user admin details
				Event::run('ushahidi_action.users_add_admin', $post);

				Event::run('ushahidi_action.user_edit', $user);

				// Redirect
				url::redirect(url::site() . 'admin/users/');
			}
			else
			{
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('auth'));
				$form_error = TRUE;
			}
		}
		else
		{
			if ($user_id)
			{
				// Retrieve Current Incident
				$user = ORM::factory('user', $user_id);
				if ($user->loaded)
				{
					// Some users don't have roles so we have this "none" role
					$role = 'none';
					foreach ($user->roles as $user_role)
					{
						$role = $user_role->name;
					}

					$form = array('user_id' => $user->id, 'username' => $user->username, 'name' => $user->name, 'email' => $user->email, 'notify' => $user->notify, 'role' => $role,'crue_id' => $user->crue_id);
				}
			}
		}

		$role_array[0] = "--- Selecciona un ROL ---";
		if ($user_role_info['is_crue']) {
			$roles = ORM::factory('role')->where('id = 8')->find_all();		
		}
		else{
			$roles = ORM::factory('role')->where('id != 1')->orderby('name', 'asc')->find_all();
		}
		

		foreach ($roles as $role)
		{
			$role_array[$role->name] = utf8::strtoupper($role->name);
		}
		
		// Add one additional role for users with no role
		$role_array['none'] = utf8::strtoupper(Kohana::lang('ui_main.none'));

		$this->template->content->id = $user_id;
		$this->template->content->display_roles = $this->display_roles;
		$this->template->content->user = $user;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->parents_arrayips = $parents_arrayips;
		$this->template->content->parents_arraycrue = $parents_arraycrue;
		$this->template->content->yesno_array = array('1' => utf8::strtoupper(Kohana::lang('ui_main.yes')), '0' => utf8::strtoupper(Kohana::lang('ui_main.no')));
		$this->template->content->role_array = $role_array;
	}

	public function roles()
	{
		$this->template->content = new View('admin/users/roles');
		
		$permissions = ORM::factory('permission')->find_all()->select_list('id','name');

		$form = array('role_id' => '', 'action' => '', 'name' => '', 'description' => '', 'access_level' => '', 'permissions' => '');
		foreach($permissions as $permission)
		{
			$form[$permission] = '';
		}
		
		////echo  "<br>CONTROLADOR DE ROLES";
		//copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";

		// check, has the form been submitted, if so, setup validation
		//////echo   "<br>compruebe si se ha enviado el formulario, si es así, configure la validación";
		if ($_POST)
		{
			//////echo   "<br>SE INGRESA AL IF _POST";
			$post = Validation::factory($_POST);

			//  Add some filters
			$post->pre_filter('trim', TRUE);

			if ($post->action == 'a')// Add / Edit Action
			{
				//////echo   "<br>SE INGRESA AL IF post->action == a";
				$post->add_rules('name', 'required', 'length[3,30]', 'alpha_numeric');
				$post->add_rules('description', 'required', 'length[3,100]');
				$post->add_rules('access_level', 'required', 'between[0,100]', 'numeric');
				$post->add_rules('permissions[]', 'numeric');

				if ($post->role_id == "3" || $post->role_id == "1" || $post->role_id == "4")
				{
					$post->add_error('name', 'nomodify');
				}

				// Unique Role Name
				////echo  "<br>VALOR DE Unique Role Name post->role_id::: ".$post->role_id;
				$post->role_id == '' ? $post->add_callbacks('name', array($this, 'role_exists_chk')) : '';
				////echo  "<br>VALOR DE Unique Role Name post->role_id::: ".$post->role_id;
			}

			if ($post->validate())
			{
				////echo  "<br>SE INGRESA AL IF post->validate()";
				$role = ORM::factory('role', $post->role_id);
				////echo  "<br>VALOR DE ROLE :::".$role;
				////echo  "<br>VALOR DE LA ACCION :::".$post->action;
				if ($post->action == 'a')// Add/Edit Action
				{
					// Remove non-existant permissions
					$perm_ids = array_keys($permissions);
					foreach ($post->permissions as $k => $perm)
					{
						if (! in_array($perm, $perm_ids))
						{
							unset($post->permissions[$k]);
						}
					}

					$role->name = $post->name;
					$role->description = $post->description;
					$role->access_level = $post->access_level;
					$role->permissions = array_unique($post->permissions);
					$role->save();

					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.added_edited'));
				}
				elseif ($post->action == 'd')// Delete Action
				{
					if ($post->role_id != 1 AND $post->role_id != 2 AND $post->role_id != 3)
					{
						// Delete the role
						$role->delete();
					}

					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.deleted'));
				}
			}
			else
			{
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('roles'));
				$form_error = TRUE;
			}
		}
		////echo  "<br>FIN DEL IF _POST Y SEGUE LOS ENVIO A LA VIEW";
		$roles = ORM::factory('role')->where('id != 1')->orderby('access_level', 'desc')->find_all();

		$this->template->content->display_roles = $this->display_roles;
		$this->template->content->roles = $roles;
		$this->template->content->permissions = $permissions;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->form_action = $form_action;
		$this->themes->js = new View('admin/users/roles_js');
	}

	/**
	 * Checks if username already exists.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function username_exists_chk(Validation $post)
	{
		$users = ORM::factory('user');
		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('username', $post->errors()))
			return;

		if ($users->username_exists($post->username))
			$post->add_error('username', 'exists');
	}

	/**
	 * Checks if email address is associated with an account.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function email_exists_chk(Validation $post)
	{
		$users = ORM::factory('user');
		if (array_key_exists('email', $post->errors()))
			return;

		if ($users->email_exists($post->email))
			$post->add_error('email', 'exists');
	}

	/**
	 * Checks if role already exists.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function role_exists_chk(Validation $post)
	{
		////echo  "<br>SE INGRESA A LA VALIDACION role_exists_chk";
		//debug_print_backtrace()
		$roles = ORM::factory('role')->where('name', $post->name)->find();

		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('name', $post->errors()))
			return;

		if ($roles->loaded)
		{
			$post->add_error('name', 'exists');
		}
	}

	/**
	 * Sends an email for admin approval
	 */
	private function _send_email_approved($user)
	{
		// Check if we require users to go through this process
		if (! Kohana::config('settings.manually_approve_users'))
		{
			return FALSE;
		}

		$url = url::site('login');

		$to = $user->email;
		$from = array(Kohana::config('settings.site_email'), Kohana::config('settings.site_name'));
		$subject = Kohana::config('settings.site_name').' '.Kohana::lang('ui_main.login_signup_approval_subject');
		$message = Kohana::lang('ui_main.login_signup_approval_message',
			array(Kohana::config('settings.site_name'), $url));

		email::send($to, $from, $subject, $message, FALSE);

		return TRUE;
	}


	/*	
	Se crea la funcion crue
	@mr_k	
	*/
	public function crue()
	{
		$this->template->content = new View('admin/users/crue');
		$this->template->content->display_roles = $this->display_roles;
		
	    
		$form = array('Id' => '', 'action' => '', 'Nombre' => '', 'Descripcion' => '');
		////echo  "<BR>INGRESE loscrues";
		
		//print_r($loscrues);
		////echo  "<BR>FIN INGRESE IPS loscrues";
		//copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";
		
		// check, has the form been submitted, if so, setup validation
		
		//print_r($_POST); 
		if ($_POST)
		{
			////echo  "<BR>INGRESE EN EL IF _POST";
			$post = Validation::factory($_POST);

			//  Add some filters
			$post->pre_filter('trim', TRUE);

			if ($post->action == 'a')// Add / Edit Action
			{
				////echo  "<br>SE INGRESA AL IF post->action == a";
				//$post->add_rules('Nombre', 'required', 'length[3,30]', 'alpha_numeric');
				//$post->add_rules('Descripcion', 'required', 'length[3,100]', 'alpha_numeric');
				$post->add_rules('Nombre', 'required', 'length[3,30]');
				$post->add_rules('Descripcion', 'required', 'length[3,100]');
				
				
			}
			////echo  "<br>VALOR DEL ID ::: ".$post->crue_id;
			if ($post->validate())
			{
				////echo  "<br>SE INGRESA AL IF post->validate()";
				$crue = ORM::factory('crue', $post->crue_id);
				////echo  "<br>".$crue->Id;
				//////echo  "<br>VALOR DE ROLE :::".$crue;
				if ($post->action == 'a')// Add/Edit Action
				{
					
					////echo  "<br>EL VALOR DE post->action == a :::".$post->action;
					////echo  "<br>EL VALOR DE post->crue_id == a :::".$post->crue_id;
					////echo  "<br>EL VALOR DE post->crue_id == a :::".$post->Nombre;
					////echo  "<br>EL VALOR DE post->crue_id == a :::".$post->crue_id;
					$crue->Nombre = $post->Nombre;
					$crue->Descripcion = $post->Descripcion;
					////echo  "<br>SIGUE EL save()";					
					$crue->save();

					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.added_edited'));
				}
				elseif ($post->action == 'd')// Delete Action
				{
					$crue->delete();
					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.deleted'));
				}
			}
			else
			{
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('crues'));
				$form_error = TRUE;
			}
			// Redirect
			//url::redirect(url::site() . 'admin/users/crue');
		}
		
		//@mr_k ::: se toma el listado de crue
		$loscrues = Crue_Model::get_crues();
		$this->template->content->crues = $loscrues;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->form_action = $form_action;
		$this->themes->js = new View('admin/users/crue_js');
	}

	/**
	 * @mr_k :::: validacion si id crue existe
	 * Checks if crue already exists.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function crue_exists_chk(Validation $post)
	{
		$roles = ORM::factory('crues')->where('Id', $post->Id)->find();

		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('Id', $post->errors()))
			return;

		if ($roles->loaded)
		{
			$post->add_error('Id', 'exists');
		}
	}

	/*	
	Se crea la funcion IPS  Que es para la creacion y edicion
	@mr_k	
	*/
	public function ips()
	{
		$this->template->content = new View('admin/users/ips');
		$this->template->content->display_roles = $this->display_roles;
		$parents_arraycrue = array();
		
		//$roles = ORM::factory('crue')->where('Id', $post->Id)->find();
		
		//@mr_k :: el array del select 
		$parents_arraycrue = ORM::factory('crue')							
							->select_list('Id', 'Nombre');							
		$parents_arraycrue[0] = "--- Selecciona un CRUE ---";
		ksort($parents_arraycrue);
		
	    //@mr_k ::: se toma el listado de ips
		//$losipss = ips_Model::get_ipss();		
		$form = array('Id' => '', 'action' => '', 'crue_id' => '', 'nombre_ips' => '', 'descripcion' => '');
		
		//print_r($losipss);
		////echo  "<BR> INGRESE IPS losipss";
		//copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";
		
		// check, has the form been submitted, if so, setup validation
		
		//print_r($_POST); 
		if ($_POST)
		{
			////echo  "<BR>INGRESE EN EL IF _POST";
			$post = Validation::factory($_POST);

			//  Add some filters
			$post->pre_filter('trim', TRUE);

			if ($post->action == 'a')// Add / Edit Action
			{
				////echo  "<br>SE INGRESA AL IF post->action == a";
				
				$post->add_rules('nombre_ips', 'required', 'length[3,30]');
				$post->add_rules('descripcion', 'required', 'length[3,100]');
				$post->add_rules('crue_id', 'required');
				
				
			}
			////echo  "<br>VALOR DEL ID ::: ".$post->ips_id;
			if ($post->validate())
			{
				////echo  "<br>SE INGRESA AL IF post->validate()";
				$ips = ORM::factory('ips', $post->ips_id);
				////echo  "<br>".$post->ips_id;
				Kohana::log('debug', ":::::::::. Valor de ips_id: " );
				
				
				if ($post->action == 'a')// Add/Edit Action
				{
					Kohana::log('debug', ":::::::::. post->action == 'a': ");
					//echo  "<br>EL VALOR DE post->action == a :::".$post->action;
					//echo  "<br>EL VALOR DE post->ips_id == a :::".$post->ips_id;
					//echo  "<br>EL VALOR DE post->ips_id == a :::".$post->nombre_ips;
					//echo  "<br>EL VALOR DE post->ips_id == a :::".$post->crue_id;
					$ips->nombre_ips = $post->nombre_ips;
					$ips->descripcion = $post->descripcion;
					$ips->crue_id = $post->crue_id;
					//echo  "<br>SIGUE EL save()";					
					$ips->save();

					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.added_edited'));
				}
				elseif ($post->action == 'd')// Delete Action
				{

					$ips->delete();
					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.deleted'));
				}
				////echo  "<br>VALOR DE ROLE :::".$ips;
			}
			else
			{
				////echo  "<br> ESTOY EN ELSE";
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('ipss'));
				$form_error = TRUE;
			}
			//url::redirect(url::site() . 'admin/users/ips');
		}
		////echo "<BR>FINAL DEL ARCHIVO";
		//@mr_k ::: se toma el listado de ips
		$losipss = ips_Model::get_ipss();
		$this->template->content->ipss = $losipss;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->form_action = $form_action;
		$this->template->content->parents_arraycrue = $parents_arraycrue;
		$this->themes->js = new View('admin/users/ips_js');
	}

	/**
	 * @mr_k :::: validacion si id ips existe
	 * Checks if ips already exists.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function ips_exists_chk(Validation $post)
	{
		$roles = ORM::factory('crues_ips')->where('Id', $post->Id)->find();

		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('Id', $post->errors()))
			return;

		if ($roles->loaded)
		{
			$post->add_error('Id', 'exists');
		}
	}


}
