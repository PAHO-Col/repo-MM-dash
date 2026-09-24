<?php defined('SYSPATH') or die('No direct script access.');

/**
 * Model for Statistics
 *
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     sik.sytes.net Team <team@sik.sytes.net.com>
 * @package    sik.sytes.net - http://source.sik.sytes.netdev.com
 * @subpackage Models
 * @copyright  sik.sytes.net - http://www.sik.sytes.net.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */

class Stats_Model extends ORM {

	static $time_out = 1;

	/**
	 * Generates the JavaScript for stats tracking
	 */
	public static function get_javascript()
	{
		// Make sure cURL is installed
		if ( ! function_exists('curl_exec'))
		{
			throw new Kohana_Exception('footer.cURL_not_installed');
			return false;
		}

		// Get the stat id
		$stat_id = Settings_Model::get_setting('stat_id');

		// If stats isn't set, ignore this
		if ($stat_id == 0)
			return '';

		$cache = Cache::instance();
		$tag = $cache->get(Kohana::config('settings.subdomain').'_piwiktag');

		if ( ! $tag)
		{ // Cache is Empty so Re-Cache

			// Grabbing the URL to update stats URL, Name, Reports, etc on the stats server
			$additional_query = '';
			if (isset($_SERVER["HTTP_HOST"]))
			{
				// Grab the site domain from the config and trim any whitespaces
				$site_domain = trim(Kohana::config('config.site_domain'));
				$slashornoslash = '';
				if (empty($site_domain) OR $site_domain{0} != '/')
				{
					$slashornoslash = '/';
				}

				// URL
				$val = url::base();
				$additional_query = '&val='.base64_encode($val);

				// Site Name
				$site_name = html::escape(Kohana::config('settings.site_name'));
				$additional_query .= '&sitename='.base64_encode($site_name);

				// Version
				$version = Kohana::config('settings.ushahidi_version');
				$additional_query .= '&version='.base64_encode($version);

				// Report Count
				$number_reports = ORM::factory("incident")->where("incident_active", 1)->count_all();
				$additional_query .= '&reports='.base64_encode($number_reports);

				// Latitude
				$latitude = Kohana::config('settings.default_lat');
				$additional_query .= '&lat='.base64_encode($latitude);

				// Longitude
				$longitude = Kohana::config('settings.default_lon');
				$additional_query .= '&lon='.base64_encode($longitude);
			}

			$url = Kohana::config('config.external_site_protocol').'://tracker.ushahidi.com/dev.px.php?task=tc&siteid='.$stat_id.$additional_query;
			$request = new HttpClient($url);
			$buffer = $request->execute();

			try
			{
				// This works because the tracking code is only wrapped in one tag
				$tag = (string) @simplexml_load_string($buffer);
			}
			catch (Exception $e)
			{
				// In case the xml was malformed for whatever reason, we will just guess what the tag should be here
				$tag = <<< STATSCOLLECTOR
					<!-- Stats Collector -->
					<script type="text/javascript">
					setTimeout(function() {
						var statsCollector = document.createElement('img');
						    statsCollector.src = document.location.protocol + "//tracker.ushahidi.com/piwik/piwik.php?idsite={$stat_id}&rec=1";
						    statsCollector.style.cssText = "width: 1px; height: 1px; opacity: 0.1;";

						document.body.appendChild(statsCollector);
					}, 100);
					</script>
					<!-- End Stats Collector -->
STATSCOLLECTOR;
			}

			// Reset Cache Here
			$cache->set(Kohana::config('settings.subdomain').'_piwiktag', $tag, array('piwiktag'), 86400); // 1 Day
		}

		return $tag;

	}

	/*
	*	range will be ignored if dp1 and dp2 are set
	*	dp1 and dp2 format is YYYY-MM-DD
	*/
	public static function get_hit_stats($range=30, $dp1=NULL, $dp2=NULL)
	{
		// Get ID for stats
		$stat_id = Settings_Model::get_setting('stat_id');
		$stat_key = Settings_Model::get_setting('stat_key');

		$twodates = '';
		if ($dp1 !== NULL AND $dp2 !== NULL)
		{
			$twodates = '&twodates='.urlencode($dp1.','.$dp2);
		}

		$stat_url = Kohana::config('config.external_site_protocol').'://tracker.ushahidi.com/px.php?stat_key='.$stat_key
		    .'&task=stats&siteid='.urlencode($stat_id).'&period=day&range='.urlencode($range).$twodates;

		// Ignore errors since we are error checking later

		$response = @simplexml_load_string(self::_curl_req($stat_url));

		// If we encounter an error, return false
		if
		(
			isset($response->result->error[0]) OR
			isset($response->error[0]) OR
			! isset($response->visits->result)
		)
		{
			Kohana::log('error', "Error on stats request");
			return false;
		}

		foreach ($response->visits->result as $res)
		{
			$dt = $res['date'];
			$y = substr($dt,0,4);
			$m = substr($dt,5,2);
			$d = substr($dt,8,2);
			$timestamp = mktime(0,0,0,$m,$d,$y)*1000;

			if (isset($res->nb_visits))
			{
				$data['visits'][ (string) $timestamp] = (string) $res->nb_visits;
			}
			else
			{
				$data['visits'][ (string) $timestamp] = '0';
			}

			if (isset($res->nb_uniq_visitors))
			{
				$data['uniques'][ (string) $timestamp] = (string) $res->nb_uniq_visitors;
			}
			else
			{
				$data['uniques'][ (string) $timestamp] = '0';
			}

			if (isset($res->nb_actions))
			{
				$data['pageviews'][ (string) $timestamp] = (string) $res->nb_actions;
			}
			else
			{
				$data['pageviews'][ (string) $timestamp] = '0';
			}
		}

		return $data;
	}

	static function get_hit_countries($range=30, $dp1=NULL, $dp2=NULL)
	{
		$stat_id = Settings_Model::get_setting('stat_id');
		$stat_key = Settings_Model::get_setting('stat_key');

		$twodates = '';
		if ($dp1 !== NULL AND $dp2 !== NULL)
		{
			$twodates = '&twodates='.urlencode($dp1.','.$dp2);
		}

		$stat_url = Kohana::config('config.external_site_protocol').'://tracker.ushahidi.com/px.php?stat_key='.$stat_key
		    .'&task=stats&siteid='.urlencode($stat_id).'&period=day&range='.urlencode($range).$twodates;

		// Ignore errors since we are error checking later

		$response = @simplexml_load_string(self::_curl_req($stat_url));

		// If we encounter an error, return false
		if
		(
			isset($response->result->error[0]) OR
			isset($response->error[0]) OR
			! isset($response->countries->result)
		)
		{
			Kohana::log('error', "Error on stats request");
			return false;
		}

		$data = array();
		foreach ($response->countries->result as $res)
		{
			$date = (string) $res['date'];
			foreach ($res->row as $row)
			{
				$code = (string) $row->code;
				$data[$date][$code]['label'] = (string) $row->label;
				$data[$date][$code]['uniques'] = (string) $row->nb_uniq_visitors;
				$logo = (string) $row->logo;
				$data[$date][$code]['logo'] = Kohana::config('core.site_protocol').'://tracker.ushahidi.com/piwik/'.$logo;
			}
		}

		return $data;

	}

	/*
	* get an array of report counts
	* @param approved - Only count approved reports if true
	* @param by_time - Format array with timestamp as the key if true
	* @param range - Number of days back from today to pull reports from. Will end up defaulting to 100000 days to get them all.
	* @param dp1 - Arbitrary date range. Low date. YYYY-MM-DD
	* @param dp2 - Arbitrary date range. High date. YYYY-MM-DD
	*/

