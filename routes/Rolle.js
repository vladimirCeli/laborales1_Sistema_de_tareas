const { Router } = require("express");
const express = require("express");
const router = express.Router();

const conexion = require("../database/db");

router.get("/", (req, res) => {
    res.render("index", {});
});

router.get("/index", (req, res) => {
    conexion.query("SELECT * FROM rol", (error, results) => {
      if (error) {
        throw error;
      } else {
        res.render("index", { results: results });
      }
    });
  });


module.exports = router;