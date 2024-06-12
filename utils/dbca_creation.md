Está es una breve explicación para crear la cdb con el manejador de dbca

Primero que nada es recomendable pero no obligatorio ejecutar el script 04 para la creación de los directorios.
Eso si el manejador creara el directorio pdbseed que es distinto al que crea el script llamado PDBSEED este directorio pueden borrarlo si lo desean pues no va a ser utilizado.
Usar el comando:
rm  -r /travesia/disk-01/app/oracle/oradata/TRAVDIP1/PDBSEED

Ahora en dbca se pueden modificar algunos parámetros para facilitar la creación.

Paso 1 Escoger crear nueva base
![Captura de pantalla 2024-06-12 131729](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/8b009b07-e922-4cbc-9fd1-f6af136b348f)

Paso 2 Escoger configuraciones avanzadas
![Captura de pantalla 2024-06-12 131729](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/88a5cc05-8a9b-4c6c-a3dd-310aedb62608)

Paso 3 Dejar configuración por defecto
![Captura de pantalla 2024-06-12 131806](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/7938eeed-9fec-40da-85fc-cef487483ca3)

En caso de salir está advertencia decir que si

![Captura de pantalla 2024-06-12 131837](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/0a8617e0-da8f-42d2-854c-7dcb4230b0c4)

Paso 4 Configurar nombre del dominio de la base y el SID, así como establecer que se crea un contenedor vacío
![Captura de pantalla 2024-06-12 131933](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/cceed0f5-f985-4b8c-bf00-3b6ca653e646)

Paso 5 Si usaron la opción de la creación de los directorios buscar la ruta y establecerla en la opción de Data file locations,
aquí se creara todo lo necesario para la base

![Captura de pantalla 2024-06-12 132055](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/f3ed670b-377f-49fa-a27a-a7589b45952f)

En caso de no ejecutar el script dejar la configuración por defecto, pero se tendrán que hacer movimientos de los archivos generados después para que coincidan con el esquema que estamos trabajando.

Paso 6 Lo mismo que en el paso anterior pero ahora para la FRA
![Captura de pantalla 2024-06-12 132321](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/cddccad3-31fe-4d31-a2f2-eea8a93608de)

Paso 7 Verificar que el listener está activo, sino activarlo con oracle usando la instrucción
lsnrctl start

![Captura de pantalla 2024-06-12 132358](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/95dd1709-f7e7-4cac-b180-a05229c0c8e4)

Paso 8 Mantener las opciones por defecto(deshabilitar las opciones que se presentan)
![Captura de pantalla 2024-06-12 132501](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/0ca1a332-4ead-4740-9347-3e8a13c0eeaa)

Paso 9 Configurar las opciones como crea conveniente, pero por defecto las que aparecen se pueden usar.
En mi caso modifique el tamaño de la SGA y la PGA

![Captura de pantalla 2024-06-12 132559](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/f6ad1f4f-b322-43c4-8e02-f9cc3107c5bc)

Paso 10 Dejar la configuración por defecto con el puerto 5500
![Captura de pantalla 2024-06-12 132739](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/c12e4db4-f602-4571-8fd6-d07cef455e7b)

Paso 11 Configurar la contraseña para sys, recordar que es systemproy
![Captura de pantalla 2024-06-12 132830](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/26550e6a-bcb6-45a8-9d32-1f833013abe2)

Saltar se la advertencia con si

![Captura de pantalla 2024-06-12 132941](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/e23fa40b-ebb8-4478-8863-d62655a0961b)

Paso 12 Dejar la configuración por defecto en está parte
![Captura de pantalla 2024-06-12 133029](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/84ac0092-be2d-45cf-b773-88af67df4c72)

Paso 13 Verificar que todo esté bien e instalar la base 
![Captura de pantalla 2024-06-12 133107](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/338440d8-4844-4040-941f-8ed8343797c1)



Posterior a la creación ejecutar el script 06 para la creación de los grupos log, pueden comentar la parte de los diccionarios pues dbca ya 
hizó esa parte.

Después el script 08 aquí muevan los controlfile a donde correspondan y cambien los nombres como vayan cuando la base haga el shutdown. 
Yo use estos comandos por si quieren usarlos pero pueden proceder como mejor les convenga.
mv /travesia/disk-07/fast-recovery-area/TRAVDIP1/control02.ctl /travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/control01.ctl
mv /travesia/disk-01/app/oracle/oradata/TRAVDIP1/control01.ctl /travesia/disk-02/app/oracle/oradata/TRAVDIP1/control02.ctl
cp /travesia/disk-07/fast-recovery-area/TRAVDIP1/controlfile/control01.ctl /travesia/disk-03/app/oracle/oradata/TRAVDIP1/control03.ctl


