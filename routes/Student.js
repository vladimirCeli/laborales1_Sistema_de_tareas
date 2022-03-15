const { Router } = require("express");
const express = require("express");
const router = express.Router();

const conexion = require("../database/db");

router.get("/vizpropslist/:estudianteId", (req, res) => {
    const estudianteId = req.params.estudianteId;
    conexion.query("SELECT * FROM tareas WHERE estudianteId = ? AND docenteId is null", [estudianteId], (error, results) => {
        if (error) {
            throw error;
        }else {
            res.render("vizpropslist", {results: results, header: 'partials/_header'});
        }
    });
});

router.get("/listpropustareas/:id", (req, res) => {
    const id = req.params.id;
    conexion.query("SELECT * FROM propuesta WHERE tareas3 IN (SELECT id FROM tareas WHERE id = ?)", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            conexion.query("SELECT * FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id = ?))", [id], (error, resul) => {
                if (error) {
                    throw error;
                } else {
                    conexion.query("SELECT * FROM especialidades WHERE docentes IN (SELECT id FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id = ?)))", [id], (error, re) => {
                        res.render('listpropustareas', {results: results, resul: resul, re: re, header: 'partials/_header'});
                    });
                }
            });
        }
    });
});



module.exports = router;