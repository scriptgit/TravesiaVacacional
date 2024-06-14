# Travesia Vacacional

Travesía Vacacional S.A. de C.V. es una empresa especializada en la organización de cursos de verano y programas vacacionales dirigidos a público general. Con un historial sólido de brindar experiencias educativas y recreativas de alta calidad, la empresa ha experimentado un crecimiento significativo en su base de clientes y operaciones. Este crecimiento ha evidenciado la necesidad de una mayor eficiencia en la gestión de la información relacionada con sus clientes, empleados y asociaciones colaboradoras.

En el contexto actual, donde la digitalización y la automatización de procesos son imperativos para mantener la competitividad y eficiencia operativa, Travesía Vacacional ha identificado la necesidad de implementar un sistema de gestión de información robusto y automatizado. La empresa busca no solo optimizar sus operaciones internas, sino también mejorar la experiencia del cliente a través de una gestión más precisa y personalizada de los datos.

Las características clave de la información que se requiere manejar incluyen:

1. **Clientes:** Datos demográficos, historial de inscripciones, preferencias de actividades, datos de contacto, y retroalimentación.
2. **Empleados:** Información personal, historial laboral, roles y responsabilidades, y desempeño.
3. **Asociaciones:** Detalles de las asociaciones colaborativas, contratos, términos de colaboración y evaluación de rendimiento.

Este caso de estudio presenta un análisis detallado de los desafíos y requisitos para la automatización de la gestión de información en Travesía Vacacional. Exploraremos las soluciones tecnológicas propuestas, incluyendo la implementación de sistemas de bases de datos, integración de plataformas de gestión de relaciones con clientes, y el uso de herramientas de análisis de datos para la toma de decisiones informadas.

Además, se discutirá el impacto esperado de esta transformación digital en términos de eficiencia operativa, precisión de los datos, y satisfacción del cliente. A través de esta iniciativa, Travesía Vacacional aspira a consolidar su posición como líder en el sector de actividades vacacionales, al tiempo que se prepara para enfrentar los retos y oportunidades del futuro digital.

Acompáñanos en este recorrido técnico y estratégico, donde la ciencia de datos y la tecnología se unen para impulsar la evolución de Travesía Vacacional S.A. de C.V. hacia una nueva era de innovación y excelencia operativa.

----------
## Introducción a la Pregunta Hipotética del Caso de Estudio

En el proceso de automatización y mejora de la gestión de información en Travesía Vacacional S.A. de C.V., surge una pregunta clave que puede proporcionar valiosos insights para la optimización de las ofertas de actividades y la personalización de servicios: 

**¿Cuál es la afinidad de las actividades ofrecidas por Travesía Vacacional y en cuáles tenemos un mayor margen de ganancia?**

Esta pregunta busca entender la relación entre las preferencias de actividades de los clientes y la relación de ganancias de las mismas. Al analizar esta afinidad, Travesía Vacacional puede:

1. **Personalizar Ofertas:** Desarrollar programas de actividades que se alineen mejor con las expectativas y capacidades económicas de diferentes segmentos de clientes.
2. **Optimizar Recursos:** Asignar recursos de manera más eficiente, enfocándose en actividades que atraen a los segmentos más lucrativos.
3. **Mejorar Satisfacción del Cliente:** Aumentar la satisfacción y retención de clientes mediante la oferta de experiencias más adaptadas a sus preferencias y posibilidades económicas.

La exploración de esta pregunta implica la recopilación y análisis de datos detallados sobre las actividades preferidas por los clientes y sus ingresos mensuales. Utilizando técnicas de análisis de datos y modelos estadísticos, se puede identificar patrones y correlaciones significativas que informen decisiones estratégicas.

Acompáñanos en este análisis para descubrir cómo la afinidad entre las actividades ofrecidas y el ingreso mensual de los clientes puede impulsar la innovación y el crecimiento de Travesía Vacacional S.A. de C.V. hacia nuevas alturas de éxito y eficiencia operativa.

----------------
Durante el análisis de los registros de inscripción y retroalimentación de los programas vacacionales, el equipo de datos de Travesía Vacacional descubrió una tendencia preocupante. A pesar de ofrecer una amplia gama de actividades, algunas de las más costosas, como deportes acuáticos y excursiones, mostraban una menor tasa de inscripción entre los clientes con ingresos mensuales más bajos. En contraste, las actividades más económicas, como talleres de arte y manualidades, estaban sobrecargadas y tenían listas de espera.

---
## Procedimiento

### 1. **Migración de Datos desde Oracle a BigQuery**

1. **Conectar a la Base de Datos Oracle:**
   - Utilizar Google Cloud Data Transfer Service o herramientas como **Dataflow** y **Dataproc** para establecer la conexión con la base de datos Oracle.

2. **Exportar los Datos:**
   - Extraer los datos de Oracle utilizando **Dataflow SQL** o mediante scripts personalizados.
   - Convertir los datos en un formato compatible, como CSV o Avro.

