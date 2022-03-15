const {
    redirect
} = require('express/lib/response');
//La conexion a la base de datos
const conexion = require('../database/db');

exports.listado_Propuesta = (req, res) => {
    try {
        //Codigo de listado
        conexion.query("SELECT * FROM propuesta", (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Propuesta_Listado", {
                    propuestas: results
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.Propuesta = (req, res) => {
    try {
        res.render("Propuesta") //Renderizamos
    } catch (error) {
        console.log(error);
    }
};
exports.crear_Propuesta = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const valor = req.body.valor;
        const descripcion = req.body.descripcion;
        const tareas3 = 1;
        /*Guardamos los datos */
        conexion.query(
            "INSERT INTO propuesta SET ?", {
                valor: valor,
                descripcion: descripcion,
                tareas3: tareas3
            },
            (err, results) => {
                if (err) {
                    console.log(err, results);
                } else {
                    res.redirect("/user/listado_Propuesta");
                }
            }
        );
    } catch (error) {
        console.log(error);
    }
};
exports.editar_Propuesta = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("SELECT * FROM propuesta WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Propuesta_Editar", {
                    propuesta: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.actualizar_Propuesta = (req, res) => {
    try {
        /*Campos del formulario */
        const cuerpo = req.body;
        console.log(cuerpo); //Mostramos en formato desarrollo
        const id = req.body.id;
        const valor = req.body.valor;
        const descripcion = req.body.descripcion;
        /*Guardamos los datos */
        conexion.query(
            "UPDATE propuesta SET ? WHERE id = ?",
            [{
                valor: valor,
                descripcion: descripcion
            }, id],
            (err, results) => {
                if (err) {
                    console.log(err, results);
                } else {
                    res.redirect("/user/listado_Propuesta");
                }
            }
        );
    } catch (error) {
        console.log(error);
    }
};

exports.eliminar_Propuesta = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("DELETE FROM propuesta WHERE id = ?", [id], (error, results) => {
            if (error) {
                console.log(error, results);
            } else {
                res.redirect("/user/listado_Propuesta");
            }
        });
    } catch (error) {
        console.log(error);
    }
};

exports.informacion_Propuesta = (req, res) => {
    try {
        //Codigo de editar
        const id = req.params.id;
        conexion.query("SELECT * FROM propuesta WHERE id=?", [id], (error, results) => {
            if (error) {
                throw error;
            } else {
                console.log(results);
                res.render("Propuesta_Descripcion", {
                    propuesta: results[0]
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};


exports.buscar_Propuesta = (req, res) => {
    try {
        //Codigo de busqueda
        const valor = req.body.valor;
        conexion.query("SELECT * FROM propuesta WHERE valor = ?", [valor], (error, results) => {
            if (error) {
                throw error;
            } else {
                res.render("Propuesta_Buscar", {
                    propuestas: results
                });
            }
        });
    } catch (error) {
        console.log(error);
    }
};