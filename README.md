# SIGERH - Sistema de Gestión de Recursos Humanos

**SIGERH** es una aplicación web para el departamento de Recursos Humanos, diseñada para automatizar y centralizar los procesos de nómina, control de asistencia y gestión de expedientes electrónicos del personal.  
Se desarrollará utilizando **HTML, PHP y JavaScript**, y **MySQL** como gestor de base de datos.

---

## Guía de instalación rápida

| 🔹 Paso | 🔧 Sección | 📝 Acción | 📂 Ruta / Comando / Archivo | ⚠ Notas |
|---------|------------|-----------|----------------------------|----------|
| 1 | XAMPP | Descargar e instalar | [XAMPP](https://www.apachefriends.org/es/download.html) | Seleccionar el sistema operativo correcto |
| 2 | XAMPP | Abrir panel de control y verificar servicios | Apache y MySQL | Ambos deben estar en “Running” |
| 3 | XAMPP | Configurar php.ini | `C:\xampp\php\php.ini` | Habilitar extensiones: `openssl`, `curl`, `zip`, `mbstring` (quitar `;` del inicio) y reiniciar Apache |
| 4 | Variables de entorno | Agregar PHP al PATH | `C:\xampp\php\` | Para que CMD reconozca PHP |
| 5 | Composer | Instalar Composer | `Composer-Setup.rar` | Seleccionar PHP: `C:\xampp\php\php.exe` durante la instalación |
| 6 | Composer | Verificar instalación | `composer -v` | Debe mostrar la versión instalada |
| 7 | Librerías | Instalar PHPOffice | `composer require phpoffice/phpspreadsheet` | Ejecutar en CMD dentro de `C:\xampp\php` |
| 8 | Librerías | Instalar PHPMailer | `composer require phpmailer/phpmailer` | Ejecutar en CMD dentro de `C:\xampp\php` |
| 9 | Librerías | Instalar TCPDF | `composer require tecnickcom/tcpdf` | Ejecutar en CMD dentro de `C:\xampp\php` |
| 10 | Base de datos | Descomprimir base de datos | `BaseDatos.rar` | Guardar en escritorio |
| 11 | Base de datos | Abrir phpMyAdmin | [http://localhost/phpmyadmin](http://localhost/phpmyadmin) | Crear nueva base de datos |
| 12 | Base de datos | Crear base de datos | `nomina_db` | Seleccionar la base y usar **Importar** archivo SQL descomprimido |
| 13 | Código del sistema | Descomprimir proyecto SIGERH | `SIGERH.rar` | Guardar en `C:\xampp\htdocs` |
| 14 | Acceso al sistema | Abrir navegador | [http://localhost/SIGERH](http://localhost/SIGERH) | Página de login |
| 15 | Acceso al sistema | Ingresar usuario y contraseña | Usuario: `Admin`<br>Contraseña: `1234` | Cambiar contraseña por seguridad |

---

### 💡 Notas finales

- Mantener la **estructura de carpetas** al descomprimir archivos.  
- Si phpMyAdmin da error al importar archivos grandes, revisar `upload_max_filesize` y `post_max_size` en `php.ini`.  
- Mantener **XAMPP actualizado** para evitar incompatibilidades.  