3. **Cargar en BigQuery:**
   - Utilizar **Cloud Storage** como un intermediario para almacenar los datos exportados.
   - Importar los datos a **BigQuery** desde Cloud Storage usando el comando `bq load` o la interfaz de usuario de BigQuery.

### 2. **Transformación y Limpieza de Datos (Bronze a Silver)**

1. **Dataflow Jobs para ETL:**
   - Crear trabajos de **Dataflow** para realizar las tareas de extracción, transformación y carga (ETL).
   - Aplicar reglas de limpieza de datos, como eliminación de duplicados, manejo de valores nulos y normalización de formatos.

2. **BigQuery SQL para Transformaciones:**
   - Utilizar **BigQuery SQL** para transformar los datos brutos (Bronze) en datos limpios y estructurados (Silver).
   - Crear tablas temporales y vistas materializadas para simplificar las transformaciones.

### 3. **Creación de Data Warehouse (Silver a Gold) y Arquitectura de Estrella**

1. **Definir Esquema Estrella:**
   - Identificar las **tablas de hechos** (eventos de negocio, transacciones) y **tablas de dimensiones** (clientes, productos, tiempo).

2. **Implementar en BigQuery:**
   - Crear las tablas de hechos y dimensiones en BigQuery.
   - Poblar estas tablas mediante consultas SQL que agregan y unen los datos transformados (Silver).

### 4. **Visualización y BI Reporting**

1. **Conectar BigQuery a una Herramienta de BI:**
   - Utilizar **Looker** como herramienta de BI compatible con GCP para conectar a BigQuery.

2. **Crear Dashboards e Informes:**
   - Diseñar dashboards interactivos y reportes que visualicen los datos agregados y las métricas clave.
   - Configurar actualizaciones automáticas para reflejar los datos más recientes.
---
# Procedimiento de visualizaciones

Tenemos en el looker los siguientes datos:

En está primera pantalla para la parte del Dashboard se muestran algunas métricas

La de KPI #asistencias es el número de registro en la tabla de hechos CENTRO_FACT

La métrica del monto acumulado mide la ganancia por pago de actividades usando la tabla 
de dimensiones PAGO_ACTIVIDAD_DIM, se puede controlar la métrica con la lista desplegable actividad_id
![Captura de pantalla 2024-06-13 203025](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/1d3f005f-4e54-42fc-a50f-d1bb4c9e0c55)

Para la parte de Análisis

Tenemos tres graficos que combinando los datos de las tablas ACTIVIDAD_DIM y PAGO_ACTIVIDAD_DIM nos 
presentan una evaluación visual de que actividades tienen más clientes, cuales generan más 
ingresos y una comparativa entre estos aspectos para las 10 más importantes.
![Captura de pantalla 2024-06-13 202711](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/e36eb254-d404-48db-af84-899dea4bc789)

Por último para la fase de Reporte

Haciendo join entre las tablas ACTIVIDAD_DIM y PAGO_ACTIVIDAD_DIM podemos ver en formato de tabla
los datos que corresponden con las ganancias obtenidas por actividad.

Por otra parte usando los datos de las tablas ACTIVIDAD_DIM, CENTRO_FACT y TEMPORADA_DIM, por ejemplo,
se puede obtener en que centros no se puede pagar por ciertas actividades y en que temporadas están activas.
![Captura de pantalla 2024-06-13 202544](https://github.com/scriptgit/TravesiaVacacional/assets/38197638/78356872-6b18-4a4b-8a53-8c2e9c9012f5)

# Presentación de resultados

Primero, hicimos un análisis exploratorio de los datos que tenemos, de éste obtuvimos insights de los clientes, mismos que nos permitieron conocer más el segmento poblacional y así tener una mejor comprensión del tipo de clientes que hay en travesia vacacional.

* De los clientes, comprendimos que hay una distribución binaria casi igual respecto al tipo de membresía que adquirieron.
* También pudimos representar gráficamente la distribución de los datos respecto al nivel educativo de los clientes.

Estos datos sobre los **clientes** nos permiten tomar decisiones informadas directamente sobre nuestros usuarios.

Posteriormente, nos enfocamos en el área de negocio, obteniendo insights del tipo:
* Ingresos mensuales por pago de membresías
* Membresías registradas por año
* Las actividades que más generan ingresos
* Afinidad de actividades

Éstas últimas dos, fueron de nuestro máximo interés, debido a que nos permiten identificar las actividades cuyos clientes tienen mayor preferencia y de qué manera podemos optimizar el uso de nuestros recursos e invertir en aquellas cuyo interés sean nulo o inclusive mantener/mejorar la calidad de aquellas actividades cuyo margen de ganancias resulta conveniente.

A ello, sumamos que podemos iterar sobre nuestro modelado de datos y negocio, sumando variables como los costos operacionales y así tener una percepción más clara e informada del negocio.