	static function get_report_stats($approved = FALSE, $by_time = FALSE, $range = NULL, $dp1 = NULL, $dp2 = NULL, $line_chart_data = FALSE, $categoriap = NULL)
	//static function get_report_stats($approved=FALSE, $by_time=FALSE, $range=NULL, $dp1=NULL, $dp2=NULL, $line_chart_data=FALSE)
	{
		if ($range === NULL)
		{
			$range = 100000;
		}

		if ($dp1 === NULL)
		{
			$dp1 = 0;
		}

		if ($dp2 === NULL)
		{
			$dp2 = '3000-01-01';
		}

		// Set up the range calculation
		$time = time() - ($range*86400);
		$range_date = date('Y-m-d', $time);

		

				$reports_categories = ORM::factory('incident_category')->find_all();
				$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
			

		// Only grab approved
		if ($approved)
			{
			//////////////////echo"<br>PRIMERA<br> ";
					$reports = ORM::factory('incident')
			    ->where('incident_active', '1')
			    ->where('incident_date >=', $dp1)
			    ->where('incident_date <=',$dp2)
			    ->where('incident_date >', $range_date)
			    ->find_all();
				
			}
			else
				{
				//	////////////////echo"<br>SEGUNDA<br> ";
					$reports = ORM::factory('incident')
						->where('incident_date >=', $dp1)
						->where('incident_date <=', $dp2)
						->where('incident_date >', $range_date)
						->find_all();
						//////////////////echo"<br>+**** VALOR DE REPORTS DEPUES DE LA CONSULTA****+<br> ";
						///////////print_r$reports);
					//	////////////////echo"<br>**************<br> ";
					
				}		

				
		
		$reports_categories = ORM::factory('incident_category')->find_all();
		$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
		
		
		

		
		// Initialize arrays so we don't error out
		$report_data = array();
		$verified_counts = array();
		$approved_counts = array();
		$all = array();
		$earliest_timestamp = 32503680000; // Year 3000 in epoch so we can catch everything less than this.
		$latest_timestamp = 0;

		// Gather some data into an array on incident reports
		$num_reports = 0;
		//////////////////echo"<br>TECERA<br> ";
		//////////print_r$reports);
		foreach ($reports as $report)
		{
			//////////////////echo"<br>";
			//////////print_r$report->incident_date);
		//	////////////////echo"<br>";
			$timestamp = (string) strtotime(substr($report->incident_date,0,10));
			$report_data[$report->id] = array(
				'date'=>$timestamp,
				'mode'=>$report->incident_mode,
				'active'=>$report->incident_active,
				'verified'=>$report->incident_verified
			);

			if ($timestamp < $earliest_timestamp)
			{
				$earliest_timestamp = $timestamp;
			}

			if ($timestamp > $latest_timestamp)
			{
				$latest_timestamp = $timestamp;
			}

			if ( ! isset($verified_counts['verified'][$timestamp]))
			{
				$verified_counts['verified'][$timestamp] = 0;
				$verified_counts['unverified'][$timestamp] = 0;
				$approved_counts['approved'][$timestamp] = 0;
				$approved_counts['unapproved'][$timestamp] = 0;
				$all[$timestamp] = 0;
			}

			$all[$timestamp]++;

			if ($report->incident_verified == 1)
			{
				$verified_counts['verified'][$timestamp]++;
			}
			else
			{
				$verified_counts['unverified'][$timestamp]++;
			}

			if ($report->incident_active == 1)
			{
				$approved_counts['approved'][$timestamp]++;
			}
			else
			{
				$approved_counts['unapproved'][$timestamp]++;
			}
			$num_reports++;
		}

		$category_counts = array();
		$parent_category_counts = array(); // Nuevo array para contar reportes por categoría padre
		$lowest_date = 9999999999; // Really far in the future.
		$highest_date = 0;
		foreach ($reports_categories as $report)
		{
			// If this report category doesn't have any reports (in case we are only
			//  looking at approved reports), move on to the next one.
			if ( ! isset($report_data[$report->incident_id]))
				continue;

			$c_id = $report->category_id;
			$timestamp = $report_data[$report->incident_id]['date'];

			if ($timestamp < $lowest_date)
			{
				$lowest_date = $timestamp;
			}

			if ($timestamp > $highest_date)
			{
				$highest_date = $timestamp;
			}

			if ( ! isset($category_counts[$c_id][$timestamp]))
			{
				$category_counts[$c_id][$timestamp] = 0;
			}

			$category_counts[$c_id][$timestamp]++;
		}

		// Contar los reportes asociados a cada categoría padre
		foreach ($parent_categories as $parent) 
		{
			
			$parent_category_counts[$parent->id] = array(
				'name' => $parent->category_title,
				'count' => 0
			);
			$subcategories = ORM::factory('category')->where('parent_id', $parent->id)->find_all();
			
			$incidenteshijost=0;
			foreach ($subcategories as $sub) {
				if (isset($category_counts[$sub->id])) {
				
					$incidenteshijos=ORM::factory('incident_category')->where('category_id', $sub->id)->count_all();	
										
				}
			
				$incidenteshijost+=$incidenteshijos;
			
			}
			//////////////////echo"<br> TOTAL";
			//		///////////////////////////print_r$incidenteshijost);
			//////////////////echo"<br>PARENT ID ";
		//////////print_r$parent->id);
		$parent_category_counts[$parent->id]['count'] =$incidenteshijost;
		}	
		
		//////////print_r$parent_category_counts);
		// Populate date range
		$date_range = array();
		$add_date = $lowest_date;
		while ($add_date <= $highest_date)
		{
			$date_range[] = $add_date;
			$add_date += 86400;
		}

		// Zero out days that don't have a count
		foreach ($category_counts as & $arr)
		{
			foreach ($date_range as $timestamp)
			{
				if ( ! isset($arr[$timestamp]))
				{
					$arr[$timestamp] = 0;
				}

				if ( ! isset($verified_counts['verified'][$timestamp]))
				{
					$verified_counts['verified'][$timestamp] = 0;
				}

				if ( ! isset($verified_counts['unverified'][$timestamp]))
				{
					$verified_counts['unverified'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['approved'][$timestamp]))
				{
					$approved_counts['approved'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['unapproved'][$timestamp]))
				{
					$approved_counts['unapproved'][$timestamp] = 0;
				}

				if ( ! isset($all[$timestamp]))
				{
					$all[$timestamp] = 0;
				}

			}
			// keep dates in order
			ksort($arr);
			ksort($verified_counts['verified']);
			ksort($verified_counts['unverified']);
			ksort($approved_counts['approved']);
			ksort($approved_counts['unapproved']);
			ksort($all);

		}

		// Add all our data sets to the array we are returning
		$data['category_counts'] = $category_counts;
		$data['verified_counts'] = $verified_counts;
		$data['approved_counts'] = $approved_counts;
		$data['all']['all'] = $all;

		// I'm just tacking this on here. However, we could improve performance
		//   by implementing the code above but I just don't have the time
		//   to mess with it.
		if ($by_time)
		{
			// Reorder the array. Is there a built in PHP function that can do this?
			$new_data = array();
			foreach ($data as $main_key => $data_array)
			{
				foreach ($data_array as $key => $counts)
				{

					if ($line_chart_data == FALSE)
					{
						foreach ($counts as $timestamp => $count)
						{
							$new_data[$main_key][$timestamp][$key] = $count;
						}
					}
					else
					{
						foreach ($counts as $timestamp => $count)
						{
							$timestamp_key = (string) ($timestamp*1000);
							if ( ! isset($new_data[$main_key][$timestamp_key]))
							{
								$new_data[$main_key][$timestamp_key] = 0;
							}
							$new_data[$main_key][$timestamp_key] += $count;
						}
					}
				}
			}

			$data = $new_data;

		}

		if ($line_chart_data == FALSE)
		{
			$data['total_reports'] = $num_reports;
			$data['total_categories'] = count($category_counts);
			$data['earliest_report_time'] = $earliest_timestamp;
			$data['latest_report_time'] = $latest_timestamp;
			$data['parent_categories'] = $parent_category_counts; // Agregar las categorías padre al array de datos
		}

		return $data;
	}
	//mr_k ::: estadistica de categorias padres

