const mysql = require("mysql");

const conexion = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "apptareasmunicipiolojaprueba",
});

conexion.connect((error) => {
  if (error) {
    console.error("El error de conexión es: " + error);
    return;
  }
  console.log("!Conectado a la base de datos MySQL¡");
});

module.exports = conexion;