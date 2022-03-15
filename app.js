var createError = require('http-errors');
var express = require('express');
var mongoose = require("mongoose");
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var session = require('express-session');
var flash = require('express-flash-notification');
var app = express();


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//Confuguracion de sesion
app.use(session({
  secret:'apptareas',
  resave: true,
  saveUninitialized: true
}));
app.use(flash(app));
//Fin configuracion de sesion


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/user', require('./routes/users'))
app.use('/', require('./routes/Rolle'))
app.use('/', require('./routes/Teacher'))
app.use('/', require('./routes/Student'))

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

app.listen(3000, () => {
  console.log("Server corriendo en http://localhost:3000");
});
