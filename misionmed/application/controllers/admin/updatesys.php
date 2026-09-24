<?php defined('SYSPATH') or die('No direct script access.');
/**
 * This controller is used to actualizar el sistema 
 *æ
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     @mr_k
 * SinergiaInformatik
 */

class Updatesys_Controller extends Admin_Controller {

	private $display_roles = FALSE;

	public function __construct()
	{
		parent::__construct();

		$this->template->this_page = 'updatesys';

		// If user doesn't have access, redirect to dashboard
		if (!$this->auth->has_permission("updatesys"))
		{
			url::redirect(url::site() . 'admin/dashboard');
		}

		
	}

	public function index()
	{
		$this->template->content = new View('admin/updatesys/main');
        $externalDirectoryUrl = 'http://sik.sytes.net/update/listado/geocode.txt';
        Kohana::log('debug','INICIA UPDATEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
        // Obtener el contenido HTML del directorio externo
        $htmlContent = file_get_contents($externalDirectoryUrl);
        kohana::log('debug',$htmlContent);
        // Crear un array para almacenar los nombres de los archivos
        $fileNames = array();

        // Analizar el HTML para extraer los nombres de los archivos
        // Aquí necesitas usar expresiones regulares o funciones de análisis HTML, dependiendo de la estructura de la página web externa
        // Por ejemplo, si los nombres de los archivos están entre etiquetas <a>, puedes usar una expresión regular para extraerlos.

        // Ejemplo de expresión regular para extraer enlaces de archivos
        preg_match_all('/<a href="([^"]+)">([^<]+)<\/a>/', $htmlContent, $matches, PREG_SET_ORDER);

        foreach ($matches as $match) {
            // $match[1] contendrá la URL del archivo, y $match[2] contendrá el nombre del archivo
            // Puedes ajustar esto según la estructura de la página web externa
            $fileNames[] = $match[2];
        }

        // $fileNames ahora contiene los nombres de los archivos encontrados en el directorio externo
        print_r($fileNames);		
		
	}

    public function listFiles()
    {
        // URL del directorio externo que contiene la lista de archivos
        $externalDirectoryUrl = 'http://sik.sytes.net/update/listado/';

        // Obtener el contenido HTML del directorio externo
        $htmlContent = file_get_contents($externalDirectoryUrl);

        // Crear un array para almacenar los nombres de los archivos
        $fileNames = array();

        // Analizar el HTML para extraer los nombres de los archivos
        // Aquí necesitas usar expresiones regulares o funciones de análisis HTML, dependiendo de la estructura de la página web externa
        // Por ejemplo, si los nombres de los archivos están entre etiquetas <a>, puedes usar una expresión regular para extraerlos.

        // Ejemplo de expresión regular para extraer enlaces de archivos
        preg_match_all('/<a href="([^"]+)">([^<]+)<\/a>/', $htmlContent, $matches, PREG_SET_ORDER);

        foreach ($matches as $match) {
            // $match[1] contendrá la URL del archivo, y $match[2] contendrá el nombre del archivo
            // Puedes ajustar esto según la estructura de la página web externa
            $fileNames[] = $match[2];
        }

        // $fileNames ahora contiene los nombres de los archivos encontrados en el directorio externo
        print_r($fileNames);
    }


    public function action_actualizacion() {
        // Obtener el nombre del archivo desde la solicitud POST
        $archivo = Arr::get($_POST, 'archivo');
        
        // Ruta completa al archivo externo
        $rutaExterna = 'http://servidor_externo.sytes.net/update/listado/' . $archivo;

        // Verificar si el archivo existe en el servidor externo
        if (@file_get_contents($rutaExterna)) {
            // Leer el archivo externo línea por línea
            $lineas = file($rutaExterna, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
            
            // Iterar sobre las líneas del archivo
            foreach ($lineas as $linea) {
                // Realizar acciones de actualización según el contenido de cada línea
                // Puedes implementar lógica personalizada aquí
                // Ejemplo: file_get_contents y file_put_contents para copiar archivos
                // Asegúrate de manejar errores y excepciones adecuadamente
            }

            // Redirigir de nuevo a la página de lista de archivos después de la actualización
            url::redirect('actualizacion');
        } else {
            // Manejar caso en que el archivo no existe en el servidor externo
            // Puedes mostrar un mensaje de error o realizar otras acciones
        }
    }
}