const { redirect } = require('express/lib/response');
//La conexion a la base de datos
const conexion = require('../database/db'); 

exports.listado_Tarea = (req, res) => {
    try {
        //Codigo de listado
        conexion.query("SELECT * FROM tareas", (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Tarea_Listado", {
                    tareas: results
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};
exports.listado_Tarea_Todas = (req, res) => {
    try {
        //Codigo de listado
        conexion.query("SELECT * FROM tareas", (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Tareas_Lista_Todas", {
                    tareas: results
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.Tarea = (req, res) => {
    try {
        res.render("Tarea") //Renderizamos
    } catch (error) {
        console.log(error);
    }
};

exports.crear_Tarea = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const titulo = req.body.titulo;
        const descripcion = req.body.descripcion;
        const asignatura = req.body.asignatura;
        const fechalimite = req.body.fechalimite;
        const observaciones = req.body.observaciones;
        const archivo = req.body.archivo;
        const valorMaximo = req.body.valorMaximo;
        /*Guardamos los datos */
        conexion.query(
            "INSERT INTO tareas SET ?", {
                titulo: titulo,
                descripcion: descripcion,
                asignatura: asignatura,
                fechalimite: fechalimite,
                observaciones: observaciones,
                archivo: archivo,
                valorMaximo: valorMaximo
            },
            (err, results) => {
                if (err) {
                    console.log(err, results);
                } else {
                    res.redirect("/user/listado_Tarea");
                }
            }
        );
    } catch (error) {
        console.log(error);
    }
};

exports.editar_Tarea = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("SELECT * FROM tareas WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Tarea_Editar", {
                    tareas: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};
exports.actualizar_Tarea = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const id = req.body.id;
        const titulo = req.body.titulo;
        const descripcion = req.body.descripcion;
        const asignatura = req.body.asignatura;
        const fechalimite = req.body.fechalimite;
        const observaciones = req.body.observaciones;
        const archivo = req.body.archivo;
        const valorMaximo = req.body.valorMaximo;
        /*Guardamos los datos */
        conexion.query(
            "UPDATE tareas SET ? WHERE id = ?",
            [{
                titulo: titulo,
                descripcion: descripcion,
                asignatura: asignatura,
                fechalimite: fechalimite,
                observaciones: observaciones,
                archivo: archivo,
                valorMaximo: valorMaximo
            }, id],
            (err, results) => {
                if (err) {
                    console.log(err, results);
                } else {
                    res.redirect("/user/listado_Tarea");
                }
            }
        );
    } catch (error) {
        console.log(error);
    }
};

exports.eliminar_Tarea = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("DELETE FROM tareas WHERE id = ?", [id], (error, results) => {
            if (error) {
                console.log(error, results);
            } else {
                res.redirect("/user/listado_Tarea");
            }   
        });
    } catch (error) {
        console.log(error);
    }
};

exports.informacion_Tarea = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("SELECT * FROM tareas WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                console.log(results);
                res.render("Tarea_Informacion", {
                    tareas: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.informacion_Propuesta_Estu = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("SELECT * FROM propuesta WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                console.log(results);
                res.render("Propuesta_Descripcion_Estudiante", {
                    propuesta: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.informacionOpciones_Tarea = (req, res) => {
    try {
        const id = req.params.id;
        conexion.query("SELECT * FROM tareas WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                console.log(results);
                res.render("Tarea_Informacion_Opciones", {
                    tareas: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.buscar_Tarea = (req, res) => {
    try {
        //Codigo de busqueda
        const titulo = req.body.titulo;
        conexion.query("SELECT * FROM tareas WHERE titulo = ?", [titulo], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Tarea_Buscar", {
                    tareas: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.buscar_Tarea_Todas= (req, res) => {
    try {
        //Codigo de busqueda
        const titulo = req.body.titulo;
        conexion.query("SELECT * FROM tareas WHERE titulo = ?", [titulo], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Tarea_Buscar_Todas", {
                    tareas: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};