const {
    redirect
} = require('express/lib/response');
const conexion = require('../database/db'); //La conexion a la base de datos

exports.listado_Presupuesto = (req, res) => {
    try {
        //Codigo de listado
        conexion.query("SELECT * FROM presupuesto", (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Presupuesto_listado", {
                    presupuesto: results
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.Presupuesto = (req, res) => {
    try {
        const id = req.params.id;
        conexion.query("SELECT * FROM tareas WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Presupuesto", {
                    presupuesto: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.crear_Presupuesto_Post = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const valor = req.body.valor;
        const comision = req.body.comision;
        const detalle = req.body.detalle;
        const tareas = req.body.tareas;

        /*Guardamos los datos */
        conexion.query(
            "INSERT INTO presupuesto SET ?", {
                valor: valor,
                comision: comision,
                detalle: detalle,
                tareas: tareas
            },
            (err, results) => {
                if (err) {
                    console.log(err, results);
                } else {
                    res.redirect("/user/listado_Presupuesto");
                }
            }
        );
    } catch (error) {
        console.log(error);
    }
};

exports.editar_Presupuesto = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("SELECT * FROM presupuesto WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Presupuesto_Editar", {
                    presupuesto: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.actualizar_Presupuesto = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const id = req.body.id;
        const valor = req.body.valor;
        const comision = req.body.comision;
        const detalle = req.body.detalle;
        /*Guardamos los datos */
        conexion.query(
            "UPDATE presupuesto SET ? WHERE id = ?",
            [{
                valor: valor,
                comision: comision,
                detalle: detalle
            }, id],
            (err, results) => {
                if (err) {
                    console.log(err, results);
                } else {
                    console.log('Actualizado!!');
                    res.redirect("/user/listado_Presupuesto");
                }
            }
        );
    } catch (error) {
        console.log(error);
    }
};