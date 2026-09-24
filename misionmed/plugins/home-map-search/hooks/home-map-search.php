<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Find Location Home Hook
 */

class homeMapSearch {
	
	var $this_page = '';
	/**
	 * Registers the main event add method
	 */
	public function __construct()
	{	
		// Hook into routing
		Event::add('system.pre_controller', array($this, 'add'));
	}
	
	/**
	 * Adds all the events to the main Ushahidi application
	 */
	public function add()
	{
		if ( Router::$current_uri == 'main' ) {
	    	Event::add('ushahidi_action.header_scripts', array($this, 'header_scripts'));
	    	Event::add('ushahidi_action.header_item', array($this, 'header_item'));
		}
	}

	public function header_item()
    {

    	echo '<div class="home-map-search">';
    		echo '<label for="location_find">Search map:</label>';
			echo form::input('location_find', '', ' title="'.Kohana::lang('ui_main.location_example').'" class="findtext" placeholder="City, State and/or Country"');
		echo '</div>';
    }

    public function header_scripts()
    {
        include SYSPATH . '../plugins/home-map-search/script_html.php';
    }
}

$homeMapSearch = new homeMapSearch();