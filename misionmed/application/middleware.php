<?php
// middleware.php
// Sistema mejorado de seguridad contra scraping, bots y cabeceras seguras

class SecurityMiddleware {
    
    // 1. Listas mejoradas de detección
    private $suspicious_agents = [
        'curl', 'wget', 'python', 'scrapy', 'libwww', 'java', 
        'bot', 'crawler', 'spider', 'scan', 'zgrab', 'nmap'
    ];
    
    private $legitimate_bots = [
        'googlebot', 'bingbot', 'slurp', 'duckduckbot', 
        'facebookexternalhit', 'twitterbot', 'linkedinbot'
    ];
    
   // private $blocked_ips = ['192.168.1.1']; // IPs bloqueadas
    private $rate_limit_ips = []; // Para control de frecuencia
    
    public function __construct() {
        $this->runSecurityChecks();
    }
    
    private function runSecurityChecks() {
        $this->validateRequestMethod();
        $this->checkUserAgent();
        $this->checkIPAddress();
        $this->setSecurityHeaders();
        $this->rateLimitCheck();
    }
    
    // 2. Validación de método HTTP
    private function validateRequestMethod() {
        $allowed_methods = ['GET', 'POST', 'HEAD', 'OPTIONS'];
        if (!in_array($_SERVER['REQUEST_METHOD'], $allowed_methods)) {
            $this->blockRequest(405, 'Método no permitido');
        }
    }
    
    // 3. Detección mejorada de User-Agent
    private function checkUserAgent() {
        //$ua = strtolower($_SERVER['HTTP_USER_AGENT'] ?? '');
        $ua = strtolower(isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '');
        
        // Bloquear requests sin User-Agent
        if (empty($ua) || $ua === '') {
            $this->blockRequest(403, 'User-Agent requerido');
        }
        
        // Permitir bots legítimos
        foreach ($this->legitimate_bots as $bot) {
            if (strpos($ua, $bot) !== false) {
                // Verificar IP de bots legítimos (opcional)
                if ($this->verifyLegitimateBot()) {
                    return; // Permitir acceso
                }
            }
        }
        
        // Bloquear agentes sospechosos
        foreach ($this->suspicious_agents as $agent) {
            if (strpos($ua, $agent) !== false) {
                $this->logSuspiciousActivity($ua, 'User-Agent bloqueado');
                $this->blockRequest(403, 'Acceso no autorizado');
            }
        }
        
        // Detectar patrones sospechosos
        if ($this->detectSuspiciousPatterns($ua)) {
            $this->logSuspiciousActivity($ua, 'Patrón sospechoso detectado');
            $this->blockRequest(403, 'Acceso no autorizado');
        }
    }
    
    // 4. Verificación mejorada de IP
    private function checkIPAddress() {
        $client_ip = $this->getClientIP();
        
        // Bloquear IPs en lista negra
        if (in_array($client_ip, $this->blocked_ips)) {
            $this->blockRequest(403, 'IP bloqueada');
        }
        
        // Verificar IPs reservadas/rango privado (si es aplicable)
        if ($this->isPrivateIP($client_ip) && !$this->allowPrivateIPs()) {
            $this->blockRequest(403, 'Acceso desde red no permitida');
        }
    }
    
    // 5. Control de frecuencia de requests
    private function rateLimitCheck() {
        $client_ip = $this->getClientIP();
        $max_requests = 100; // Máximo 100 requests por hora
        $time_window = 3600; // 1 hora
        
        if (!isset($this->rate_limit_ips[$client_ip])) {
            $this->rate_limit_ips[$client_ip] = [
                'count' => 1,
                'first_request' => time()
            ];
        } else {
            $this->rate_limit_ips[$client_ip]['count']++;
            
            // Reiniciar contador si ha pasado el tiempo de ventana
            if (time() - $this->rate_limit_ips[$client_ip]['first_request'] > $time_window) {
                $this->rate_limit_ips[$client_ip] = [
                    'count' => 1,
                    'first_request' => time()
                ];
            }
            
            // Bloquear si excede el límite
            if ($this->rate_limit_ips[$client_ip]['count'] > $max_requests) {
                $this->logSuspiciousActivity($client_ip, 'Rate limit excedido');
                $this->blockRequest(429, 'Demasiadas solicitudes');
            }
        }
    }
    
    // 6. Cabeceras de seguridad mejoradas
    private function setSecurityHeaders() {
        // Headers básicos de seguridad
        header("X-Frame-Options: SAMEORIGIN");
        header("X-Content-Type-Options: nosniff");
        header("X-XSS-Protection: 1; mode=block");
        
        // Headers adicionales recomendados
        header("Referrer-Policy: strict-origin-when-cross-origin");
        header("Permissions-Policy: geolocation=(), microphone=(), camera=()");
        
        // CSP básico (Personalizar según tu aplicación)
        $csp = "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'";
        header("Content-Security-Policy: " . $csp);
        
        // Prevenir cache para respuestas de error (opcional)
        if (http_response_code() >= 400) {
            header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
            header("Pragma: no-cache");
        }
    }
    
    // 7. Métodos auxiliares
    private function getClientIP() {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            return $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            return $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            return $_SERVER['REMOTE_ADDR'];
        }
    }
    
    private function isPrivateIP($ip) {
        return !filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE);
    }
    
    private function allowPrivateIPs() {
        // Configurar según entorno (permitir en desarrollo, bloquear en producción)
        return $_SERVER['APP_ENV'] === 'development';
    }
    
    private function verifyLegitimateBot() {
        // Aquí puedes implementar verificación DNS reversa para bots legítimos
        // Por ahora retornamos true asumiendo que son legítimos
        return true;
    }
    
    private function detectSuspiciousPatterns($ua) {
        // Detectar user-agents anómalos o vacíos
        $suspicious_patterns = [
            '/^$/',
            '/^\s*$/',
            '/[^\x20-\x7E]/', // Caracteres no ASCII
            '/\b(test|fake|dummy)\b/i'
        ];
        
        foreach ($suspicious_patterns as $pattern) {
            if (preg_match($pattern, $ua)) {
                return true;
            }
        }
        return false;
    }
    
    private function blockRequest($code, $message) {
        http_response_code($code);
        header('Content-Type: text/plain');
        
        // Log adicional antes de salir
        $this->logSuspiciousActivity($this->getClientIP(), "Bloqueado: $message");
        
        exit($message);
    }
    
    private function logSuspiciousActivity($identifier, $reason) {
        // Implementar sistema de logging según tu aplicación
        $log_entry = date('Y-m-d H:i:s') . " - IP: " . $this->getClientIP() . 
                    " - Identifier: $identifier - Reason: $reason" . PHP_EOL;
        
        // Ejemplo: escribir en archivo de log
        file_put_contents('security.log', $log_entry, FILE_APPEND | LOCK_EX);
    }
}

// Inicializar el middleware
new SecurityMiddleware();
?>