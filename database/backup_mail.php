<?php
/**
 * Backup diario de la base de datos + envio por email (adjunto .sql.gz)
 * --------------------------------------------------------------------
 * Pensado para correr por CRON en el servidor (no necesita Laravel ni
 * librerias externas). Hace el dump en PHP puro (mysqli), lo comprime
 * y lo manda como adjunto usando el correo local del servidor.
 *
 * Cron sugerido (cPanel -> Cron Jobs), todos los dias a las 04:00:
 *   0 4 * * * /usr/local/bin/php /home/marcospinero/public_html/lv-finanzas/database/backup_mail.php >/dev/null 2>&1
 */

date_default_timezone_set('America/Argentina/Buenos_Aires');

// === Configuracion ===
$TO   = 'crones.codnet@gmail.com';   // destinatario del backup (editable)
$BASE = dirname(__DIR__);            // carpeta raiz del proyecto (donde esta .env)

// --- Lee el archivo .env del proyecto (para no duplicar credenciales) ---
function env_load($file) {
    $vars = array();
    if (!is_readable($file)) return $vars;
    foreach (file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') continue;
        if (strpos($line, '=') === false) continue;
        list($k, $v) = explode('=', $line, 2);
        $k = trim($k);
        $v = trim($v);
        if (strlen($v) >= 2 && ($v[0] === '"' || $v[0] === "'")) {
            $v = substr($v, 1, -1);
        }
        $vars[$k] = $v; // si hay claves repetidas, gana la ultima (igual que Laravel)
    }
    return $vars;
}
$env = env_load($BASE . '/.env');

$DB_HOST = isset($env['DB_HOST'])     ? $env['DB_HOST']         : '127.0.0.1';
$DB_PORT = isset($env['DB_PORT'])     ? (int)$env['DB_PORT']    : 3306;
$DB_NAME = isset($env['DB_DATABASE']) ? $env['DB_DATABASE']     : '';
$DB_USER = isset($env['DB_USERNAME']) ? $env['DB_USERNAME']     : '';
$DB_PASS = isset($env['DB_PASSWORD']) ? $env['DB_PASSWORD']     : '';
$FROM    = isset($env['MAIL_FROM_ADDRESS']) ? $env['MAIL_FROM_ADDRESS'] : 'info@marcospinero.com';

// === Conexion ===
$mysqli = @new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME, $DB_PORT);
if ($mysqli->connect_errno) {
    fwrite(STDERR, "Backup ERROR: no se pudo conectar a la base ({$mysqli->connect_error})\n");
    exit(1);
}
$mysqli->set_charset('utf8');

// === Dump ===
$dump  = "-- Backup de `{$DB_NAME}`  " . date('Y-m-d H:i:s') . "\n";
$dump .= "SET NAMES utf8;\n";
$dump .= "SET FOREIGN_KEY_CHECKS=0;\n\n";

$tables = array();
$res = $mysqli->query("SHOW TABLES");
while ($row = $res->fetch_row()) { $tables[] = $row[0]; }
$res->free();

foreach ($tables as $t) {
    $dump .= "DROP TABLE IF EXISTS `{$t}`;\n";
    $create = $mysqli->query("SHOW CREATE TABLE `{$t}`")->fetch_row();
    $dump .= $create[1] . ";\n\n";

    $rowsRes = $mysqli->query("SELECT * FROM `{$t}`");
    $cols = $rowsRes->field_count;
    while ($r = $rowsRes->fetch_row()) {
        $vals = array();
        for ($i = 0; $i < $cols; $i++) {
            $vals[] = is_null($r[$i]) ? 'NULL' : "'" . $mysqli->real_escape_string($r[$i]) . "'";
        }
        $dump .= "INSERT INTO `{$t}` VALUES (" . implode(',', $vals) . ");\n";
    }
    $rowsRes->free();
    $dump .= "\n";
}
$dump .= "SET FOREIGN_KEY_CHECKS=1;\n";
$mysqli->close();

// === Comprimir ===
$fname = $DB_NAME . '_' . date('Y-m-d') . '.sql.gz';
$gz    = gzencode($dump, 9);

// === Email con adjunto (MIME multipart) ===
$boundary = 'bk_' . md5(uniqid((string)time(), true));
$subject  = 'Backup DB ' . $DB_NAME . ' - ' . date('Y-m-d');

$headers  = "From: {$FROM}\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: multipart/mixed; boundary=\"{$boundary}\"\r\n";

$body  = "--{$boundary}\r\n";
$body .= "Content-Type: text/plain; charset=UTF-8\r\n\r\n";
$body .= "Backup automatico de la base {$DB_NAME}.\r\n";
$body .= "Fecha: " . date('Y-m-d H:i:s') . "\r\n";
$body .= "Tablas: " . count($tables) . "\r\n";
$body .= "Tamano (comprimido): " . round(strlen($gz) / 1024, 1) . " KB\r\n\r\n";

$body .= "--{$boundary}\r\n";
$body .= "Content-Type: application/gzip; name=\"{$fname}\"\r\n";
$body .= "Content-Transfer-Encoding: base64\r\n";
$body .= "Content-Disposition: attachment; filename=\"{$fname}\"\r\n\r\n";
$body .= chunk_split(base64_encode($gz)) . "\r\n";
$body .= "--{$boundary}--";

if (mail($TO, $subject, $body, $headers)) {
    echo "Backup enviado a {$TO} ({$fname}, " . round(strlen($gz) / 1024, 1) . " KB)\n";
    exit(0);
}
fwrite(STDERR, "Backup ERROR: fallo el envio del mail\n");
exit(1);
