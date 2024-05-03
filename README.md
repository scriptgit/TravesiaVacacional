# Travesia Vacacional
## Proyecto Diplomado

### Organización de tablespaces
```
ADMINISTRACIÓN
├── ADMIN_TBS
│   ├── ASOCIACION
│   ├── CERTIFICACION
│   ├── VERSION
│   └── VERSION_LIDER
├── ADMIN_EMPLEADO_TBS
│   ├── EMPLEADO
│   ├── LIDER
│   └── LIDER_CENTRO
└── ADMIN_INDICES_TBS
    └── # TODO: añadir índices creados
COMUN 
└── DEFAULT
    └── CENTRO
NEGOCIO
├── NEGOCIO_CLIENTE_TBS
│   ├── CLIENTE
│   ├── VISITA
│   ├── ACOMPAÑANTE
│   └── AUTO
├── NEGOCIO_MEMBRESIA_TBS
│   ├── MEMBRESIA
│   ├── STATUS_MEMBRESIA
│   └── HISTORICO_ESTATUS_MEMBRESIA
├── NEGOCIO_ACTIVIDAD_TBS
│   ├── ACTIVIDAD
│   ├── CENTRO_ACTIVIDAD
│   ├── TEMPORADA
│   ├── JUEGO
│   ├── TIPO_JUEGO
│   ├── DEPORTE
│   ├── TIPO_DEPORTE
│   ├── ACCESORIOS
│   └── CAMPAMENTO
├── NEGOCIO_MEDIA_TBS
│   └── ACTIVIDAD_IMAGEN
└── NEGOCIO_INDICES_TBS
    └── # TODO: añadir índices creados
```

### Organización de discos
```
MODULO
└── TABLESPACE
    └── DATAFILE
FRA
└── disk_7
ADMINISTRACIÓN
├── ADMIN_TBS
│   └── disk_1
├── ADMIN_EMPLEADO_TBS
│   ├── disk_1
│   ├── disk_2
│   └── disk_3
└── ADMIN_INDICES_TBS
    ├── disk_2
    └── disk_3
NEGOCIO
├── NEGOCIO_CLIENTE_TBS
│   ├── disk_4
│   ├── disk_5
│   └── disk_6
├── NEGOCIO_MEMBRESIA_TBS
│   ├── disk_4
│   └── disk_5
├── NEGOCIO_ACTIVIDAD_TBS
│   └── disk_6
├── NEGOCIO_MEDIA_TBS
│   └── disk_8
└── NEGOCIO_INDICES_TBS
    ├── disk_4
    └── disk_5
```

## Integrantes
Jorge Octavio Barcenas Avelar
Angel Eduardo Oropeza Castañeda
Ulises Eduardo Antonio García