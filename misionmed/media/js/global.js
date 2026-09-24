jQuery(document).ready(function( $ ) {

	// TOGGLE DROPDOWN
	$('.header_nav_dropdown .header_nav_cancel').on('click', function(e) {
		$(this).closest('.header_nav_dropdown').fadeOut('fast');
		$(this).closest('.header_nav_dropdown').siblings('p').removeClass('active');
	});
	$('.header_nav_has_dropdown > a, .header_nav_actions .header_nav_button_delete, .header_nav_actions .header_nav_button_change').on('click', function(e) {
		$(this).toggleClass('active');
		$(this).siblings('.header_nav_dropdown').fadeToggle('fast')
		e.stopPropagation();
		return false;
	});
	$('.header_nav_actions .header_nav_dropdown').on('click', function(e) {
		e.stopPropagation();
	});

	$('#header_nav_forgot').click(function() {
		$('#header_nav_userforgot_form').toggle('fast');
	});
	
	// Silence JS errors if console not defined (ie. not firebug and not running chrome)
	if(typeof(console) === 'undefined') {
		var console = {};
		console.log = console.error = console.info = console.debug = console.warn = console.trace = console.dir = console.dirxml = console.group = console.groupEnd = console.time = console.timeEnd = console.assert = console.profile = function() {};
	}
	
	// Trigger pngFix
	/*if($(document).pngFix)
	{
		$(document).pngFix();
	}
	*/
	// ==============================================
// Reemplaza el código existente con esta versión actualizada
// ==============================================

// Función pngFix actualizada
(function($) {
    // Versión moderna de pngFix para IE
    $.fn.pngFix = function() {
        if (navigator.userAgent.match(/msie [6-7]\./i)) {
            this.find('img').each(function() {
                var img = $(this);
                var src = img.attr('src').toLowerCase();
                if (src.match(/\.png$/)) {
                    img.css({
                        'filter': "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + img.attr('src') + "', sizingMethod='scale')",
                        'src': "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
                    });
                }
            });
        }
        return this;
    };

    // Polyfill para hovertip si es necesario
    if (typeof $.fn.hovertip === 'undefined') {
        $.fn.hovertip = function(options) {
            // Implementación básica compatible
            return this.each(function() {
                var element = $(this);
                element.hover(
                    function() { /* show tooltip */ },
                    function() { /* hide tooltip */ }
                );
            });
        };
    }
})(jQuery);

// Inicialización segura
jQuery(document).ready(function($) {
    // Inicializar pngFix si hay imágenes PNG
    if (typeof $.fn.pngFix !== 'undefined') {
        $(document).pngFix();
    }
    
    // Otras inicializaciones...
});

});