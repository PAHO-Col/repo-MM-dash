<?php
/**
 * @author     John Etherton <john@ethertontech.com>
 * @author     Carter Draper <carjimdra@gmail.com>
 * @author     Kpetermeni Siakor <tksiakor@gmail.com> 
 * @package    Enhanced Map, Ushahidi Plugin - https://github.com/jetherton/enhancedmap
 * @license	   GNU Lesser GPL (LGPL) Rights pursuant to Version 3, June 2007
 * @copyright  2012 Etherton Technologies Ltd. <http://ethertontech.com>
 * @Date	   2012-06-06
 * Purpose:	   Liberian English translation of the Enhanced Map plugin
 * Inputs:     N/A
 * Outputs:    Liberian English translation of Enhanced Map
 *
 * The Enhanced Map, Ushahidi Plugin is free software: you can redistribute
 * it and/or modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The Enhanced Map, Ushahidi Plugin is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with the Enhanced Map, Ushahidi Plugin.  If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Changelog:
 * 2012-06-06:  Etherton - Initial release
 *
 * Developed by Etherton Technologies Ltd.
 */

	$lang = array(
	'admin_map_main_menu_tab' => 'Admin Map',
	'big_map_main_menu_tab' => 'Big Map',
	'print_map_main_menu_tab'=>'Print Map',			
	'boolean_operators' => 'Operadores booleanos:',
	'FILTERS' => 'FILTROS',
	'Categories' => 'Categorias',
	'TIME_LINE' => 'LINEA DE TIEMPO',
	'ORHEADER'  => 'OR',
	'ORBODY' =>				'El operador OR le permite ver todos los informes que pertenecen a cualquiera de las categorías que seleccione.
							<br/><br/>
							Por ejemplo, si seleccionó las categorías A, B y C, verá todos los informes que fueron
etiquetados como pertenecientes a la categoría A <strong> o </strong> B <strong> o </strong> C. Algunos de los informes
los que se muestran solo pueden caer en la categoría A. Otros solo pueden caer en la categoría C. Algunos pueden caer en ambos
categoría A y B. <br/> <br/>
Cuando se selecciona el operador OR, los puntos se colorearán de acuerdo con las categorías seleccionadas.
Por ejemplo, si ha seleccionado las categorías A y B, donde A es rojo y B es azul, todos los puntos serán morados
ya que el púrpura es el color que obtienes al mezclar rojo y azul.',
	'OR' => 'OR',
	'ANDHEADER' => 'AND',
	'ANDBODY' =>				'El operador AND le permite ver todos los informes que se incluyen en todas las categorías que seleccione.<br/><br/>
							Por ejemplo, si seleccionó las categorías A, B y C, verá todos los informes que fueron
etiquetado como perteneciente a la categoría A <strong> y </strong> B <strong> y </strong> C. <br/> <br/>
Cuando se selecciona el operador AND, los puntos se colorearán según las categorías que haya seleccionado.
Como todos los informes que se muestran se incluirán en todas las categorías seleccionadas, todos los colores de las categorías
seleccionado se fusionará y los puntos tendrán el color combinado.',
	'AND' => 'AND',

// Kpetermeni's Entries
	'header_info' => 'Este mapa muestra todos los informes que está autorizado a ver. Esto incluye informes no aprobados.',
	'logical_operators' => 'Operadores logicos',
	'unapproved_reports' => 'Mostrar informes no aprobados como negros',
	'status_filters' => 'Filtros de estado',
	'or' => 'OR',
	'and' => 'AND',
	'or_details' => 'Mostrar todos los informes que se encuentran en al menos una de las categorías seleccionadas a continuación',
	'and_details' => 'Mostrar todos los informes que se encuentran en todas las categorías seleccionadas a continuación',
	'show_all_reports' => 'Mostrar todos los informes',
	'embedd_html' => 'Para incrustar este mapa en su propio sitio, use este HTML:',
	//john's entries
	'group_categories' => 'Groupo Categorias',
	'site_categories' => 'Categorioas del Sitio',
	'whats_this' => 'Qué es esto?',
	'print_a_map' => 'Imprimir un mapa',
	'print_this_map' => 'Imprimir este mapa',
	'map_printing' => 'Impresión de mapa',
	'read_before_printing' => 'Lea antes de imprimir:',
	'printmap_info' => 'Esta página es para crear mapas que se imprimirán.
	La impresión funciona mejor con <strong>Firefox</strong> 4 or higher. <strong>Chrome, Internet Explorer,</strong> 
	ay otros navegadores pueden no imprimir esta página correctamente. .<br/>
	Para obtener los mejores resultados en Firefox, vaya a <strong>"Configuración de página"</strong> and make sure that
	<strong>"Print Background (Colors &amp; Images)"</strong> is turned on and that <strong>scaling</strong> is set to <strong>"scale to fit."</stong>',
	'map_key' => 'Map Key:',
	'map_key_1' => 'Reports from %s to %s.',
	'generate_image' => 'Generar una imagen de este mapa',
	'print_to_image' => 'Imprimir  imagen',
	'generate_url' => 'Genere una URL para compartir este mapa con otros.',
	'map_url' => 'URL para este mapa:',
	'page_url' => 'URL para este pagina:',
	'embed_url' => 'URL  para insertar este mapa:',
	'create_url' => 'Crear URL',
	'share_map' => 'Compartir este mapa',
	'show_key' => 'Mostrar clave:',
	'key_placement' => 'Key Placement:',
	'key_options' => 'Key Options',
	'orientation' => 'Orientation',
	'time_chooser' => 'Selector de tiempo',
	'portrait' => 'Retrato',
	'landscape' => 'Paisaje',
	'logic_str_or' => "Todos los informes en este mapa pertenecen a una o más de las siguientes categorías.",
	'logic_str_and' => "Todos los informes en este mapa pertenecen a todas las siguientes categorías.",
	'left' => 'Izquierda',
	'right' => 'Derecha',
	'up' => 'Arriba',
	'down' => 'Abajo',
	'site_categories' => 'Categorios del Sitio',
	
	//settings
	'enable_bigmap'=>'Enable Big Map menu item on the front end',
	'enable_bigmap_description'=>'Chosing \'Yes\' will cause a \'Big Map\' menu item to appear on the front end of this website. If you choose \'No\' the Big Map page will still be available, only the menu item will be turned off. <br/> <br/> By default the Big Map is enabled.',
	
	'enable_printmap'=>'Enable Print Map menu item on the front end',
	'enable_printmap_description'=>'Chosing \'Yes\' will cause a \'Print Map\' menu item to appear on the front end of this website. If you choose \'No\' the Print Map page will still be available, only the menu item will be turned off. <br/> <br/> By default the Print Map is disabled.',
	
	'enable_iframemap'=>'Enable embed map code on the front end',
	'enable_iframemap_description'=>'Chosing \'Yes\' will cause a text box to appear above the map on the home page that containts the needed HTML to embed the map on another website. If you choose \'No\' the iFrame Map page will still be available, only the text box with the HTML code will be turned off. <br/> <br/> By default the map embed code is enabled.',	
	
	'enable_adminmap'=>'Enable Admin Map on the back end',
	'enable_adminmap_description'=>'Chosing \'Yes\' will cause a \'Admin Map\' menu item to appear on the back end. If you choose \'No\' both the menu item and the Admin Map page will be disabled. <br/> <br/> By default the Admin Map is enabled.',
	
	'adminmap_height'=>'Height of Admin Map',
	'adminmap_height_description'=>'Sets the height of the Admin Map. Use CSS notation. If you want 3rd party CSS to determine the sizing set the value to \'other\'<br/><br/>By default the Admin Map height is set to \'other\'',
	
	'adminmap_width'=>'Width of Admin Map',
	'adminmap_width_description'=>'Sets the width of the Admin Map. Use CSS notation. If you want 3rd party CSS to determine the sizing set the value to \'other\'<br/><br/>By default the Admin Map height is set to \'other\'',
	
	'show_unapproved_backend'=>'Allow users to see unapproved reports on the back end',
	'show_unapproved_backend_description'=>'Chosing \'Yes\' will allow users on the back end to see unapproved reports on the map.<br/><br/>By default this is enabled.',
	
	'show_unapproved_frontend'=>'Allow users to see unapproved reports on the front end',
	'show_unapproved_frontend_description'=>'Chosing \'Yes\' will allow users on the front end to see unapproved reports on the map.<br/><br/>By default this is disabled.',
	
	'show_hidden_categories_backend'=>'Allow users to see hidden categories on the back end',
	'show_hidden_categories_backend_description'=>'Chosing \'Yes\' will allow users on the back end to see and filter by hidden categories.<br/><br/>By default this is enabled.',
	
	'enhancedmap_settings'=>'Enhanced Map Settings',
	
	'adminmap_width_required'=>'Width of Admin Map must not be empty',
	'adminmap_height_required'=>'Height of Admin Map must not be empty',
	
	'color_options_description'=>'Determines how the dots of the map are colored when more than one category is being used as a filter.',
	'color_options'=>'How should the dots be colored',
	
	'merge_all_description'=>' <strong>Merge all.</strong> All the colors of the selected categories will be merged together for the resultant color of all dots. Lowest database load.',
	'highest_first_description'=>' <strong>Highest takes precedence</strong>. Colors will be assigned per dot, with the higest ranking category taking precedence. Highest database load.',
	
	'size_of_dots'=>'Tamaño de puntos',
	'size_of_dots_description'=>'¿Qué tan grande o pequeño quieres que sean los puntos que aparecen en el mapa??',
	'small'=>'Pequeño',
	'medium'=>'Medio',
	'large'=>'Grande',
	'exlarge'=>'Extra-Grande',
	
	'alphabetize'=>'Alfabetizar',
	'clustering'=>'Agrupamiento',
	'on'=>'On',
	'off'=>'Off',

);
	
