const { Router } = require("express");
const express = require("express");
const router = express.Router();

const conexion = require("../database/db");

router.get("/lista_propuestas_tareas/:estudianteId", (req, res) => {
    const estudianteId = req.params.estudianteId;
    conexion.query("SELECT * FROM tareas WHERE estudianteId = ? AND docenteId is null",
     [estudianteId], (error, results) => {
        if (error) {
            throw error;
        }else {
            res.render(
                "lista_propuestas_tareas", 
                {
                    results: results, 
                    header: 'partials/_header', 
                    headerDos: 'partials/headerPersonal'
                }
            );
        }
    });
});

router.get("/propuesta_tarea/:id", (req, res) => {
    const id = req.params.id;
    conexion.query("SELECT * FROM propuesta WHERE tareas3 IN (SELECT id FROM tareas WHERE id = ?)", [id], (error, results) => {
        if (error) {
            throw error;
        } else {
            conexion.query("SELECT * FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id = ?))", 
            [id], (error, resul) => {
                if (error) {
                    throw error;
                } else {
                    conexion.query("SELECT * FROM especialidades WHERE docentes IN (SELECT id FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id = ?)))",
                     [id], (error, re) => {
                        if (error) {
                            throw error;
                        } else {
                            conexion.query("SELECT * FROM comentario WHERE docentes1 IN (SELECT id FROM docentes WHERE id IN (SELECT docente FROM propuesta where tareas3 IN (SELECT id From tareas Where id = ?)))",
                     [id], (error, r) => {
                            res.render(
                                'propuesta_tarea', 
                                {
                                    results: results, 
                                    resul: resul, 
                                    re: re, 
                                    r: r,
                                    header: 'partials/_header', 
                                    headerDos: 'partials/headerPersonal'
                                }
                            );
                     });
                        }
                    });
                }
            });
        }
    });
});

module.exports = router;