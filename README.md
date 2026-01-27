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





Manual SIGERH – Sistema de Gestión de Recursos Humanos
________________________________________
1. Introducción
SIGERH (Sistema de Gestión de Recursos Humanos) es una aplicación web para el departamento de Recursos Humanos, diseñada para automatizar y centralizar los procesos de nómina, control de asistencia y gestión de expedientes electrónicos del personal.
Beneficios:
•	Reduce la carga administrativa.
•	Minimiza errores en la gestión de personal.
•	Mejora la eficiencia en los procesos del área de RRHH.
Lenguajes y tecnologías utilizadas:
•	HTML, PHP, JavaScript
•	MySQL como gestor de base de datos
________________________________________
2. Requisitos del sistema
•	Windows 7, 8, 10 o 11
•	XAMPP
•	Composer
•	Navegador actualizado (Chrome, Edge o Firefox)
•	Archivos del proyecto SIGERH (SIGERH.rar y BaseDatos.rar)
________________________________________
3. Instalación de XAMPP
1.	Descargar XAMPP desde https://www.apachefriends.org/es/download.html
2.	Seleccionar versión para Windows e instalar.
3.	Abrir Panel de Control de XAMPP.
4.	Iniciar Apache y MySQL y verificar que estén en Running.
Nota: Si Apache no inicia, puede ser porque otro programa (Skype, IIS) usa los puertos 80 o 443. Ciérralo y vuelve a intentar.
________________________________________
4. Configuración de PHP
1.	En el Panel de Control de XAMPP, ir a Config → php.ini.
2.	Buscar y habilitar las siguientes extensiones quitando el ;:
extension=openssl
extension=curl
extension=zip
extension=mbstring
3.	Guardar y reiniciar Apache.
Nota: Estas extensiones permiten que PHP maneje bases de datos, correos y archivos correctamente.
________________________________________
5. Configuración de variables de entorno
1.	Presionar Win + R, escribir sysdm.cpl y Enter.
2.	Ir a Opciones avanzadas → Variables de entorno → Path → Editar → Nuevo
3.	Agregar:
C:\xampp\php\
4.	Aceptar y cerrar ventanas.
5.	Verificar en CMD:
php -v
Debe mostrar la versión de PHP instalada.
________________________________________
6. Instalación de Composer
1.	Descomprimir Composer-Setup.rar.
2.	Ejecutar instalador.
3.	Seleccionar ruta de PHP:
C:\xampp\php\php.exe
4.	Finalizar instalación.
5.	Verificar en CMD:
composer -v
Debe mostrar la versión de Composer.
________________________________________
7. Instalación de librerías PHP
Abrir CMD en C:\xampp\php y ejecutar:
composer require phpoffice/phpspreadsheet
composer require phpmailer/phpmailer
composer require tecnickcom/tcpdf
Estas librerías permiten: manejar Excel, enviar correos y generar PDFs.
________________________________________
8. Configuración de la base de datos
1.	Descomprimir BaseDatos.rar en el escritorio.
2.	Abrir navegador en:
http://localhost/phpmyadmin
3.	Crear base de datos nueva:
nomina_db
4.	Seleccionar la base creada → Importar → seleccionar archivo SQL descomprimido.
5.	Esperar mensaje de éxito.
________________________________________
9. Instalación del código SIGERH
1.	Descomprimir SIGERH.rar en:
C:\xampp\htdocs
2.	La carpeta debe quedar:
C:\xampp\htdocs\SIGERH
________________________________________
10. Acceso al sistema
1.	Abrir navegador:
http://localhost/SIGERH
2.	Ingresar usuario y contraseña por defecto:
o	Usuario: Admin
o	Contraseña: 1234
Recomendación: Cambiar la contraseña después del primer acceso por seguridad.
________________________________________
11. Notas finales y recomendaciones
•	Mantener la estructura de carpetas al descomprimir archivos.
•	Si la importación de la base de datos falla por tamaño, modificar en php.ini:
upload_max_filesize
post_max_size
•	Mantener XAMPP actualizado para evitar problemas.
•	Guardar este manual como referencia para futuros usuarios o instalaciones.




