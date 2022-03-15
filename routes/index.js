var express = require('express');
var router = express.Router();

/* GET home page. */

//Get => Pedir Informacion - Renderizar vista - datos
//Post => Enviar datos hacia el servidor guardar modificar
router.get('/', function(req, res, next) {
  res.render('index', { title: 'AppTareas' });
});

router.get('/login', function(req, res, next) {
  res.render('login', { title: 'Login AppTareas' });
});

router.get('/user', function(req, res, next) {
  res.render('user', { title: 'Usuario AppTareas' });
});

router.get('/busqdalista', function(req, res, next) {
  res.render('busqdalista', { title: 'Usuario AppTareas' });
});

router.get('/subitarcom', function(req, res, next) {
  res.render('subitarcom', { title: 'Usuario AppTareas' });
});

router.get('/vizpropslist', function(req, res, next) {
  res.render('vizpropslist', { title: 'Usuario AppTareas' });
});

router.get('/listpropustareas', function(req, res, next) {
  res.render('listpropustareas', { title: 'Usuario AppTareas' });
});

module.exports = router;
