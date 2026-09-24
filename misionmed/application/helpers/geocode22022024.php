<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Geocode helper class
 *
 * Portions of this class credited to: zzolo, phayes, tmcw, brynbellomy, bdragon
 *
 * @package    Geocode
 * @author     Ushahidi Team
 * @copyright  (c) 2008 Ushahidi Team
 * @license    http://www.ushahidi.com/license.html
 */


class geocode_Core {

	/**
	 * Geocoding function. Will receive an address and call service configured on map.geocode config
	 *
	 * @param 	string 				Address
	 * @return 	string[]|boolean	Location information [country, country_id, location_name, latitude, longitude], FALSE if unsucessful
	 *
	 */
	static public function geocode($address = NULL) {
		$service = Kohana::config('map.geocode');

		if ($address)
		{
			if (! method_exists('geocode_Core', $service)) {
				throw new Kohana_Exception("'" . $service . "' is not a valid geocode service");			
				return FALSE;
			}

			return self::$service($address);
		}
		else
		{
			return FALSE;
		}
	}

	/**
	 * Geocoding function that uses nominatin engine.
	 * mr_k ::: se actualiza para consumir la api de open street map 08082023 https://nominatim.openstreetmap.org/search?
	 *
	 * @param 	string 				Address
	 * @return 	string[]|boolean	Location information [country, country_id, location_name, latitude, longitude], FALSE if unsucessful
	 *
	 */
	static public function nominatim($address) {
		$payload = FALSE;
		$result = FALSE;

		$params = array(
				"format"			=> "json",
				"addressdetails"	=> 1,
				"accept-language"	=> "en_US", // force country names to come back as english,
				"q"					=> $address,
				"zoom"				=> 200
			);
		//mr_k ::: se modifica debido a cambios en api open street map	
		$url = "https://nominatim.openstreetmap.org/search?" . http_build_query($params);
		Kohana::log('debug',":::: RUTA");
		Kohana::log('debug',$url);
		//.k. ::: cambios iniciales del mapa				 
		$opts = array('http'=>array('header' => "User-Agent:MyAgent/1.0\r\n")); 
		
		//Basically adding headers to the request mr_k ::: adicionado en la primera solucion modificando el header
		$context = stream_context_create($opts);
		$html = file_get_contents($url,false,$context);
		$jsonout = json_decode($html,true);
		
		//mr_k ::: instruccion inicial de la libreria
		$url_request = new HttpClient($url);		
		Kohana::log('debug',"INSTRUCCIONES LIBRERIA");
		Kohana::log('debug',$result);	


		if ($result = $url_request->execute()) 
		{
			$payload = json_decode($result);			
		}
		else
		{
		$payload =$jsonout;
			Kohana::log('error', "Geocode - Nominatin\n" . $url_request->get_error_msg());		
		}

		// TODO: Nomaninatins documentation on error returning is poor - this could be improved to have meaningful error messages
		if (!$payload || count($payload) == 0)
		{
			return FALSE;
		}

		$result = array_pop($payload);
		

		//$country_name = isset($result->address->country) ? $result->address->country : $result->display_name;
		
		//.k. parche para info
		$country_name = $jsonout[0]["address"]["country"];
		$eldisplay_name = $jsonout[0]["display_name"];
		$lalat = $jsonout[0]["lat"];
		$lalon = $jsonout[0]["lon"];
		$elcountry_code=$jsonout[0]["address"]["country_code"];
		
		
		$country = self::getCountryId($country_name);

		// if we can't find the country by name, try finding it by code
		/*.k.
		
		if ($country == 0 && isset($result->address->country_code))
		{
			$country = self::getCountryIdByCode($result->address->country_code);
		}
		*/ 
//.k. 
		$geocodes = array(
			'country' 			=> $country_name,
			'country_id' 		=> $elcountry_code,/*
			'location_name' 	=> $result->display_name,
			'latitude' 			=> $result->lat,
			'longitude' 		=> $result->lon
			*/
			'location_name' 	=> $eldisplay_name,
			'latitude' 			=> $lalat,
			'longitude' 		=> $lalon 
		);

		return $geocodes;
	}

