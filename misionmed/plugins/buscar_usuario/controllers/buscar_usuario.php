<?php

// plugins/buscar_usuario/controllers/buscar_usuario.php
//class Buscar_Usuario_Controller extends Controller {
    class Buscar_Usuario_Controller extends Template_Controller {

    /**
	 * Automatically render the views loaded in this controller
	 * @var bool
	 */
	public $auto_render = TRUE;

	/**
	 * Name of the template view
	 * @var string
	 */
	public $template = 'buscar_usuario';


    public function index() {

        /*$this->template->site_name = Kohana::config('settings.site_name');
		$this->template->site_tagline = Kohana::config('settings.site_tagline');
		$this->template->css_url = url::file_loc('css');
		$this->template->js_url = url::file_loc('js');
        */
        $query = $this->input->get('query');

        if ($query) {
            $users = ORM::factory('users')
                ->where('name', 'LIKE', "%$query%")
                ->find_all();
        } else {
            $users = array();
        }

        $view = View::factory('buscar_usuario');
        $view->users = $users;
        $this->template->content = $view;
    }
}
?>