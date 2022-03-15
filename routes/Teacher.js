const { Router } = require("express");
const express = require("express");
const router = express.Router();

const conexion = require("../database/db");

router.get("/busqdalista", (req, res) => {
    conexion.query("SELECT * FROM tareas WHERE docenteId is NULL", (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render("busqdalista", {results: results, header: 'partials/_header'});
    }
    });
});

router.post("/busqdalista", (req, res) => {
    let searchTerm = req.body.search;
    conexion.query("SELECT * FROM tareas WHERE docenteId is NULL AND titulo LIKE ?", ['%' + searchTerm + '%'], (error, results) => {
        //conexion.release();
        if (error) {
            throw error;
        } else {
            res.render("busqdalista", {results: results, header: 'partials/_header'});
    }
    });
});


router.get("/subitarcom/:docenteId", (req, res) => {
    const docenteId = req.params.docenteId;
    conexion.query("SELECT * FROM tareas WHERE docenteId = ?", [docenteId], (error, results) => {
        if (error) {
            throw error;
        } else {
            res.render('subitarcom', {results: results, header: 'partials/_header'});
        }
    });
});


module.exports = router;