	/**
	 * Geocoding function that uses google engine.
	 *
	 * @param 	string 				Address
	 * @return 	string[]|boolean	Location information [country, country_id, location_name, latitude, longitude], FALSE if unsucessful
	 *
	 */
	static public function google($address) {
		$payload = FALSE;

		$url = Kohana::config('config.external_site_protocol').'://maps.google.com/maps/api/geocode/json?sensor=false&address='.rawurlencode($address);
		$result = FALSE;

		$url_request = new HttpClient($url);

		if ($result = $url_request->execute()) 
		{
			$payload = json_decode($result);
		}
		else
		{
			Kohana::log('error', "Geocode - Google\n" . $url_request->get_error_msg());			
		}

		// Verify that the request succeeded
		if (! isset($payload->status)) return FALSE;
		if ($payload->status != 'OK')
		{
			if ($payload->status != 'ZERO_RESULTS')
			{
				// logs anything different from OK or ZERO_RESULTS
				Kohana::log('error', "Geocode - Google: " . $payload->status);			
			}

			return FALSE;
		}

		// Convert the Geocoder's results to an array
		$all_components = json_decode(json_encode($payload->results), TRUE);

		$result = array_pop($all_components);
		$location = $result['geometry']['location'];

		// Find the country
		$address_components = $result['address_components'];
		$country_name = NULL;
		foreach ($address_components as $component)
		{
			if (in_array('country', $component['types']))
			{
				$country_name  = $component['long_name'];
				break;
			}
		}

		// If no country has been found, use the formatted address
		if (empty($country_name))
		{
			$country_name = $result['formatted_address'];
		}

		$geocodes = array(
			'country' 			=> $country_name,
			'country_id' 		=> self::getCountryId($country_name),
			'location_name' 	=> $result['formatted_address'],
			'latitude' 			=> $location['lat'],
			'longitude' 		=> $location['lng']
		);

		return $geocodes;
	}

	/**
	 * Finds country on deployment database by name
	 * @param 	string 	Country Name
	 * @return 	int 	Country Id if exists, 0 if not
	 *
	 */
	static function getCountryId($country_name) {
		// Grab country_id
		$country = Country_Model::get_country_by_name($country_name);
		return ( ! empty($country) AND $country->loaded)? $country->id : 0;
	}

	/**
	 * Finds country on deployment database by code
	 * @param 	string 	Country Name
	 * @return 	int 	Country Id if exists, 0 if not
	 *
	 */
	static function getCountryIdByCode($country_code) {
		// Grab country_id
		$country = Country_Model::get_country_by_code($country_code);
		return ( ! empty($country) AND $country->loaded)? $country->id : 0;
	}


	/**
	 * Reverse Geocode a point
	 *
	 * @author
	 * @param   double  $latitude
	 * @param   double  $longitude
	 * @return  string  closest approximation of the point as a display name
	 */
	static function reverseGeocode($latitude, $longitude) {
			$service = Kohana::config('map.geocode');
        
		if ($latitude && $longitude)
		{
			$function = "reverse" . ucfirst($service);

			if (! method_exists('geocode_Core', $function)) {
				throw new Kohana_Exception("'" . $service . "' is not a valid geocode service");			
				return FALSE;
			}

			return self::$function($latitude, $longitude);
		}
		else
		{
			return FALSE;
		}		
	}

	/**
	 * Reverse Geocode a point using Nominatin
	 *
	 * Geocoding function that uses nominatin engine.
	 * mr_k ::: se actualiza para consumir la api de open street map 08082023 https://nominatim.openstreetmap.org/search?
	 *$url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=' . $lat . '&lon=' . $lng;
	 * 
	 * @author
	 * @param   double  $latitude
	 * @param   double  $longitude
	 * @return  string  closest approximation of the point as a display name
	 */
	static function reverseNominatim($lat, $lng) {
		if ($lat && $lng)
		{
			$url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=' . $lat . '&lon=' . $lng;

			$request = new HttpClient($url);
			if ( ! $json = $request->execute()) {
				Kohana::log('error', "Geocode - reverseNominatin\n" . $url_request->get_error_msg());

				return FALSE;
			}

			$location = json_decode($json, FALSE);
            
			return $location->display_name;
		}
		else
		{
			return FALSE;
		}
	}

	/**
	 * Reverse Geocode a point using Google Geocode
	 *
	 * @author
	 * @param   double  $latitude
	 * @param   double  $longitude
	 * @return  string  closest approximation of the point as a display name
	 */
	static function reverseGoogle($lat, $lng) {
		if ($lat && $lng)
		{
			$url = Kohana::config('config.external_site_protocol') . '://maps.googleapis.com/maps/api/geocode/json?sensor=false&latlng=' . $lat . "," . $lng;

			$request = new HttpClient($url);
			if ( ! $json = $request->execute()) {
				Kohana::log('error', "Geocode - reverseGoogle\n" . $url . "\n" . $request->get_error_msg());

				return FALSE;
			}

			$location = json_decode($json);

			if ($location->status != 'OK')
			{
				// logs anything different from OK
				Kohana::log('error', "Geocode - reverseGoogle: " . $location->status . " - " . $location->error_message);

				return FALSE;
			}

			if (count($location->results) == 0)
			{
				return FALSE;
			}

			return $location->results[0]->formatted_address;
		}
		else
		{
			return FALSE;
		}
	}



}
