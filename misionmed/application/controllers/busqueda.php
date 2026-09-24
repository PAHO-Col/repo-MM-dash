<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Contact Us Controller
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi - http://source.ushahididev.com
 * @subpackage Controllers
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 * @mr_k adicionado para ver el dashboard.
 */

class Busqueda_Controller extends Main_Controller {
	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		
		$this->template->header->this_page = 'busqueda';
		$this->template->content = new View('busqueda');
		$this->template->header->page_title .= Kohana::lang('ui_main.busqueda') . Kohana::config('settings.title_delimiter');

	}

}
