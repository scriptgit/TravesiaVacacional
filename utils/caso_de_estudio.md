Tenemos en el looker las siguientes opciones que nos permiten agregar datos y métodos para procesar la información.

Con añadir datos buscamos datos de la base que tenemos en la nube como se trata del caso de estudio usamos
la zona gold donde está la tabla de hechos y dimensiones.

Con la opción añadir un gráfico procesamos los datos para mostrarlos en base a determinados parametros y
representaciones gráficas que mejor nos convengan.

La opción añadir un control es de utilidad para filtrar datos por ejemplo por año o actividad para que 
solo nos muestren datos relacionados a algún campo en particular.
![Captura de pantalla 2024-06-13 104110](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/ed73db5e-26ce-4c57-a7b5-1613d4d2be26)

En está primera pantalla para la parte del Dashboard se muestran algunas métricas

La de KPI #asistencias es el número de registro en la tabla de hechos CENTRO_FACT

La métrica del monto acumulado mide la ganancia por pago de actividades usando la tabla 
de dimensiones PAGO_ACTIVIDAD_DIM, se puede controlar la métrica con la lista desplegable actividad_id
![Captura de pantalla 2024-06-13 110007](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/f26ad41b-fa2c-4f82-839e-a345352216ef)

Para la parte de Análisis

Tenemos tres graficos que combinando los datos de las tablas ACTIVIDAD_DIM y PAGO_ACTIVIDAD_DIM nos 
presentan una evaluación visual de que actividades tienen más clientes, cuales generan más 
ingresos y una comparativa entre estos aspectos para las 10 más importantes.
![Captura de pantalla 2024-06-13 112645](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/22ed0d93-e4a1-4ae5-88f2-f00fae2c9f84)

Por último para la fase de Reporte

Haciendo join entre las tablas ACTIVIDAD_DIM y PAGO_ACTIVIDAD_DIM podemos ver en formato de tabla
los datos que corresponden con las ganancias obtenidas por actividad.

Por otra parte usando los datos de las tablas ACTIVIDAD_DIM, CENTRO_FACT y TEMPORADA_DIM, por ejemplo,
se puede obtener en que centros no se puede pagar por ciertas actividades y que en temporadas están activas.
![Captura de pantalla 2024-06-13 113409](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/720cb919-cc0f-459c-99b8-f35b401c4b47)
