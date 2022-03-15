const router = require('express').Router();
const conexion = require("../database/db"); //SUPUESTA CONEXION QUE NO ME FUNCIONA

//
//
//
//TAREA
//
//
//
const crudTareas = require('../controllers/Crud_Tarea'); // VARIABLE GLOBAL PARA MANEJAR LOS METODOS DEL CRUD
//RUTA PARA LISTAR LAS TAREAS CREADAS
router.get("/listado_Tarea", crudTareas.listado_Tarea);
router.get("/listado_Tarea_Todas", crudTareas.listado_Tarea_Todas);

// RUTA PARA RENDERIZAR LA PAGINA DE CREACION Y GUARDAR LAS TAREAS
router.get("/Tarea", crudTareas.Tarea);
router.post('/crear_Tarea', crudTareas.crear_Tarea);

// RUTA PARA RENDERIZAR LA PAGINA DE EDICION Y ACTUALIZAR LAS TAREAS
router.get("/editar_Tarea/:id", crudTareas.editar_Tarea);
router.post('/actualizar_Tarea', crudTareas.actualizar_Tarea);

// RUTA PARA ELIMINAR LAS TAREAS
router.get("/eliminar_Tarea/:id", crudTareas.eliminar_Tarea);

// RUTA PARA VER INFORMACION DETALLADA DE LAS TAREAS
router.get("/informacion_Tarea/:id", crudTareas.informacion_Tarea);

// RUTA PARA VER INFORMACION DETALLADA DE LAS TAREAS - OPCIONES
router.get("/informacionOpciones_Tarea/:id", crudTareas.informacionOpciones_Tarea);

// RUTA PARA RENDIZAR LA PAGINA DE BUSQUEDA DE UNA DE LAS TAREAS
router.post("/buscar_Tarea", crudTareas.buscar_Tarea);
router.post("/buscar_Tarea_Todas", crudTareas.buscar_Tarea_Todas);

// RUTA PARA VER INFORMACION DETALLADA DE LAS PROPUESTAS
router.get("/informacion_Propuesta_Estu/:id", crudTareas.informacion_Propuesta_Estu);

//
//
//
//PROPUESTA
//
//
//
const crudPropuesta = require('../controllers/Crud_Propuesta'); // VARIABLE GLOBAL PARA MANEJAR LOS METODOS DEL CRUD
//RUTA PARA LISTAR LAS TAREAS CREADAS
router.get("/listado_Propuesta", crudPropuesta.listado_Propuesta);

// RUTA PARA RENDERIZAR LA PAGINA DE CREACION Y GUARDAR LAS PROPUESTAS
router.get("/Propuesta", crudPropuesta.Propuesta);
router.post("/crear_Propuesta", crudPropuesta.crear_Propuesta);

// RUTA PARA RENDIZAR LA PAGINA DE BUSQUEDA DE UNA DE LAS TAREAS
router.post("/buscar_Propuesta", crudPropuesta.buscar_Propuesta);

// RUTA PARA RENDERIZAR LA PAGINA DE EDICION Y ACTUALIZAR LAS PROPUESTAS
router.get("/editar_Propuesta/:id", crudPropuesta.editar_Propuesta);
router.post("/actualizar_Propuesta", crudPropuesta.actualizar_Propuesta);

// RUTA PARA ELIMINAR LAS PROPUESTAS
router.get("/eliminar_Propuesta/:id", crudPropuesta.eliminar_Propuesta);

// RUTA PARA VER INFORMACION DETALLADA DE LAS PROPUESTAS
router.get("/informacion_Propuesta/:id", crudPropuesta.informacion_Propuesta);

//
//
//
//
// RECLAMO
//
//
//
//
//

const crudReclamo = require('../controllers/Crud_Reclamo'); // VARIABLE GLOBAL PARA MANEJAR LOS METODOS DEL CRUD

//RUTA PARA GENERAR LOS RECLAMOS
router.get("/crear_Reclamo/:id", crudReclamo.crear_Reclamo);
router.post("/crear_Reclamo_Post", crudReclamo.crear_Reclamo_Post);

//RUTA PARA LISTAR LAS RELCAMOS DE CADA TAREA CREADA
router.get("/listado_Reclamo", crudReclamo.listado_Reclamo);

// RUTA PARA ELIMINAR LAS RECLAMO
router.get("/eliminar_Reclamo/:id", crudReclamo.eliminar_Reclamo);


//
//
//
//
// PRESUPUESTO
//
//
//
//
//
const crudPresupuesto = require('../controllers/Crud_Presupuesto'); // VARIABLE GLOBAL PARA MANEJAR LOS METODOS DEL CRUD

//RUTA PARA LISTAR LAS PRESUPUESTO DE TODAS LAS TAREAS CREADAS
router.get("/listado_Presupuesto", crudPresupuesto.listado_Presupuesto);

//RUTA PARA GENERAR LOS PRESUPUESTOS
router.get("/crear_Presupuesto/:id", crudPresupuesto.Presupuesto);
router.post("/crear_Presupuesto_Post", crudPresupuesto.crear_Presupuesto_Post);

//RUTA PARA EDITAR EL PRESUPUESTO DE UNA TAREA
router.get("/editar_Presupuesto/:id", crudPresupuesto.editar_Presupuesto);
router.post("/actualizar_Presupuesto", crudPresupuesto.actualizar_Presupuesto);

//EXPORTADO DE RUTAS
module.exports = router;