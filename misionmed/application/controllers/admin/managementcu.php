<?php defined('SYSPATH') or die('No direct script access.');
/**
 * This controller is used to manage cars
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

class Managementcu_Controller extends Admin_Controller {

	private $display_roles = FALSE;

	public function __construct()
	{
		parent::__construct();

		$this->template->this_page = 'managementcu';

		// If user doesn't have access, redirect to dashboard
		if (!$this->auth->has_permission("managementcu"))
		{
			url::redirect(url::site() . 'admin/dashboard');
		}

		
	}

	public function index()
	{
		$this->template->content = new View('admin/managementcu/main');
		
		
	}

	/*	
	Se crea la funcion cars  Que es para la creacion y edicion
	@mr_k	
	*/
	public function cars()
	{
		$this->template->content = new View('admin/managementcu/cars');
		
		$this->template->content->display_roles = $this->display_roles;
		
		$parents_arraytipoemp = array();
		$parents_arraytipoemp[] = "--- Selecciona ---";
		$parents_arraytipoemp[] = "Publica";
		$parents_arraytipoemp[] = "Privada";
		$parents_arrayperfinsti= array();
		$parents_arrayperfinsti[] = "--- Selecciona ---";
		$parents_arrayperfinsti[] = "Asistencial";
		$parents_arrayperfinsti[] = "Promocion y Prevencion";
		$parents_arrayperfinsti[] = "Translado";
		$parents_arrayperfinsti[] = "Otro";
		
		
	    
		$form = array('Id' => '', 'action' => '', 'placa_cars' => '', 'descripcion' => '', 'marca_cars' => '', 'modelo_cars' => '', 'nombre_prestador_servicio' => '', 'tipo_empresa' => '', 'direccion_prestardor_servicio' => '', 'telefono_prestador_servicio' => '', 'perfil_institucional' => ''	, 'otro_perfil_institucional' => '', 'nombre_representante_legal' => '', 'correo_representante_legal' => '', 'cargo_representante_legal' => '');

		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";
		
		// check, has the form been submitted, if so, setup validation
				
		if ($_POST)
		{
		
			$post = Validation::factory($_POST);

			//  Add some filters
			$post->pre_filter('trim', TRUE);

			if ($post->action == 'a')// Add / Edit Action
			{
				
				
				$post->add_rules('placa_cars', 'required', 'length[1,30]');
				$post->add_rules('descripcion', 'required', 'length[1,100]');
				$post->add_rules('marca_cars', 'required', 'length[1,100]');
				$post->add_rules('modelo_cars', 'required', 'length[1,100]');
				$post->add_rules('nombre_prestador_servicio', 'required', 'length[1,100]');
				$post->add_rules('tipo_empresa', 'required', 'length[1,100]');
				$post->add_rules('direccion_prestardor_servicio', 'required', 'length[1,100]');
				$post->add_rules('telefono_prestador_servicio', 'required', 'length[1,100]');
				$post->add_rules('perfil_institucional', 'required', 'length[1,100]');
				
				$post->add_rules('nombre_representante_legal', 'required', 'length[1,100]');
				$post->add_rules('correo_representante_legal', 'required', 'length[1,100]');
				$post->add_rules('cargo_representante_legal', 'required', 'length[1,100]');
				
				
				
				
			}
			//echo  "<br>VALOR DEL ID ::: ".$post->cars_id;
			if ($post->validate())
			{
				
				$cars = ORM::factory('cars', $post->cars_id);
				
				if ($post->action == 'a')// Add/Edit Action
				{
					
					$cars->placa_cars = $post->placa_cars;
					$cars->descripcion = $post->descripcion;
					$cars->marca_cars = $post->marca_cars;
					$cars->modelo_cars = $post->modelo_cars;
					$cars->nombre_prestador_servicio = $post->nombre_prestador_servicio;
					$cars->tipo_empresa = $post->tipo_empresa;
					$cars->direccion_prestardor_servicio = $post->direccion_prestardor_servicio;
					$cars->telefono_prestador_servicio = $post->telefono_prestador_servicio;
					$cars->perfil_institucional = $post->perfil_institucional;
					$cars->otro_perfil_institucional = $post->otro_perfil_institucional;
					$cars->nombre_representante_legal = $post->nombre_representante_legal;
					$cars->correo_representante_legal = $post->correo_representante_legal;
					$cars->cargo_representante_legal = $post->cargo_representante_legal;
					$cars->fechainicial = $post->fechainicial;
					$cars->fechafinal = $post->fechafinal;
					
					
					$cars->save();
					
					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.added_edited'));
				}
				elseif ($post->action == 'd')// Delete Action
				{
					$cars->delete();
					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.deleted'));
				}
			
			}
			else
			{
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('cars'));
				$form_error = TRUE;
			}			
		}
		
		//@mr_k ::: se toma el listado de cars
		$loscarss = Cars_Model::get_manager_cars();		

		$this->template->content->carss = $loscarss;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->form_action = $form_action;		
		$this->template->content->parents_arraytipoemp = $parents_arraytipoemp;
		$this->template->content->parents_arrayperfinsti = $parents_arrayperfinsti;
		$this->themes->js = new View('admin/managementcu/cars_js');
		
	}
	public function persons()
	{		
		$this->template->content = new View('admin/managementcu/persons');		
		$this->template->content->display_roles = $this->display_roles;
		$parents_arraytipoemp = array();
		$parents_arraytipoemp[] = "--- Selecciona ---";
		$parents_arraytipoemp[] = "Publica";
		$parents_arraytipoemp[] = "Privada";
		$parents_arrayperfinsti= array();
		$parents_arrayperfinsti[] = "--- Selecciona ---";
		$parents_arrayperfinsti[] = "Asistencial";
		$parents_arrayperfinsti[] = "Promocion y Prevencion";
		$parents_arrayperfinsti[] = "Translado";
		$parents_arrayperfinsti[] = "Otro";
				
		$form = array('Id' => '', 'action' => '', 'nombre_persons' => '', 'Cargo' => '', 'documento_persons' => '','nombre_prestador_servicio' => '','tipo_empresa' => '','direccion_prestardor_servicio' => '','telefono_prestador_servicio' => '','perfil_institucional' => '','otro_perfil_institucional' => '','nombre_representante_legal' => '','correo_representante_legal' => '','cargo_representante_legal' => '');
	
		
		//copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";
		
		// check, has the form been submitted, if so, setup validation
	
		if ($_POST)
		{
	
			$post = Validation::factory($_POST);
	
			//  Add some filters
			$post->pre_filter('trim', TRUE);

			if ($post->action == 'a')// Add / Edit Action
			{
				
				$post->add_rules('nombre_persons', 'required', 'length[1,30]');
				$post->add_rules('Cargo', 'required', 'length[1,100]');
				$post->add_rules('documento_persons', 'required', 'length[1,100]');
				$post->add_rules('nombre_prestador_servicio', 'required', 'length[1,100]');
				$post->add_rules('tipo_empresa', 'required', 'length[0,100]');
				$post->add_rules('direccion_prestardor_servicio', 'required', 'length[1,100]');
				$post->add_rules('telefono_prestador_servicio', 'required', 'length[1,100]');
				$post->add_rules('perfil_institucional', 'required', 'length[0,100]');
				$post->add_rules('otro_perfil_institucional', 'required', 'length[1,100]');
				$post->add_rules('nombre_representante_legal', 'required', 'length[1,100]');
				$post->add_rules('correo_representante_legal', 'required', 'length[1,100]');
				$post->add_rules('cargo_representante_legal', 'required', 'length[1,100]');		
				
				
			}

			if ($post->validate())
			{
			
				$persons = ORM::factory('persons', $post->persons_id);
			
				if ($post->action == 'a')// Add/Edit Action
				{
					$persons->nombre_persons = $post->nombre_persons;
					$persons->Cargo = $post->Cargo;
					$persons->documento_persons = $post->documento_persons;
					$persons->nombre_prestador_servicio = $post->nombre_prestador_servicio;
					$persons->tipo_empresa = $post->tipo_empresa;
					$persons->direccion_prestardor_servicio = $post->direccion_prestardor_servicio;
					$persons->telefono_prestador_servicio = $post->telefono_prestador_servicio;
					$persons->perfil_institucional = $post->perfil_institucional;
					$persons->otro_perfil_institucional = $post->otro_perfil_institucional;
					$persons->nombre_representante_legal = $post->nombre_representante_legal;
					$persons->correo_representante_legal = $post->correo_representante_legal;
					$persons->cargo_representante_legal = $post->cargo_representante_legal;
					
					$persons->save();
					$form_saved = TRUE;						
					$form_action = strtoupper(Kohana::lang('ui_admin.added_edited'));
				}
				elseif ($post->action == 'd')// Delete Action
				{
				
					$persons->delete();
					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.deleted'));
				}					
			}
			else
			{
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('persons'));
				$form_error = TRUE;				
			}			
		}
		
	    //@mr_k ::: se toma el listado de persons
		$lospersonss = Persons_Model::get_manager_persons();

		$this->template->content->personss = $lospersonss;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->form_action = $form_action;
		$this->template->content->parents_arraytipoemp = $parents_arraytipoemp;
		$this->template->content->parents_arrayperfinsti = $parents_arrayperfinsti;
		
		$this->themes->js = new View('admin/managementcu/persons_js');
	}


	/*	
	Se crea la funcion cainstalacion  Que es para la creacion y edicion
	@mr_k	
	*/
	public function instalacion()
	{
		$this->template->content = new View('admin/managementcu/instalacion');
		$this->template->content->display_roles = $this->display_roles;
		$parents_arraytipoemp = array();
		$parents_arraytipoemp[] = "--- Selecciona ---";
		$parents_arraytipoemp[] = "Publica";
		$parents_arraytipoemp[] = "Privada";
		$parents_arrayperfinsti= array();
		$parents_arrayperfinsti[] = "--- Selecciona ---";
		$parents_arrayperfinsti[] = "Asistencial";
		$parents_arrayperfinsti[] = "Promocion y Prevencion";
		$parents_arrayperfinsti[] = "Translado";
		$parents_arrayperfinsti[] = "Otro";
		
		//Kohana::log('debug', ":::::::::. Valor de instalacion_id: " );
		
	    
		$form = array('Id' => '', 'action' => '', 'institucionsolicitante' => '', 'ubicacion_emblema' => '','nombre_prestador_servicio' => '','tipo_empresa' => '','direccion_prestardor_servicio' => '','telefono_prestador_servicio' => '','perfil_institucional' => '','otro_perfil_institucional' => '','nombre_representante_legal' => '','correo_representante_legal' => '','cargo_representante_legal' => '','instalacion_id_action'=>'');
		
		//Kohana::log('debug', "::::::::::::::: VALOR LOSINSTALACION");
		//Kohana::log('debug', $losinstalacion);

		////print_r($losinstalacion);
		////echo "<BR> INGRESE instalacion losinstalacion";
		//copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = FALSE;
		$form_action = "";
		
		// check, has the form been submitted, if so, setup validation
		
		////print_r($_POST); 
		if ($_POST)
		{
			////echo "<BR>INGRESE EN EL IF _POST";
			$post = Validation::factory($_POST);

			//  Add some filters
			$post->pre_filter('trim', TRUE);

			if ($post->action == 'a')// Add / Edit Action
			{
				////echo "<br>SE INGRESA AL IF post->action == a";
				
				$post->add_rules('institucionsolicitante', 'required', 'length[1,30]');
				$post->add_rules('ubicacion_emblema', 'required', 'length[1,100]');
				$post->add_rules('nombre_prestador_servicio', 'required', 'length[1,30]');
				//
				$post->add_rules('tipo_empresa', 'required');
				//
				$post->add_rules('direccion_prestardor_servicio', 'required', 'length[1,100]');
				$post->add_rules('telefono_prestador_servicio', 'required', 'length[1,30]');
				//
				$post->add_rules('perfil_institucional', 'required');
				//
				$post->add_rules('otro_perfil_institucional', 'required', 'length[1,30]');
				$post->add_rules('nombre_representante_legal', 'required', 'length[1,100]');
				$post->add_rules('correo_representante_legal', 'required', 'length[1,100]');
				$post->add_rules('cargo_representante_legal', 'required', 'length[1,100]');
			}
			////echo "<br>VALOR DEL ID ::: ".$post->instalacion_id;
			if ($post->validate())
			{
				////echo "<br>SE INGRESA AL IF post->validate()";
				$instalacion = ORM::factory('instalacion', $post->instalacion_id);
				////echo "<br>".$post->instalacion_id;
				Kohana::log('debug', ":::::::::. Valor de instalacion_id: " );
				
				
				if ($post->action == 'a')// Add/Edit Action
				{
					$instalacion->institucionsolicitante = $post->institucionsolicitante;
					$instalacion->ubicacion_emblema = $post->ubicacion_emblema;
					$instalacion->nombre_prestador_servicio = $post->nombre_prestador_servicio;
					$instalacion->tipo_empresa = $post->tipo_empresa;
					$instalacion->direccion_prestardor_servicio = $post->direccion_prestardor_servicio;
					$instalacion->telefono_prestador_servicio = $post->telefono_prestador_servicio;
					$instalacion->perfil_institucional = $post->perfil_institucional;
					$instalacion->otro_perfil_institucional = $post->otro_perfil_institucional;
					$instalacion->nombre_representante_legal = $post->nombre_representante_legal;
					$instalacion->correo_representante_legal = $post->correo_representante_legal;
					$instalacion->cargo_representante_legal = $post->cargo_representante_legal;				
					
					
					////echo "<br>SIGUE EL save()";					
					$instalacion->save();

					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.added_edited'));
				}
				elseif ($post->action == 'd')// Delete Action
				{
					
					$instalacion->delete();
					//$delinstalacion = ORM::factory('instalacion', $post->user_id_action)->delete();
					$form_saved = TRUE;
					$form_action = strtoupper(Kohana::lang('ui_admin.deleted'));
				}
				////echo "<br>VALOR DE ROLE :::".$instalacion;
			}
			else
			{
				////echo "<br> ESTOY EN ELSE";
				// repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// populate the error fields, if any
				$errors = arr::overwrite($errors, $post->errors('instalacion'));
				$form_error = TRUE;
			}
			//url::redirect(url::site() . 'admin/managementcu/instalacion');
		}
		////echo "<BR>FINAL DEL ARCHIVO";
		//@mr_k ::: se toma el listado de instalacion
		$losinstalacion = Instalacion_Model::get_manager_instalacion();		

		$this->template->content->instalacions = $losinstalacion;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->form_saved = $form_saved;
		$this->template->content->form_action = $form_action;
		$this->template->content->parents_arraytipoemp = $parents_arraytipoemp;
		$this->template->content->parents_arrayperfinsti = $parents_arrayperfinsti;		
		$this->themes->js = new View('admin/managementcu/instalacion_js');
	}
	/**
	 * @mr_k :::: validacion si id cars existe
	 * Checks if cars already exists.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function cars_exists_chk(Validation $post)
	{
		$roles = ORM::factory('cars')->where('Id', $post->Id)->find();

		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('Id', $post->errors()))
			return;

		if ($roles->loaded)
		{
			$post->add_error('Id', 'exists');
		}
	}

	public function persons_exists_chk(Validation $post)
	{
		$roles = ORM::factory('persons')->where('Id', $post->Id)->find();

		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('Id', $post->errors()))
			return;

		if ($roles->loaded)
		{
			$post->add_error('Id', 'exists');
		}
	}

	/**
	 * @mr_k :::: validacion si id instalacion existe
	 * Checks if instalacion  already exists.
	 * @param Validation $post $_POST variable with validation rules
	 */
	public function instalacion_exists_chk(Validation $post)
	{
		$roles = ORM::factory('instalacion')->where('Id', $post->Id)->find();

		// If add->rules validation found any errors, get me out of here!
		if (array_key_exists('Id', $post->errors()))
			return;

		if ($roles->loaded)
		{
			$post->add_error('Id', 'exists');
		}
	}
	
}
