<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Admin helper class.
 *
 * @package	   Admin
 * @author	   Ushahidi Team
 * @copyright  (c) 2008 Ushahidi Team
 * @license	   http://www.ushahidi.com/license.html
 */
class admin_Core {
	
	public static function getAdminPermission() {
        // Aquí puedes realizar la lógica para verificar el permiso
        return Auth::instance()->has_permission('admin_ui');
    }

}
