const { Router } = require("express");
const express = require("express");
const router = express.Router();

const conexion = require("../database/db");

router.get("/principal_busqueda_tareas", (req, res) => {
    conexion.query("SELECT * FROM tareas WHERE docenteId is NULL", 
    (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render(
                "principal_busqueda_tareas", 
                {
                    results: results, 
                    header: 'partials/_header', 
                    headerDos: 'partials/headerPersonal'
                }
            );
        }
    });
});

router.post("/principal_busqueda_tareas", (req, res) => {
    let searchTerm = req.body.search;
    conexion.query("SELECT * FROM tareas WHERE docenteId is NULL AND titulo LIKE ?", 
    ['%' + searchTerm + '%'], (error, results) => {
        //conexion.release();
        if (error) {
            throw error;
        } else {
            res.render(
                "principal_busqueda_tareas", 
                {
                    results: results, 
                    header: 'partials/_header', 
                    headerDos: 'partials/headerPersonal'
                }
            );
        }
    });
});


router.get("/completar_tarea/:docenteId", (req, res) => {
    const docenteId = req.params.docenteId;
    conexion.query("SELECT * FROM tareas WHERE docenteId = ? AND archivoDocente is NULL", 
    [docenteId], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render(
                'completar_tarea', 
                {
                    results: results, 
                    header: 'partials/_header', 
                    headerDos: 'partials/headerPersonal'
                }
            );
        }
    });
});

router.post("/completar_tarea/:docenteId", (req, res) => {
    const id = req.body.id;
    let searchTerm = req.body.search;
    conexion.query("UPDATE tareas SET ? WHERE id = ?",
    [{archivoDocente: searchTerm}, id], 
    (error, results) => {
        if (error) {
            console.log(error);
        }else {
            res.redirect("/completar_tarea/:docenteId");
        }
    }
    );
});


module.exports = router;