	static function get_report_statsc($approved = FALSE, $by_time = FALSE, $range = NULL, $dp1 = NULL, $dp2 = NULL, $line_chart_data = FALSE, $categoriap = NULL, $dpto_selected = NULL,$mpio_selected= NULL)
	{
		if ($range === NULL)
		{
			$range = 100000;
		}

		if ($dp1 === NULL)
		{
			$dp1 = 0;
		}

		if ($dp2 === NULL)
		{
			$dp2 = '3000-01-01';
		}

		//mr_k::: se definen los array
		$dpto_incident_ids = array();
		$mpio_incident_ids = array();	
		$subcat_ids = array();
		$incident_id_array = array();
		$id_iguales_array = array();
		$id_ia="";

		// Set up the range calculation
		$time = time() - ($range*86400);
		$range_date = date('Y-m-d', $time);

		
		//se consulta las categoarias padres
		//$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
		/////////////echo "<br>SIGUE LA CONSULTA DE parent_categories<br>".
		/////////////////////////print_r($parent_categories);



			
		//mr_k ::: inicia busqueda por el campo Dpto del select
		//////////echo "<br>SIGUE LA CONSULTA DE DPTO<br>".$dpto_selected;		
		if (!empty($dpto_selected)) 
			{
				/////////////echo "<br>SIGUE LA IF DE DPTO<br>";
				// Buscar incident_id que tengan el departamento seleccionado
				$form_responses = ORM::factory('form_response')
					->where('form_field_id', 364)
					->where('form_response', $dpto_selected)
					->find_all();		
				
				foreach ($form_responses as $fr) {
					$dpto_incident_ids[] = $fr->incident_id;
				}

				////////print_r($dpto_incident_ids);		
			}
		/////////////////echo "<br>SIGUE LA IF DE MPIO<br>";
		if (!empty($mpio_selected)) 
			{
				/////////////echo "<br>SIGUE LA IF DE MPIO<br>";
				// Buscar incident_id que tengan el departamento seleccionado
				$form_responses = ORM::factory('form_response')
				->where('form_field_id', 365)
				->where('form_response', $mpio_selected)
				->find_all();		
			
				foreach ($form_responses as $fr) {
					$mpio_incident_ids[] = $fr->incident_id;
				}

				/////////////////////////print_r($mpio_incident_ids);		
			}
		
		/////////////echo "<br>SIGUE LA CONSULTA DE CATEGORIA<br> valor de la categoria ".$categoriap."<br>";

		if (!empty($categoriap)) 
			{
				/////////////echo "<br>SIGUE EN EL IF CATEGORIA<br>";
				// Obtener IDs de subcategorías de la categoría padre seleccionada			
				$subcategories = ORM::factory('category')->where('parent_id', $categoriap)->find_all();			
			
				foreach ($subcategories as $sub) {
					$subcat_ids[] = $sub->id;
				}
				//$subcat_ids = [180, 181, 182, 183, 184, 186, 187, 205];
				
				// Obtener IDs de incidentes que tienen esas subcategorías
				$incident_ids = ORM::factory('incident_category')
									->in('category_id', $subcat_ids)
									->find_all();
				$reports_categories = $incident_ids;					
				
				
				foreach ($incident_ids as $ic) {
					$incident_id_array[] = $ic->incident_id;
				}

				$incident_id_array = array_unique(array_filter($incident_id_array, 'is_numeric'));		
			
			}
		/////////////echo "<br>LOS ARRAY dpto_incident_ids <br>";
		/////////////////////////print_r($dpto_incident_ids);
		/////////////echo "<br>LOS ARRAY incident_id_array <br>";
		/////////////////////////print_r($incident_id_array);
		/////////////echo "<br>LOS ARRAY mpio_incident_ids <br>";
		/////////////////////////print_r($mpio_incident_ids);

		//mr_k ::: se validan los select 
		// Buscar incident_id que tengan el departamento seleccionado y la categoria seleccionada
		//los 3
		if(count($incident_id_array) > 0 && count($dpto_incident_ids) >0  && count($mpio_incident_ids) >0)
		{	
			/////////////echo "<br>LOS 3 ARRAY ESTAN LLENOS :::<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $incident_id_array,$mpio_incident_ids);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// categorias y dpto
		if (count($incident_id_array) > 0 && count($dpto_incident_ids) >0  && count($mpio_incident_ids) == 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $incident_id_array);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// categorias y mpio
		if (count($incident_id_array) > 0 && count($dpto_incident_ids) == 0  && count($mpio_incident_ids) > 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array = array_intersect($mpio_incident_ids, $incident_id_array);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		//categoria sola
		if (count($incident_id_array) > 0 && count($dpto_incident_ids) == 0  && count($mpio_incident_ids) == 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array =  $incident_id_array;
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// dpto y mpio
		if (count($incident_id_array) == 0 && count($dpto_incident_ids) >0  && count($mpio_incident_ids) > 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $mpio_incident_ids);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// mpio solo
		if (count($incident_id_array) == 0 && count($dpto_incident_ids) == 0  && count($mpio_incident_ids) > 0) 
		{	
			/////////////echo "<br>1 LOS 2 ARRAY ESTAN VACIOS incident_id_array - dpto_incident_ids<br>";
			$id_iguales_array = $mpio_incident_ids;
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// dpto solo
		if (count($incident_id_array) == 0 && count($dpto_incident_ids) > 0  && count($mpio_incident_ids) == 0) 
		{	
			//////////echo "<br>LOS 2 ARRAY ESTAN VACIOS incident_id_array - mpio_incident_ids<br>";
			$id_iguales_array = $dpto_incident_ids;
			////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}

		
		//mr_k ::: se valida la consulta de dpto y mpio
		/////////////echo "<br>LOS 2 ARRAY id_iguales_array<br>";
		/////////////////////////print_r($id_iguales_array);
		$id_ia = "";
		foreach ($id_iguales_array as $idia) {
			/////////////echo "<br>LOS id_ia<br>".$idia;
					$id_ia .= $idia.",";
				}
				/////////////echo "<br>fin LOS id_ia<br>";
				$id_ia = rtrim($id_ia, ',');
		///////////////////////print_r(count($dpto_incident_ids) );	
		

		$query_dpto = "SELECT d.nombre, COUNT(fr.form_response) AS total
			FROM form_response fr
			JOIN form_field ff ON fr.form_field_id = ff.id
			JOIN departamentos d ON fr.form_response = d.Id";
			if($id_ia=="" ){$query_dpto.=" WHERE ff.id = 364 ";}
			else{$query_dpto.=" WHERE fr.incident_id IN($id_ia) AND ff.id = 346";} 
			$query_dpto.=" GROUP BY fr.form_response, d.nombre ORDER BY total DESC;";
			$departamentos_count = Database::instance()->query($query_dpto);

			$query_mpio = "SELECT d.nombre, COUNT(fr.form_response) AS total
			FROM form_response fr
			JOIN form_field ff ON fr.form_field_id = ff.id
			JOIN municipios d ON fr.form_response = d.Id";
			if($id_ia==""){$query_mpio.=" WHERE ff.id = 347 ";}
			else{$query_mpio.=" WHERE fr.incident_id IN($id_ia) AND ff.id = 347";} 
			$query_mpio.=" GROUP BY fr.form_response, d.nombre ORDER BY total DESC;";
			$municipios_count = Database::instance()->query($query_mpio);	
			
			////////////echo"<br>dpto_selected<br>";
			/////////////////////////print_r($dpto_selected);	
			////////////echo"<br>departamentos_count<br>";
			/////////////////////////print_r($departamentos_count);	

		if($categoriap == NULL && $dpto_selected== NULL)
		{
			//////////////echo" <br> ESTOY EN EL IF categoriap == NULL && dpto_selected<br>";
	
			$reports = ORM::factory('incident')
				->where('incident_date >=', $dp1)
				->where('incident_date <=', $dp2)
				->where('incident_date >', $range_date);
		
			if ($approved) 
			{
				$reports = $reports->where('incident_active', '1');
			}
		
			$reports = $reports->find_all();
			$reports_categories = ORM::factory('incident_category')->find_all();
			$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
			

			////////////echo"<br> REPORTS<br>";
			/////////////////////////print_r($reports);
			////////////echo"<br>reports_categories<br>";
			/////////////////////////print_r($reports_categories);
			////////////echo"<br>parent_categories<br>";
			/////////////////////////print_r($parent_categories);
			////////////echo"<br>municipios_count<br>";
			/////////////////////////print_r($municipios_count);			

		}
		else
		{
			//////////////echo" <br> ESTOY EN EL ELSE DONDE VOY HACER EL SQL ::::<br>";
			/////////////////////////print_r($id_iguales_array);

			if (empty($id_iguales_array)) 
				{
					////////////echo"<br>NO HAY COINCIDENCIAS ENTRE DPTO Y CATEGORIA<br>";
					$reports = array(); // No hay reportes
					//return array(); // Evita hacer la consulta inválida
					$reports_categories = ORM::factory('incident_category')->find_all();
				}
			
			else{
				//////////////echo" <br>222222 ESTOY EN EL ELSE DONDE VOY HACER EL SQL 11111<br>";
					$reports = ORM::factory('incident')
					//->in('id', $incident_id_array)
					->in('id', $id_iguales_array)
					->where('incident_date >=', $dp1)
					->where('incident_date <=', $dp2)
					->where('incident_date >', $range_date)
					->find_all();
					//$reports = $reports_query->find_all();
					

					//$reports = $reports->find_all();
					$reports_categories = ORM::factory('incident_category')->find_all();
					$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
					////////////echo"<br>reports_query ::::::::::<br>";
					/////////////////////////print_r($reports);	

				}	
			
		}
		
		

		
		// Initialize arrays so we don't error out
		$report_data = array();
		$verified_counts = array();
		$approved_counts = array();
		$all = array();
		$earliest_timestamp = 32503680000; // Year 3000 in epoch so we can catch everything less than this.
		$latest_timestamp = 0;
		$incidenteshijos=0;

		// Gather some data into an array on incident reports
		$num_reports = 0;
		
		foreach ($reports as $report)
		{
		
			$timestamp = (string) strtotime(substr($report->incident_date,0,10));
			$report_data[$report->id] = array(
				'date'=>$timestamp,
				'mode'=>$report->incident_mode,
				'active'=>$report->incident_active,
				'verified'=>$report->incident_verified
			);

			if ($timestamp < $earliest_timestamp)
			{
				$earliest_timestamp = $timestamp;
			}

			if ($timestamp > $latest_timestamp)
			{
				$latest_timestamp = $timestamp;
			}

			if ( ! isset($verified_counts['verified'][$timestamp]))
			{
				$verified_counts['verified'][$timestamp] = 0;
				$verified_counts['unverified'][$timestamp] = 0;
				$approved_counts['approved'][$timestamp] = 0;
				$approved_counts['unapproved'][$timestamp] = 0;
				$all[$timestamp] = 0;
			}

			$all[$timestamp]++;

			if ($report->incident_verified == 1)
			{
				$verified_counts['verified'][$timestamp]++;
			}
			else
			{
				$verified_counts['unverified'][$timestamp]++;
			}

			if ($report->incident_active == 1)
			{
				$approved_counts['approved'][$timestamp]++;
			}
			else
			{
				$approved_counts['unapproved'][$timestamp]++;
			}
			$num_reports++;
		}
		//mr_k ::: se definen los array
		$category_counts = array();
		$parent_category_counts = array(); // Nuevo array para contar reportes por categoría padre
		$dpto_counts=array();
		$mpio_counts=array();
		$lowest_date = 9999999999; // Really far in the future.
		$highest_date = 0;
		$incidenteshijost=0;
		foreach ($reports_categories as $report)
		{
			// If this report category doesn't have any reports (in case we are only
			//  looking at approved reports), move on to the next one.
			if ( ! isset($report_data[$report->incident_id]))
				continue;

			$c_id = $report->category_id;
			$timestamp = $report_data[$report->incident_id]['date'];
			////////////////echo" <br> ESTOY timestamp ::::<br>";
			///////////////////////////print_r($id_iguales_array);

			if ($timestamp < $lowest_date)
			{
				$lowest_date = $timestamp;
			}

			if ($timestamp > $highest_date)
			{
				$highest_date = $timestamp;
			}

			if ( ! isset($category_counts[$c_id][$timestamp]))
			{
				$category_counts[$c_id][$timestamp] = 0;
			}

			$category_counts[$c_id][$timestamp]++;
		}

		//mr_k :::  Contar los reportes asociados a cada categoría padre - Count the reports associated with each parent category
		foreach ($parent_categories as $parent) 
		{			
			$parent_category_counts[$parent->id] = array(
				'name' => $parent->category_title,
				'count' => 0
			);
			$subcategories = ORM::factory('category')->where('parent_id', $parent->id)->find_all();
			
			
			foreach ($subcategories as $sub) {
				if (isset($category_counts[$sub->id])) {
				
					$incidenteshijos=ORM::factory('incident_category')->where('category_id', $sub->id)->count_all();	
										
				}
			
				$incidenteshijost+=$incidenteshijos;
			
			}
			//////////////////echo"<br> TOTAL";
			//		///////////////////////////print_r$incidenteshijost);
		
			$parent_category_counts[$parent->id]['count'] =$incidenteshijost;
		}	
		
		//mr_k ::: the count is done by departamento
		foreach ($departamentos_count as $dpto) 
		{			
			$dpto_counts[] = array(
				'name' => $dpto->nombre,
				'count' => $dpto->total
			);		
		}	
		////////////echo"<br>dpto_counts<br>";
		/////////////////////////print_r($dpto_counts);	
		//mr_k ::: the count is done by municipio
		foreach ($municipios_count as $mpio) 
		{			
			$mpio_counts[] = array(
				'name' => $mpio->nombre,
				'count' => $mpio->total
			);		
		}	
		
		// Populate date range
		$date_range = array();
		$add_date = $lowest_date;
		while ($add_date <= $highest_date)
		{
			$date_range[] = $add_date;
			$add_date += 86400;
		}

		// Zero out days that don't have a count
		foreach ($category_counts as & $arr)
		{
			foreach ($date_range as $timestamp)
			{
				if ( ! isset($arr[$timestamp]))
				{
					$arr[$timestamp] = 0;
				}

				if ( ! isset($verified_counts['verified'][$timestamp]))
				{
					$verified_counts['verified'][$timestamp] = 0;
				}

				if ( ! isset($verified_counts['unverified'][$timestamp]))
				{
					$verified_counts['unverified'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['approved'][$timestamp]))
				{
					$approved_counts['approved'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['unapproved'][$timestamp]))
				{
					$approved_counts['unapproved'][$timestamp] = 0;
				}

				if ( ! isset($all[$timestamp]))
				{
					$all[$timestamp] = 0;
				}

			}
			// keep dates in order
			ksort($arr);
			ksort($verified_counts['verified']);
			ksort($verified_counts['unverified']);
			ksort($approved_counts['approved']);
			ksort($approved_counts['unapproved']);
			ksort($all);

		}

		// Add all our data sets to the array we are returning
		$data['category_counts'] = $category_counts;
		$data['verified_counts'] = $verified_counts;
		$data['approved_counts'] = $approved_counts;
		$data['dpto_counts'] = $dpto_counts;
		$data['mpio_counts'] = $mpio_counts;
		$data['all']['all'] = $all;

		// I'm just tacking this on here. However, we could improve performance
		//   by implementing the code above but I just don't have the time
		//   to mess with it.
		if ($by_time)
		{
			// Reorder the array. Is there a built in PHP function that can do this?
			$new_data = array();
			foreach ($data as $main_key => $data_array)
			{
				foreach ($data_array as $key => $counts)
				{

					if ($line_chart_data == FALSE)
					{
						foreach ($counts as $timestamp => $count)
						{
							$new_data[$main_key][$timestamp][$key] = $count;
						}
					}
					else
					{
						foreach ($counts as $timestamp => $count)
						{
							$timestamp_key = (string) ($timestamp*1000);
							if ( ! isset($new_data[$main_key][$timestamp_key]))
							{
								$new_data[$main_key][$timestamp_key] = 0;
							}
							$new_data[$main_key][$timestamp_key] += $count;
						}
					}
				}
			}

			$data = $new_data;

		}

		if ($line_chart_data == FALSE)
		{
			$data['total_reports'] = $num_reports;
			$data['total_categories'] = count($category_counts);
			$data['earliest_report_time'] = $earliest_timestamp;
			$data['latest_report_time'] = $latest_timestamp;
			$data['parent_categories'] = $parent_category_counts; // Agregar las categorías padre al array de datos
		}

		return $data;
	}



	//////
	static function get_report_statsc_buena($approved = FALSE, $by_time = FALSE, $range = NULL, $dp1 = NULL, $dp2 = NULL, $line_chart_data = FALSE, $categoriap = NULL, $dpto_selected = NULL)
	{
		if ($range === NULL)
		{
			$range = 100000;
		}

		if ($dp1 === NULL)
		{
			$dp1 = 0;
		}

		if ($dp2 === NULL)
		{
			$dp2 = '3000-01-01';
		}

		// Set up the range calculation
		$time = time() - ($range*86400);
		$range_date = date('Y-m-d', $time);

		
		//nuevo codigo 
		$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre

		//mr_k ::: inicia busqueda por el campo Dpto del select
		///////////////echo "<br>SIGUE LA CONSULTA DE DPTO<br>";

		if (!empty($dpto_selected)) {
			///////////////echo "<br>SIGUE LA IF DE DPTO<br>";
			// Buscar incident_id que tengan el departamento seleccionado
			$form_responses = ORM::factory('form_response')
				->where('form_field_id', 364)
				->where('form_response', $dpto_selected)
				->find_all();
		
			$dpto_incident_ids = array();
			foreach ($form_responses as $fr) {
				$dpto_incident_ids[] = $fr->incident_id;
			}
			///////////////////////////print_r$dpto_incident_ids);
		
		}
		
		///////////////echo "<br>SIGUE LA CONSULTA DE CATEGORIA<br>";


		if ($categoriap !== NULL) 
		{
			///////////////echo "<br>SIGUE LA IF DE CATEGORIA<br>";
			// Obtener IDs de subcategorías de la categoría padre seleccionada
			
			$subcategories = ORM::factory('category')->where('parent_id', $categoriap)->find_all();
			$subcat_ids = array();
		
			foreach ($subcategories as $sub) {
				$subcat_ids[] = $sub->id;
			}
			//$subcat_ids = [180, 181, 182, 183, 184, 186, 187, 205];
			///////////////echo "<br>SIGUE LOS ID DE SUB-CATEGORIA<br>";
			///////////////////////////print_r$subcat_ids);
			
			// Obtener IDs de incidentes que tienen esas subcategorías
			$incident_ids = ORM::factory('incident_category')
								->in('category_id', $subcat_ids)
								->find_all();
			$reports_categories = $incident_ids;					
			
			///////////////echo "<br>SIGUE LOS ID DE INCIDENTES <br>";
			///////////////////////////print_r$incident_ids);

			$incident_id_array = array();
			foreach ($incident_ids as $ic) {
				$incident_id_array[] = $ic->incident_id;
			}
				///////////////echo "<br>222 SIGUE LOS ID DE incident_id_array <br>";
				///////////////////////////print_r$incident_id_array);

			$incident_id_array = array_unique(array_filter($incident_id_array, 'is_numeric'));
			////////////////echo"<br>VLOR DEL INCIDENTE incident_id_array <br>";
			///////////////////////////print_r$incident_id_array);
			$id_iguales_array = array_intersect($dpto_incident_ids, $incident_id_array);
			
			
			if (count($incident_id_array) > 0) {
				

				//if (!empty($incident_id_array) && is_array($incident_id_array)) {
				  if (!empty($id_iguales_array)) {
					$reports_query = ORM::factory('incident')
					//->in('id', $incident_id_array)
					->in('id', $id_iguales_array)
					->where('incident_date >=', $dp1)
					->where('incident_date <=', $dp2)
					->where('incident_date >', $range_date);

					if (!empty($dpto_incident_ids)) {				
					//	$reports_query->in('id', $dpto_incident_ids);		
					//	$reports_query->in('id', $incident_id_array);
					}
					
					
					$reports = $reports_query->find_all();

					///////////////echo "<br>LA CONSULTA EN CATEGORIA TERMINO<br>";
					///////////////////////////print_r$reports);
					
				} else {
					////////////////echo"⚠️ El array \$incident_id_array está vacío o no es un array válido.";
				}
				
			} else {
				$reports = array(); // No hay reportes
			}
		} 
		else 
		{
			// Consulta estándar (como ya está en tu código)
			$reports = ORM::factory('incident')
				->where('incident_date >=', $dp1)
				->where('incident_date <=', $dp2)
				->where('incident_date >', $range_date);
		
			if ($approved) {
				$reports = $reports->where('incident_active', '1');
			}
		
			$reports = $reports->find_all();
			$reports_categories = ORM::factory('incident_category')->find_all();
			$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
		}
		


		
		// Initialize arrays so we don't error out
		$report_data = array();
		$verified_counts = array();
		$approved_counts = array();
		$all = array();
		$earliest_timestamp = 32503680000; // Year 3000 in epoch so we can catch everything less than this.
		$latest_timestamp = 0;
		$incidenteshijos=0;

		// Gather some data into an array on incident reports
		$num_reports = 0;
		
		foreach ($reports as $report)
		{
		
			$timestamp = (string) strtotime(substr($report->incident_date,0,10));
			$report_data[$report->id] = array(
				'date'=>$timestamp,
				'mode'=>$report->incident_mode,
				'active'=>$report->incident_active,
				'verified'=>$report->incident_verified
			);

			if ($timestamp < $earliest_timestamp)
			{
				$earliest_timestamp = $timestamp;
			}

			if ($timestamp > $latest_timestamp)
			{
				$latest_timestamp = $timestamp;
			}

			if ( ! isset($verified_counts['verified'][$timestamp]))
			{
				$verified_counts['verified'][$timestamp] = 0;
				$verified_counts['unverified'][$timestamp] = 0;
				$approved_counts['approved'][$timestamp] = 0;
				$approved_counts['unapproved'][$timestamp] = 0;
				$all[$timestamp] = 0;
			}

			$all[$timestamp]++;

			if ($report->incident_verified == 1)
			{
				$verified_counts['verified'][$timestamp]++;
			}
			else
			{
				$verified_counts['unverified'][$timestamp]++;
			}

			if ($report->incident_active == 1)
			{
				$approved_counts['approved'][$timestamp]++;
			}
			else
			{
				$approved_counts['unapproved'][$timestamp]++;
			}
			$num_reports++;
		}

		$category_counts = array();
		$parent_category_counts = array(); // Nuevo array para contar reportes por categoría padre
		$lowest_date = 9999999999; // Really far in the future.
		$highest_date = 0;
		foreach ($reports_categories as $report)
		{
			// If this report category doesn't have any reports (in case we are only
			//  looking at approved reports), move on to the next one.
			if ( ! isset($report_data[$report->incident_id]))
				continue;

			$c_id = $report->category_id;
			$timestamp = $report_data[$report->incident_id]['date'];

			if ($timestamp < $lowest_date)
			{
				$lowest_date = $timestamp;
			}

			if ($timestamp > $highest_date)
			{
				$highest_date = $timestamp;
			}

			if ( ! isset($category_counts[$c_id][$timestamp]))
			{
				$category_counts[$c_id][$timestamp] = 0;
			}

			$category_counts[$c_id][$timestamp]++;
		}

		// Contar los reportes asociados a cada categoría padre
		foreach ($parent_categories as $parent) 
		{
			
			$parent_category_counts[$parent->id] = array(
				'name' => $parent->category_title,
				'count' => 0
			);
			$subcategories = ORM::factory('category')->where('parent_id', $parent->id)->find_all();
			
			$incidenteshijost=0;
			foreach ($subcategories as $sub) {
				if (isset($category_counts[$sub->id])) {
				
					$incidenteshijos=ORM::factory('incident_category')->where('category_id', $sub->id)->count_all();	
										
				}
			
				$incidenteshijost+=$incidenteshijos;
			
			}
			//////////////////echo"<br> TOTAL";
			//		///////////////////////////print_r$incidenteshijost);
		
		$parent_category_counts[$parent->id]['count'] =$incidenteshijost;
		}	
		
		
		// Populate date range
		$date_range = array();
		$add_date = $lowest_date;
		while ($add_date <= $highest_date)
		{
			$date_range[] = $add_date;
			$add_date += 86400;
		}

		// Zero out days that don't have a count
		foreach ($category_counts as & $arr)
		{
			foreach ($date_range as $timestamp)
			{
				if ( ! isset($arr[$timestamp]))
				{
					$arr[$timestamp] = 0;
				}

				if ( ! isset($verified_counts['verified'][$timestamp]))
				{
					$verified_counts['verified'][$timestamp] = 0;
				}

				if ( ! isset($verified_counts['unverified'][$timestamp]))
				{
					$verified_counts['unverified'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['approved'][$timestamp]))
				{
					$approved_counts['approved'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['unapproved'][$timestamp]))
				{
					$approved_counts['unapproved'][$timestamp] = 0;
				}

				if ( ! isset($all[$timestamp]))
				{
					$all[$timestamp] = 0;
				}

			}
			// keep dates in order
			ksort($arr);
			ksort($verified_counts['verified']);
			ksort($verified_counts['unverified']);
			ksort($approved_counts['approved']);
			ksort($approved_counts['unapproved']);
			ksort($all);

		}

		// Add all our data sets to the array we are returning
		$data['category_counts'] = $category_counts;
		$data['verified_counts'] = $verified_counts;
		$data['approved_counts'] = $approved_counts;
		$data['all']['all'] = $all;

		// I'm just tacking this on here. However, we could improve performance
		//   by implementing the code above but I just don't have the time
		//   to mess with it.
		if ($by_time)
		{
			// Reorder the array. Is there a built in PHP function that can do this?
			$new_data = array();
			foreach ($data as $main_key => $data_array)
			{
				foreach ($data_array as $key => $counts)
				{

					if ($line_chart_data == FALSE)
					{
						foreach ($counts as $timestamp => $count)
						{
							$new_data[$main_key][$timestamp][$key] = $count;
						}
					}
					else
					{
						foreach ($counts as $timestamp => $count)
						{
							$timestamp_key = (string) ($timestamp*1000);
							if ( ! isset($new_data[$main_key][$timestamp_key]))
							{
								$new_data[$main_key][$timestamp_key] = 0;
							}
							$new_data[$main_key][$timestamp_key] += $count;
						}
					}
				}
			}

			$data = $new_data;

		}

		if ($line_chart_data == FALSE)
		{
			$data['total_reports'] = $num_reports;
			$data['total_categories'] = count($category_counts);
			$data['earliest_report_time'] = $earliest_timestamp;
			$data['latest_report_time'] = $latest_timestamp;
			$data['parent_categories'] = $parent_category_counts; // Agregar las categorías padre al array de datos
		}

		return $data;
	}


//TRAER DATOS DE LOS FORMULARIOS.

public static function get_formulario_report_stats_d($range = 10000, $dp1 = null, $dp2 = null,$variable,$dpto_selected,$mpio_selected)
{
    $results = array();
	$incident_id_array = array();
	$crue_id_array = array();

    // Definir fecha de inicio y fin
    if (!empty($dp1) && !empty($dp2)) {
        $start = date('Y-m-d H:i:s', strtotime($dp1));
        $end = date('Y-m-d H:i:s', strtotime($dp2));
    } else {
        $start = date('Y-m-d H:i:s', time() - ($range * 86400));
        $end = date('Y-m-d H:i:s');
    }
	if ($range == NULL)
		{
			$range = 100000;
		}

		if ($dp1 == NULL)
		{
			$dp1 = 0;
		}

		if ($dp2 == NULL)
		{
			$dp2 = '3000-01-01';
		}

    // Obtener todas las campos
    $form_fields = ORM::factory('form_field')
	->where('id', $variable)
	->find_all();
	////////////////echo"<br>:::::::::: 1 array form_fields<br>";
	///////////////////////////print_r($form_fields);

	if ($range === NULL)
		{
			$range = 100000;
		}
		$time = time() - ($range*86400);
		$range_date = date('Y-m-d', $time);
	$losincidentes = ORM::factory('incident')
	->where('incident_date >=', $dp1)
	->where('incident_date <=', $dp2)
	->where('incident_date >', $range_date);
	
	if ($mpio_selected &&  $dpto_selected) 
			{
				//////////////echo"ENTRE";
				$crue_id_array[1]=$dpto_selected;
				$crue_id_array[2]=$mpio_selected;
				$losincidentes = $losincidentes->in('crue_id', $crue_id_array);
			}
	else{
			if ($dpto_selected) 
			{
				
				$losincidentes = $losincidentes->where('crue_id', $dpto_selected);
			}
	if ($mpio_selected) 
			{
				
				$losincidentes = $losincidentes->where('crue_id', $mpio_selected);
			}
	}		

	
					
		
			$losincidentes = $losincidentes->find_all();
	//->find_all();
	$flag=0;
		/*if ($approved) 
			{
				$reports = $reports->where('incident_active', '1');
			}*/
	foreach ($losincidentes as $ic) {
				$incident_id_array[] = $ic->id;
				$flag=1;
			}
	

	
    foreach ($form_fields as $form_field)
    {
	
		// Obtener el valor del campo por defecto (las opciones)
			$raw_options = $form_field->field_default;

			// Convertir las opciones en un array, quitando espacios en blanco y vacíos
			$options = array_filter(array_map('trim', explode(',', $raw_options)));

	 

		
    }
		

		if($flag==1){
	//		//////////////echo"<pre>ENTRE EN EL flag==1::: <br>";

			foreach ($options as $option)
			{
			if (empty($option)) continue;
			// Contar los incidentes activos por ubicación en el rango de fechas
			$report_count = ORM::factory('form_response')
				->in('incident_id',$incident_id_array)
				->where('form_field_id', $variable)
				->where('form_response', $option)
				->count_all();
	//			//////////////echo"<pre> CONSULTA SQL: ";
	//			/////////////////////////print_r($report_count);
	//			//////////////echo"</pre>";     


			// Inicializar si no existe
			if (!isset($results[$option])) {
				$results[$option] = array('label' => $option, 'report_count' => 0);
			}

			// Sumar al conteo
			$results[$option]['report_count'] += $report_count;
		}

	}	
	else{
		foreach ($options as $option)
		{
							$results[$option] = array('label' => $option, 'report_count' => 0);

		}

	}	
		

	////////////////echo"<br>SIGUE <br>";
	///////////////////////////print_r($results);
	////////////////echo"<br>SIGUE <br>";
	//var_dump($results);
	/**/
    // Reindexar para que sea un array numérico
    return array_values($results);
}

public static function get_formulario_report_stats($range = 10000, $dp1 = null, $dp2 = null,$variable,$dpto_selected,$mpio_selected)
{
    $results = array();
	$incident_id_array = array();
	$crue_id_array = array();
	$dpto_incident_ids = array();

    // Definir fecha de inicio y fin
    if (!empty($dp1) && !empty($dp2)) 
	{
        $start = date('Y-m-d H:i:s', strtotime($dp1));
        $end = date('Y-m-d H:i:s', strtotime($dp2));
    } 
	else 
	{
        $start = date('Y-m-d H:i:s', time() - ($range * 86400));
        $end = date('Y-m-d H:i:s');
    }
	if ($range == NULL)
	{
		$range = 100000;
	}

	if ($dp1 == NULL)
	{
		$dp1 = 0;
	}

	if ($dp2 == NULL)
	{
		$dp2 = '3000-01-01';
	}

    // Obtener todas las campos
    $form_fields = ORM::factory('form_field')
					->where('id', $variable)
					->find_all();
	/////////////////////////////echo"<br>:::::::::: 1 array form_fields<br>";
	/////////////////////////print_r($form_fields);

	if ($range === NULL)
	{
		$range = 100000;
	}

	////////////////////////////echo "<br>SIGUE LA CONSULTA DE DPTO<br>".$dpto_selected;		
	////////////////////////////echo "<br>SIGUE LA IF DE DPTO<br>";
	// Buscar incident_id que tengan el departamento seleccionado
	$form_responses = ORM::factory('form_response')->where('form_field_id', 346);
		if (!empty($dpto_selected))
			{
				$form_responses =$form_responses->where('form_response', $dpto_selected);
			}			
	$form_responses =$form_responses->find_all();						
		foreach ($form_responses as $fr) 
			{
				$dpto_incident_ids[] = $fr->incident_id;
			}
			/////////////////////////print_r($dpto_incident_ids);		
		
	////////////////////////////echo "<br>SIGUE LA IF DE MPIO<br>";
	/////////////echo "<br>SIGUE LA IF DE MPIO<br>";
	// Buscar incident_id que tengan el departamento seleccionado
	$form_responsesm = ORM::factory('form_response')->where('form_field_id', 347);
		if (!empty($mpio_selected))
			{
				$form_responsesm =$form_responsesm->where('form_response', $mpio_selected);
			}				
	$form_responsesm =$form_responsesm->find_all();			
		foreach ($form_responsesm as $frm) 
			{
				$mpio_incident_ids[] = $frm->incident_id;
			}


	$time = time() - ($range*86400);
	$range_date = date('Y-m-d', $time);
	
	if( count($dpto_incident_ids) >0  && count($mpio_incident_ids) >0)
		{	
			/////////////echo "<br>LOS 3 ARRAY ESTAN LLENOS :::<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $mpio_incident_ids);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
	
	//mr_k ::: se consultan los incidentes 
	$losincidentes = ORM::factory('incident')
		->where('incident_date >=', $dp1)
		->where('incident_date <=', $dp2)
		->where('incident_date >', $range_date);	
		if ($mpio_selected &&  $dpto_selected) 
				{
					///////////////////////////echo"ENTRE mpio_selected &&  dpto_selected<br>";				
					$id_iguales_array = array_intersect($dpto_incident_ids,$mpio_incident_ids);
					$losincidentes = $losincidentes->in('id', $id_iguales_array);
				}
		else
			{
				if ($dpto_selected) 
				{
					///////////////////////////echo"ENTRE dpto_selected<br>";
					$losincidentes = $losincidentes->in('id', $dpto_incident_ids);
				}
				if ($mpio_selected) 
				{
					///////////////////////////echo"ENTRE mpio_selected<br>";
					$losincidentes = $losincidentes->where('id', $mpio_selected);
				}
			}		

			$losincidentes = $losincidentes->find_all();
	//->find_all();
	$flag=0;
		/*if ($approved) 
			{
				$reports = $reports->where('incident_active', '1');
			}*/
	foreach ($losincidentes as $ic) {
				$incident_id_array[] = $ic->id;
				$flag=1;
			}
	/////////////////////////////echo"<br>:::::::YYYYYYYYYYYYY::: array incident_id_array<br>";
	//var_dump($losincidentes);
	////////////////echo"<br>";
	

	
    foreach ($form_fields as $form_field)
    {
	       /////////////////////////////echo"<br>::::::::::2 array form_fields<br>";
	//	/////////////////////////print_r($form_field->field_default);
		// Obtener el valor del campo por defecto (las opciones)
			$raw_options = $form_field->field_default;

			// Convertir las opciones en un array, quitando espacios en blanco y vacíos
			$options = array_filter(array_map('trim', explode(',', $raw_options)));

			// Mostrar el resultado limpio
	//		//////////////echo"<pre>OPCTIONS::: ";
	//		/////////////////////////print_r($options);
	//		//////////////echo"</pre>";     

		
    }
	//		//////////////echo"<pre>incident_id_array::: ";
	//		/////////////////////////print_r($incident_id_array);
	//		//////////////echo"</pre>"; 
		

		if($flag==1){
	/////////////////////////////echo"<pre>ENTRE EN EL flag==1::: <br>";

			foreach ($options as $option)
			{
			if (empty($option)) continue;
			// Contar los incidentes  por respuesta
			$report_count = ORM::factory('form_response')
				->in('incident_id',$incident_id_array)
				->where('form_field_id', $variable)
				->where('form_response', $option)
				->count_all();
	//			//////////////echo"<pre> CONSULTA SQL: ";
	//			/////////////////////////print_r($report_count);
	//			//////////////echo"</pre>";     


			// Inicializar si no existe
			if (!isset($results[$option])) {
				$results[$option] = array('label' => $option, 'report_count' => 0);
			}

			// Sumar al conteo
			$results[$option]['report_count'] += $report_count;
		}

	}	
	else{
		foreach ($options as $option)
		{
							$results[$option] = array('label' => $option, 'report_count' => 0);

		}

	}	
		

	////////////////echo"<br>SIGUE <br>";
	///////////////////////////print_r($results);
	////////////////echo"<br>SIGUE <br>";
	//var_dump($results);
	/**/
    // Reindexar para que sea un array numérico
    return array_values($results);
}


//mr_k ::: estadistica de categorias padres
 //categoria padre dpto y municipio independiente
	static function get_report_statscatdptompio($approved = FALSE, $by_time = FALSE, $range = NULL, $dp1 = NULL, $dp2 = NULL, $line_chart_data = FALSE, $categoriap = NULL, $dpto_selected = NULL,$mpio_selected= NULL,$formu_selected=NULL)
	{
		if ($range === NULL)
		{
			$range = 100000;
		}

		if ($dp1 === NULL)
		{
			$dp1 = 0;
		}

		if ($dp2 === NULL)
		{
			$dp2 = '3000-01-01';
		}

		//mr_k::: se definen los array
		$dpto_incident_ids = array();
		$mpio_incident_ids = array();	
		$subcat_ids = array();
		$incident_id_array = array();
		$id_iguales_array = array();
		$id_iguales_arraycp = array();
		$id_iguales_arraycp_sub = array();
		$id_ia="";
		$subcat_ids_c="";
		$valorcero=0;

		// Set up the range calculation
		$time = time() - ($range*86400);
		$range_date = date('Y-m-d', $time);

		//http://devmisionmedica.sytes.net/index.php/admin/stats/reports_catdptompio?dp1=2021-11-28&dp2=2025-09-03&formu_campo=0&dpto=5&mpio=&categoriap=0&range=10000
		//se consulta las categoarias padres
		if($categoriap==0 && $dpto_selected==0 && $mpio_selected==0){
			//echo "<br>TODS EN CERO<br>";
			$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
		}
		
		//echo "<br>SIGUE LA CONSULTA DE formu_selected<br>";
		print_r($formu_selected);
		if($formu_selected==NULL || $formu_selected==0){
			$formu_selected=346;
		}

		
		//mr_k ::: inicia busqueda por el campo Dpto del select
		//echo "<br>SIGUE LA CONSULTA DE DPTO".$dpto_selected."<br>".$formu_selected;		
		if (!empty($dpto_selected)) 
			{
				//echo "<br>SIGUE LA IF DE DPTO<br>";
				// Buscar incident_id que tengan el departamento seleccionado
				$form_responses = ORM::factory('form_response')
					->where('form_field_id', $formu_selected)
					->where('form_response', $dpto_selected)
					->find_all();		
					print_r($form_responses->count());
				
				foreach ($form_responses as $fr) {
					//echo "<br>fr->incident_id ::: ".$fr->incident_id;
					$dpto_incident_ids[] = $fr->incident_id;
				}

				print_r($dpto_incident_ids);		
			}
		////////////////////echo "<br>SIGUE LA IF DE MPIO<br>";
		if (!empty($mpio_selected)) 
			{
				$elmunicipio=$formu_selected+1;
				/////////////echo "<br>SIGUE LA IF DE MPIO<br>";
				// Buscar incident_id que tengan el departamento seleccionado
				$form_responses = ORM::factory('form_response')
				->where('form_field_id', $elmunicipio)
				->where('form_response', $mpio_selected)
				->find_all();		
			
				foreach ($form_responses as $fr) {
					$mpio_incident_ids[] = $fr->incident_id;
				}

				/////////////////////////print_r($mpio_incident_ids);		
			}
		
		//echo "<br>SIGUE LA CONSULTA DE CATEGORIA<br> valor de la categoria ::: ".$categoriap." :::<br>";

		if (!empty($categoriap)) 
			{
				echo "<br>SIGUE EN EL IF CATEGORIA<br>";
				// Obtener IDs de subcategorías de la categoría padre seleccionada			
				$subcategories = ORM::factory('category')->where('parent_id', $categoriap)->find_all();			
			
				foreach ($subcategories as $sub) {
					$subcat_ids[] = $sub->id;
				}
				//$subcat_ids = [180, 181, 182, 183, 184, 186, 187, 205];
				
				// Obtener IDs de incidentes que tienen esas subcategorías
				$incident_ids = ORM::factory('incident_category')
									->in('category_id', $subcat_ids)
									->find_all();
				$reports_categories = $incident_ids;					
				
				
				foreach ($incident_ids as $ic) {
					$incident_id_array[] = $ic->incident_id;
				}

				$incident_id_array = array_unique(array_filter($incident_id_array, 'is_numeric'));		
			
			}

			if ($categoriap==0 && $dpto_selected!=0){
				echo "<br>1913 SIGUE EN ELSE CATEGORIA<br>".$dpto_selected;
					$subcategories = ORM::factory('category')->where('parent_id <>', $categoriap)->find_all();
					foreach ($subcategories as $sub) {
					$subcat_ids[] = $sub->id;
					}	
					// Obtener IDs de incidentes que tienen esas subcategorías
				$incident_ids = ORM::factory('incident_category')
									->in('category_id', $subcat_ids)
									->find_all();
				$reports_categories = $incident_ids;					
				
				
				foreach ($incident_ids as $ic) {
					$incident_id_array[] = $ic->incident_id;
				}

				$incident_id_array = array_unique(array_filter($incident_id_array, 'is_numeric'));	
				
			}

		////echo "<br>LOS ARRAY dpto_incident_ids <br>";
	   // print_r($reports_categories);
		//echo "<br>LOS ARRAY incident_id_array <br>";
		print_r($incident_id_array);
		////echo "<br>LOS ARRAY mpio_incident_ids <br>";
		//print_r($mpio_incident_ids);
		

		//mr_k ::: se validan los select 
		// Buscar incident_id que tengan el departamento seleccionado y la categoria seleccionada
		//los 3
		if(count($incident_id_array) > 0 && count($dpto_incident_ids) >0  && count($mpio_incident_ids) >0)
		{	
			/////////////echo "<br>LOS 3 ARRAY ESTAN LLENOS :::<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $incident_id_array,$mpio_incident_ids);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// categorias y dpto
		if (count($incident_id_array) > 0 && count($dpto_incident_ids) >0  && count($mpio_incident_ids) == 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $incident_id_array);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// categorias y mpio
		if (count($incident_id_array) > 0 && count($dpto_incident_ids) == 0  && count($mpio_incident_ids) > 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array = array_intersect($mpio_incident_ids, $incident_id_array);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		//categoria sola
		if (count($incident_id_array) > 0 && count($dpto_incident_ids) == 0  && count($mpio_incident_ids) == 0) 
		{	
			//////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array =  $incident_id_array;
			////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// dpto y mpio
		if (count($incident_id_array) == 0 && count($dpto_incident_ids) >0  && count($mpio_incident_ids) > 0) 
		{	
			/////////////echo "<br>LOS 2 ARRAY ESTAN LLENOS XXXXXX<br>";
			$id_iguales_array = array_intersect($dpto_incident_ids, $mpio_incident_ids);
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// mpio solo
		if (count($incident_id_array) == 0 && count($dpto_incident_ids) == 0  && count($mpio_incident_ids) > 0) 
		{	
			/////////////echo "<br>1 LOS 2 ARRAY ESTAN VACIOS incident_id_array - dpto_incident_ids<br>";
			$id_iguales_array = $mpio_incident_ids;
			/////////////////////////print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}
		// dpto solo
		if (count($incident_id_array) == 0 && count($dpto_incident_ids) > 0  && count($mpio_incident_ids) == 0) 
		{	
			//echo "<br>LOS 2 ARRAY ESTAN VACIOS incident_id_array - mpio_incident_ids<br>";
			$id_iguales_array = $dpto_incident_ids;
			print_r($id_iguales_array);
			/////////////////echo "<br>LOS ARRAY ESTAN LLENOS <br>";
		}

		
		//mr_k ::: se valida la consulta de dpto y mpio
		//echo "<br>LOS 2 ARRAY id_iguales_array<br>";
		print_r($id_iguales_array);
		$id_ia = "";
		foreach ($id_iguales_array as $idia) {
			//echo "<br>LOS id_ia<br>".$idia;
					$id_ia .= $idia.",";
				}
				////////////////////////echo "<br>fin LOS id_ia<br>";
		$id_ia = rtrim($id_ia, ',');
				//////////////////////echo "<br> VALOR DE dpto_incident_ids ";
				/////////////////////print_r(count($dpto_incident_ids) );	
		

		$query_dpto = "SELECT d.nombre, COUNT(fr.form_response) AS total
			FROM form_response fr
			JOIN form_field ff ON fr.form_field_id = ff.id
			JOIN departamentos d ON fr.form_response = d.Id";
			if($id_ia=="" ){$query_dpto.=" WHERE ff.id = ".$formu_selected." ";}
			else{$query_dpto.=" WHERE fr.incident_id IN($id_ia) AND ff.id = ".$formu_selected." ";} 
			$query_dpto.=" GROUP BY fr.form_response, d.nombre ORDER BY total DESC;";
			$departamentos_count = Database::instance()->query($query_dpto);
			
			$elmunicipio=0;	
			$elmunicipio=$formu_selected+1;
			

		$query_mpio = "SELECT d.nombre, COUNT(fr.form_response) AS total
			FROM form_response fr
			JOIN form_field ff ON fr.form_field_id = ff.id
			JOIN municipios d ON fr.form_response = d.Id";
			if($id_ia==""){$query_mpio.=" WHERE ff.id = ".$elmunicipio."";}
			else{$query_mpio.=" WHERE fr.incident_id IN($id_ia) AND ff.id = ".$elmunicipio."";} 
			$query_mpio.=" GROUP BY fr.form_response, d.nombre ORDER BY total DESC;";
			$municipios_count = Database::instance()->query($query_mpio);	
			
			/////////////////echo"<br>dpto_selected<br>";
			///////////////print_r($dpto_selected);	
			/////////////////echo"<br>departamentos_count<br>";
			///////////////print_r($departamentos_count);	

		if($categoriap == NULL && $dpto_selected== NULL)
		{
			//echo" <br> ESTOY EN EL IF categoriap == NULL && dpto_selected<br>";
	
			$reports = ORM::factory('incident')
				->where('incident_date >=', $dp1)
				->where('incident_date <=', $dp2)
				->where('incident_date >', $range_date);
		
			if ($approved) 
			{
				$reports = $reports->where('incident_active', '1');
			}
		
			$reports = $reports->find_all();
			$reports_categories = ORM::factory('incident_category')->find_all();
			$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
			
			/////////////////echo"<br> REPORTS<br>";
			///////////////print_r($reports);
			////echo"<br>reports_categories<br>";
			//print_r($reports_categories);
			/////////////////echo"<br>parent_categories<br>";
			///////////////print_r($parent_categories);
			/////////////////echo"<br>municipios_count<br>";
			///////////////print_r($municipios_count);			

		}
		else
		{
			//echo" <br> ESTOY EN EL ELSE DONDE VOY HACER EL SQL ::::<br>";
			print_r($subcat_ids);

			if (empty($id_iguales_array)) 
				{
					//echo"<br>NO HAY COINCIDENCIAS ENTRE DPTO Y CATEGORIA<br>";
					$reports = array(); // No hay reportes
					//return array(); // Evita hacer la consulta inválida
					$reports_categories = ORM::factory('incident_category')->find_all();
				}
			
			else{
					////echo" <br>2083 ESTOY EN EL ELSE DONDE VOY HACER EL SQL<br>".$id_iguales_array;
					$reports = ORM::factory('incident')
					->in('id', $id_ia)
					//->in('id', $id_iguales_array)
					->where('incident_date >=', $dp1)
					->where('incident_date <=', $dp2)
					->where('incident_date >', $range_date)
					->find_all();
					//$reports = $reports_query->find_all();
					//$reports = $reports->find_all();
					$reports_categories = ORM::factory('incident_category')
					->in('incident_id', $id_iguales_array)
					->in('category_id', $subcat_ids)
					->find_all();	
					//echo"<br>reports_query reports ::::::::::<br>";
					if(!empty($categoriap)){
						//echo" <br>222222 ESTOY EN EL IF<br>";
						$parent_categories = ORM::factory('category')->where('id', $categoriap)->find_all(); // Obtener categorías padre

					}
					else{
						//echo" <br>2104 ESTOY EN EL ELSE<br>";
							$sql_parenta = 	"SELECT Distinct cp.parent_id,cp.id
									FROM incident_category ic
									JOIN category cp ON ic.category_id = cp.id
									LEFT JOIN category c_parent ON cp.parent_id = c_parent.id
									WHERE ic.incident_id IN (" . implode(',', $id_iguales_array) . ")
									ORDER BY c_parent.category_title";
					$parent_categoriesa = Database::instance()->query($sql_parenta);
					foreach ($parent_categoriesa as $pca) 
						{
							$id_iguales_arraycp[] = $pca->parent_id;
							$subcat_ids_c.= $pca->id.",";
							$id_iguales_arraycp_sub[] = $pca->id;
							
						}	

					$parent_categories = ORM::factory('category')
					->in('id', $id_iguales_arraycp)
					->where('parent_id', 0)->find_all();
					
					}
					
					 // Obtener categorías padre
					//$parent_categories_p = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre

					//////echo"<br>reports_query reports ::::::::::<br>";
					////print_r($reports);	
					////echo"<br>reports_query reports_categories::::::::::<br>";
					//print_r($reports_categories);	
					//////echo"<br>reports_query parent_categories::::::::::<br>";
					////print_r($parent_categories);
					//////echo"<br>reports_query id_iguales_arraycp::::::::::<br>";
					////print_r($id_iguales_arraycp);	
					////////echo"<br>reports_query parent_categories_p::::::::::<br>";
					//////print_r($parent_categories_p);	
				}				
		}
				
		// Initialize arrays so we don't error out
		$report_data = array();
		$verified_counts = array();
		$approved_counts = array();
		$all = array();
		$earliest_timestamp = 32503680000; // Year 3000 in epoch so we can catch everything less than this.
		$latest_timestamp = 0;
		$incidenteshijos=0;
		$incidenteshijost=0;
		// Gather some data into an array on incident reports
		$num_reports = 0;
		
		foreach ($reports as $report)
		{		
			$timestamp = (string) strtotime(substr($report->incident_date,0,10));
			$report_data[$report->id] = array(
				'date'=>$timestamp,
				'mode'=>$report->incident_mode,
				'active'=>$report->incident_active,
				'verified'=>$report->incident_verified
			);

			if ($timestamp < $earliest_timestamp)
			{
				$earliest_timestamp = $timestamp;
			}

			if ($timestamp > $latest_timestamp)
			{
				$latest_timestamp = $timestamp;
			}

			if ( ! isset($verified_counts['verified'][$timestamp]))
			{
				$verified_counts['verified'][$timestamp] = 0;
				$verified_counts['unverified'][$timestamp] = 0;
				$approved_counts['approved'][$timestamp] = 0;
				$approved_counts['unapproved'][$timestamp] = 0;
				$all[$timestamp] = 0;
			}

			$all[$timestamp]++;

			if ($report->incident_verified == 1)
			{
				$verified_counts['verified'][$timestamp]++;
			}
			else
			{
				$verified_counts['unverified'][$timestamp]++;
			}

			if ($report->incident_active == 1)
			{
				$approved_counts['approved'][$timestamp]++;
			}
			else
			{
				$approved_counts['unapproved'][$timestamp]++;
			}
			$num_reports++;
		}
		//mr_k ::: se definen los array
		$category_counts = array();
		$parent_category_counts = array(); // Nuevo array para contar reportes por categoría padre
		$dpto_counts=array();
		$mpio_counts=array();
		$lowest_date = 9999999999; // Really far in the future.
		$highest_date = 0;
		$incidenteshijost=0;
		//$subcat_ids_c = "";
		//mr_k :::  Count up reports per category
		foreach ($reports_categories as $report)
		{
			// If this report category doesn't have any reports (in case we are only
			//  looking at approved reports), move on to the next one.
			if ( ! isset($report_data[$report->incident_id]))
				continue;

			$c_id = $report->category_id;
			
			
			$timestamp = $report_data[$report->incident_id]['date'];
			////////////////echo" <br> ESTOY timestamp ::::<br>";
			///////////////////////////print_r($id_iguales_array);

			if ($timestamp < $lowest_date)
			{
				$lowest_date = $timestamp;
			}

			if ($timestamp > $highest_date)
			{
				$highest_date = $timestamp;
			}

			if ( ! isset($category_counts[$c_id][$timestamp]))
			{
				$category_counts[$c_id][$timestamp] = 0;
			}

			$category_counts[$c_id][$timestamp]++;
		}

		// Contar los reportes asociados a cada categoría padre
		$incidenteshijost=0;
		$incidenteshijos=0;
		$subcat_ids_c = rtrim($subcat_ids_c, ',');
		//$parent_categories = ORM::factory('category')->where('parent_id', 0)->find_all(); // Obtener categorías padre
		////////echo"<br> Contar los reportes asociados a cada categoría padre<br>";
		//////print_r($parent_categories);
		/////////////echo"<br>";
		$incidenteshijos=0;
		foreach ($parent_categories as $parent) 
		{
			////////echo"<br> se busca por el parent id :::: ".$parent->id."<br>";
			////////print_r($parent);		
			$parent_category_counts[$parent->id] = array(
				'name' => $parent->category_title,
				'count' => 0
			);
			////////echo"<br> Resultado parent_category_counts<br>";
			//////print_r($parent_category_counts);	
			$subcategories = ORM::factory('category');
			if($id_iguales_arraycp_sub != NULL){
						$subcategories=$subcategories->in('id', $subcat_ids_c);
					}
			
			$subcategories=$subcategories->where('parent_id', $parent->id)->find_all();





			
			////////echo"<br> Resultado subcategories<br>";
			//////print_r($subcategories);

			$incidenteshijost=0;
			foreach ($subcategories as $sub) {
				/////////////echo"<BR>CONTEO DE CATEGORIAS<BR>";
				///////////print_r($category_counts);
				//////////echo"<BR>CONTEO DE SUB ID<BR>";
				////////print_r($sub->id);
				if (isset($category_counts[$sub->id])) {
					
					/////////////echo"<BR>SI EXISTE SUB ID<BR>";
					$incidenteshijos=ORM::factory('incident_category');
					if($id_iguales_array != NULL){
						$incidenteshijos=$incidenteshijos->in('incident_id', $id_iguales_array);
					}
					$incidenteshijos=$incidenteshijos->where('category_id', $sub->id)->count_all();	
					//////////echo"<br> TOTAL incidenteshijos ";
					////////print_r($incidenteshijos);				
				}
			
				$incidenteshijost+=$incidenteshijos;
				/////////////echo"<br> TOTAL FINAL incidenteshijost :::: ";
				///////////print_r($incidenteshijost);
			
			}
			//////////echo"<br> TOTAL RRRRRRR : ";
			////////print_r($incidenteshijost);
		
			$parent_category_counts[$parent->id]['count'] =$incidenteshijost;
			/////////////////////echo"<br> TOTAL parent_category_counts : ";
			/////////////////////echo"<br> parent->id parent_category_counts : ".$parent->id."<br>";
			///////////////////print_r("<br>VALOR ".$parent_category_counts[$parent->id]['count']);
		}	
		
		//se hace el conteo por departamento
		foreach ($departamentos_count as $dpto) 
		{			
			$dpto_counts[] = array(
				'name' => $dpto->nombre,
				'count' => $dpto->total
			);		

		}	
		/////////////////////////echo"<br>dpto_counts<br>";
		///////////////////////print_r($dpto_counts);	
		//se hace el conteo por municipio
		foreach ($municipios_count as $mpio) 
		{
			
			$mpio_counts[] = array(
				'name' => $mpio->nombre,
				'count' => $mpio->total
			);		

		}	
		
		// Populate date range
		$date_range = array();
		$add_date = $lowest_date;
		while ($add_date <= $highest_date)
		{
			$date_range[] = $add_date;
			$add_date += 86400;
		}

		// Zero out days that don't have a count
		foreach ($category_counts as & $arr)
		{
			foreach ($date_range as $timestamp)
			{
				if ( ! isset($arr[$timestamp]))
				{
					$arr[$timestamp] = 0;
				}

				if ( ! isset($verified_counts['verified'][$timestamp]))
				{
					$verified_counts['verified'][$timestamp] = 0;
				}

				if ( ! isset($verified_counts['unverified'][$timestamp]))
				{
					$verified_counts['unverified'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['approved'][$timestamp]))
				{
					$approved_counts['approved'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['unapproved'][$timestamp]))
				{
					$approved_counts['unapproved'][$timestamp] = 0;
				}

				if ( ! isset($all[$timestamp]))
				{
					$all[$timestamp] = 0;
				}

			}
			// keep dates in order
			ksort($arr);
			ksort($verified_counts['verified']);
			ksort($verified_counts['unverified']);
			ksort($approved_counts['approved']);
			ksort($approved_counts['unapproved']);
			ksort($all);

		}

		// Add all our data sets to the array we are returning
		$data['category_counts'] = $category_counts;
		$data['verified_counts'] = $verified_counts;
		$data['approved_counts'] = $approved_counts;
		$data['dpto_counts'] = $dpto_counts;
		$data['mpio_counts'] = $mpio_counts;
		$data['all']['all'] = $all;

		// I'm just tacking this on here. However, we could improve performance
		//   by implementing the code above but I just don't have the time
		//   to mess with it.
		if ($by_time)
		{
			// Reorder the array. Is there a built in PHP function that can do this?
			$new_data = array();
			foreach ($data as $main_key => $data_array)
			{
				foreach ($data_array as $key => $counts)
				{

					if ($line_chart_data == FALSE)
					{
						foreach ($counts as $timestamp => $count)
						{
							$new_data[$main_key][$timestamp][$key] = $count;
						}
					}
					else
					{
						foreach ($counts as $timestamp => $count)
						{
							$timestamp_key = (string) ($timestamp*1000);
							if ( ! isset($new_data[$main_key][$timestamp_key]))
							{
								$new_data[$main_key][$timestamp_key] = 0;
							}
							$new_data[$main_key][$timestamp_key] += $count;
						}
					}
				}
			}

			$data = $new_data;

		}

		if ($line_chart_data == FALSE)
		{
			$data['total_reports'] = $num_reports;
			$data['total_categories'] = count($category_counts);
			$data['earliest_report_time'] = $earliest_timestamp;
			$data['latest_report_time'] = $latest_timestamp;
			$data['parent_categories'] = $parent_category_counts; // Agregar las categorías padre al array de datos
		}

		return $data;
	}


/*
	* get an array of report counts
	* @param approved - Only count approved reports if true
	* @param by_time - Format array with timestamp as the key if true
	* @param range - Number of days back from today to pull reports from. Will end up defaulting to 100000 days to get them all.
	* @param dp1 - Arbitrary date range. Low date. YYYY-MM-DD
	* @param dp2 - Arbitrary date range. High date. YYYY-MM-DD
	*/
	static function get_location_stats($approved=FALSE, $by_time=FALSE, $range=NULL, $dp1=NULL, $dp2=NULL, $line_chart_data=FALSE)
	{
		if ($range === NULL)
		{
			$range = 100000;
		}

		if ($dp1 === NULL)
		{
			$dp1 = 0;
		}

		if ($dp2 === NULL)
		{
			$dp2 = '3000-01-01';
		}

		// Set up the range calculation
		$time = time() - ($range*86400);
		$range_date = date('Y-m-d', $time);

		// Only grab approved
		if ($approved)
		{
			$reports = ORM::factory('incident')
			    ->where('incident_active', '1')
			    ->where('incident_date >=', $dp1)
			    ->where('incident_date <=',$dp2)
			    ->where('incident_date >', $range_date)
			    ->find_all();
		}
		else
		{
			$reports = ORM::factory('incident')
			    ->where('incident_date >=', $dp1)
			    ->where('incident_date <=', $dp2)
			    ->where('incident_date >', $range_date)
			    ->find_all();
		}
		/////////////////////////print_r($reports);

		$reports_categories = ORM::factory('location')->find_all();
		//////////////echo"<br>";
		/////////////////////////print_r($reports_categories);

		// Initialize arrays so we don't error out
		$report_data = array();
		$verified_counts = array();
		$approved_counts = array();
		$all = array();
		$earliest_timestamp = 32503680000; // Year 3000 in epoch so we can catch everything less than this.
		$latest_timestamp = 0;

		// Gather some data into an array on incident reports
		$num_reports = 0;
		foreach ($reports as $report)
		{
			$timestamp = (string) strtotime(substr($report->incident_date,0,10));
			$report_data[$report->id] = array(
				'date'=>$timestamp,
				'mode'=>$report->incident_mode,
				'active'=>$report->incident_active,
				'verified'=>$report->incident_verified
			);

			if ($timestamp < $earliest_timestamp)
			{
				$earliest_timestamp = $timestamp;
			}

			if ($timestamp > $latest_timestamp)
			{
				$latest_timestamp = $timestamp;
			}

			if ( ! isset($verified_counts['verified'][$timestamp]))
			{
				$verified_counts['verified'][$timestamp] = 0;
				$verified_counts['unverified'][$timestamp] = 0;
				$approved_counts['approved'][$timestamp] = 0;
				$approved_counts['unapproved'][$timestamp] = 0;
				$all[$timestamp] = 0;
			}

			$all[$timestamp]++;

			if ($report->incident_verified == 1)
			{
				$verified_counts['verified'][$timestamp]++;
			}
			else
			{
				$verified_counts['unverified'][$timestamp]++;
			}

			if ($report->incident_active == 1)
			{
				$approved_counts['approved'][$timestamp]++;
			}
			else
			{
				$approved_counts['unapproved'][$timestamp]++;
			}
			$num_reports++;
		}

		$category_counts = array();
		$lowest_date = 9999999999; // Really far in the future.
		$highest_date = 0;
		foreach ($reports_categories as $report)
		{
			// If this report category doesn't have any reports (in case we are only
			//  looking at approved reports), move on to the next one.
			if ( ! isset($report_data[$report->incident_id]))
				continue;

			$c_id = $report->category_id;
			$timestamp = $report_data[$report->incident_id]['date'];

			if ($timestamp < $lowest_date)
			{
				$lowest_date = $timestamp;
			}

			if ($timestamp > $highest_date)
			{
				$highest_date = $timestamp;
			}

			if ( ! isset($category_counts[$c_id][$timestamp]))
			{
				$category_counts[$c_id][$timestamp] = 0;
			}

			$category_counts[$c_id][$timestamp]++;
		}

		// Populate date range
		$date_range = array();
		$add_date = $lowest_date;
		while ($add_date <= $highest_date)
		{
			$date_range[] = $add_date;
			$add_date += 86400;
		}

		// Zero out days that don't have a count
		foreach ($category_counts as & $arr)
		{
			foreach ($date_range as $timestamp)
			{
				if ( ! isset($arr[$timestamp]))
				{
					$arr[$timestamp] = 0;
				}

				if ( ! isset($verified_counts['verified'][$timestamp]))
				{
					$verified_counts['verified'][$timestamp] = 0;
				}

				if ( ! isset($verified_counts['unverified'][$timestamp]))
				{
					$verified_counts['unverified'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['approved'][$timestamp]))
				{
					$approved_counts['approved'][$timestamp] = 0;
				}

				if ( ! isset($approved_counts['unapproved'][$timestamp]))
				{
					$approved_counts['unapproved'][$timestamp] = 0;
				}

				if ( ! isset($all[$timestamp]))
				{
					$all[$timestamp] = 0;
				}

			}
			// keep dates in order
			ksort($arr);
			ksort($verified_counts['verified']);
			ksort($verified_counts['unverified']);
			ksort($approved_counts['approved']);
			ksort($approved_counts['unapproved']);
			ksort($all);

		}

		// Add all our data sets to the array we are returning
		$data['category_counts'] = $category_counts;
		$data['verified_counts'] = $verified_counts;
		$data['approved_counts'] = $approved_counts;
		$data['all']['all'] = $all;

		// I'm just tacking this on here. However, we could improve performance
		//   by implementing the code above but I just don't have the time
		//   to mess with it.
		if ($by_time)
		{
			// Reorder the array. Is there a built in PHP function that can do this?
			$new_data = array();
			foreach ($data as $main_key => $data_array)
			{
				foreach ($data_array as $key => $counts)
				{

					if ($line_chart_data == FALSE)
					{
						foreach ($counts as $timestamp => $count)
						{
							$new_data[$main_key][$timestamp][$key] = $count;
						}
					}
					else
					{
						foreach ($counts as $timestamp => $count)
						{
							$timestamp_key = (string) ($timestamp*1000);
							if ( ! isset($new_data[$main_key][$timestamp_key]))
							{
								$new_data[$main_key][$timestamp_key] = 0;
							}
							$new_data[$main_key][$timestamp_key] += $count;
						}
					}
				}
			}

			$data = $new_data;

		}

		if ($line_chart_data == FALSE)
		{
			$data['total_reports'] = $num_reports;
			$data['total_categories'] = count($category_counts);
			$data['earliest_report_time'] = $earliest_timestamp;
			$data['latest_report_time'] = $latest_timestamp;
		}

		return $data;
	}


	public static function get_location_report_stats($range = 10000, $dp1 = null, $dp2 = null)
{
    $results = array();

    // Definir fecha de inicio y fin
    if (!empty($dp1) && !empty($dp2)) {
        $start = date('Y-m-d H:i:s', strtotime($dp1));
        $end = date('Y-m-d H:i:s', strtotime($dp2));
    } else {
        $start = date('Y-m-d H:i:s', time() - ($range * 86400));
        $end = date('Y-m-d H:i:s');
    }

    // Obtener todas las ubicaciones
    $locations = ORM::factory('location')->find_all();
	///////////////////////////print_r($locations);

    foreach ($locations as $location)
    {
        // Contar los incidentes activos por ubicación en el rango de fechas
        $report_count = ORM::factory('incident')
           
            ->where('location_id', $location->id)
            ->where('incident_date >=', $start)
            ->where('incident_date <=', $end)
            ->count_all();
		
        // Agrupar por location_name
        $name = $location->location_name;

        if (!isset($results[$name])) {
            $results[$name] = array(
                'location_name' => $name,
                'report_count' => 0
            );
        }

        // Acumular el total por nombre
        $results[$name]['report_count'] += $report_count;
    }
	/////////////////////////print_r($results);
    // Reindexar para que sea un array numérico
    return array_values($results);
}

	

	/**
	 * Creates a new site in centralized stat tracker
	 * @param sitename - name of the instance
	 * @param url - base url
	 */
	public static function create_site( $sitename, $url)
	{

				
		$stat_url = Kohana::config('config.external_site_protocol').'://tracker.ushahidi.com/px.php?task=cs&sitename='.urlencode($sitename).'&url='.urlencode($url);
		
		//$stat_url = Kohana::config('config.external_site_protocol').'://tracker.ushahidi.com/px.php?task=cs&sitename='.urlencode($sitename).'&url=https://devmisionmedica.sytes.net/';


		// Ignore errors since we are error checking later

		$xml = simplexml_load_string(self::_curl_req($stat_url));
    //  $xml = simplexml_load_string(Stats_Model::_curl_req($stat_url));

		if ($xml === false)
		{
			return false;
		}

		$stat_id = (string) $xml->id[0];
		$stat_key = (string) $xml->key[0];

		if ($stat_id > 0)
		{
			Settings_Model::save_setting('stat_id', $stat_id);
			Settings_Model::save_setting('stat_key', $stat_key);
			return $stat_id;
		}

		return false;
	
	}

	/**
	 * Helper function to send a cURL request
	 * @param url - URL for cURL to hit
	 */
	public function _curl_req( $url )
	{
		// Make sure cURL is installed
		if ( ! function_exists('curl_exec')) {
			throw new Kohana_Exception('stats.cURL_not_installed');
			return false;
		}

		$curl_handle = curl_init();
		curl_setopt($curl_handle,CURLOPT_URL,$url);

		// Timeout set to 15 seconds. This is somewhat arbitrary and can be changed.

		curl_setopt($curl_handle,CURLOPT_CONNECTTIMEOUT, 15);

		// Set curl to store data in variable instead of //////////////////////print

		curl_setopt($curl_handle,CURLOPT_RETURNTRANSFER,1);
		curl_setopt($curl_handle,CURLOPT_SSL_VERIFYPEER,false);
		$buffer = curl_exec($curl_handle);
		curl_close($curl_handle);

		return $buffer;
	}

	public function get_parent_categories_with_counts()
    {
        $query = Database::instance()->query(
			"SELECT c.id, c.category_title AS name, COUNT(r.id) AS count
			FROM category c
			LEFT JOIN incident_category ic ON c.id = ic.category_id
			LEFT JOIN incident r ON ic.incident_id = r.id
			WHERE c.parent_id = 0
			GROUP BY c.id"
		);
		return $query->as_array();
		
    }
	
	public static function dpto_municipio_crue($dpto)
	{

		// Obtiene los municipios filtrados por el departamento seleccionado
		$parents_arraympio = ORM::factory('ips')
        ->where('crue_id', $dpto)
        ->select_list('Id', 'nombre_ips');

  		  return $parents_arraympio; // Devuelve los municipios en JSON
	}



}
