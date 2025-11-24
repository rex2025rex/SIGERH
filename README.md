**SIGERH** 

(Sistema de Gestión de Recursos Humanos) es una aplicación web para el departamento de Recursos Humanos, diseñada para automatizar y centralizar los procesos de nómina, control de asistencia y gestión de expedientes electrónicos del personal.  
El sistema permitirá reducir la carga administrativa, minimizar errores y mejorar la eficiencia en la gestión del capital humano.  
Se desarrollará utilizando **HTML, PHP y JavaScript**, y **MySQL** como sistema gestor de base de datos.

---

## Instalación del sistema:

1. Descargar e instalar **XAMPP** desde [https://www.apachefriends.org/es/download.html](https://www.apachefriends.org/es/download.html), seleccionando el sistema operativo correspondiente.  
2.- Una vez instalado abrir el panel de control y verificar que Apache y MySQL, esten funcionando.
3.- En el panel de control buscar el boton "Config" de Apache y buscar la opción "php.ini".
4.- En el archivo "php.ini", buscar :  ;extension=openssl  ;extension=curl  ;extension=zip  ;extension=mbstring  ,quitar el ";", y reiniciar el servicio.
5.- Configurar las variables de entorno del sistema, agregar en el path "C:\xampp\php\".
6.- Buscar el archivo "Composer-Setup.rar" (ubicado en está carpeta), descomprimirlo e instalarlo, verificando que cuando el instalador pida la ruta de PHP se debe seleccionar C:\xampp\php\php.exe.
7.- Para verificar la instalación abrir "simbolo del sistema" en la ruta "C:\xampp\php" y escribir : composer -v , deberá mostrar la versión instalada.


## Instalación de las librerias:

8.- Abrir "simbolo del sistema" en la ruta "C:\xampp\php" y escribir : composer require phpoffice/phpspreadsheet
9.- Abrir "simbolo del sistema" en la ruta "C:\xampp\php" y escribir : composer require phpmailer/phpmailer
10.- Abrir "simbolo del sistema" en la ruta "C:\xampp\php" y escribir : composer require tecnickcom/tcpdf


## Configuración de la base de datos:

11.- Descomprimir el archivo "BaseDatos.rar" (ubicado en está carpeta), guardar en el escritorio. 
12.- En el navegar escribir : http://localhost/phpmyadmin
13.- Seleccionar la opción "nueva" para crear la base de datos que debe nombrarse como "nomina_db".
14.- Seleccionar la base creada "nomina_db", y buscar la opción "Importar", seleccionar el archivo guardado en el escritorio(punto 11).


## el código del sistema:

15.- Descomprimir el archivo "SIGERH.rar" (ubicado en está carpeta), está carpeta debe estar en la ruta "C:\xampp\htdocs". 


Para entrar al sistema:

16.- En el navegar escribir : http://localhost/SIGERH 
17.- Pedirá datos de acceso  Usuario : Admin    Contraseña : 1234

