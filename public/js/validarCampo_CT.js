var titulo = document.getElementById('titulo');
var descripcion = document.getElementById('descripcion');
var asignatura = document.getElementById('asignatura');
var fechalimite = document.getElementById('fechalimite');
var observaciones = document.getElementById('observaciones');
var archivo = document.getElementById('archivo');
var valorMaximo = document.getElementById('valorMaximo');

function enviar() {
    if (titulo.value === null || titulo.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else if (descripcion.value === null || descripcion.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else if (asignatura.value === null || asignatura.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else if (fechalimite.value === null || fechalimite.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else if (observaciones.value === null || observaciones.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else if (archivo.value === null || archivo.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else if (valorMaximo.value === null || valorMaximo.value === '') {
        Swal.fire('Campos restantes!');
        return false;
    } else {
        return true;
    }
};