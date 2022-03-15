const { redirect } = require('express/lib/response');
//La conexion a la base de datos
const conexion = require('../database/db'); 

exports.crear_Reclamo = (req, res) => {
    try {
        const id = req.params.id;
        conexion.query("SELECT * FROM tareas WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Tarea_Reclamo", {
                    tareas: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.crear_Reclamo_Post = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const descripcion = req.body.descripcion;
        const archivoReclamo = req.body.archivoReclamo;
        const fechalimiteR = req.body.fechalimiteR;
        const tareas2 = req.body.tareas2;
        console.log('Es la ide de la tarea');
        console.log(tareas2);
        /*Guardamos los datos */
        conexion.query(
            "INSERT INTO reclamo SET ?", {
                descripcion: descripcion,
                archivoReclamo: archivoReclamo,
                fechalimiteR: fechalimiteR,
                tareas2: tareas2
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

exports.listado_Reclamo = (req, res) => {
    try {
        //Codigo de listado
        conexion.query("SELECT * FROM reclamo", (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Reclamo_listado", {
                    reclamo: results
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.eliminar_Reclamo = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("DELETE FROM reclamo WHERE id = ?", [id], (error, results) => {
            if (error) {
                console.log(error, results);
            } else {
                res.redirect("/user/listado_Reclamo");
            }   
        });
    } catch (error) {
        console.log(error);
    }
};