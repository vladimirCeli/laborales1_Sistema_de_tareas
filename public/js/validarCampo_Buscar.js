var titulo = document.getElementById('titulo');

function enviar() {
    if (titulo.value === null || titulo.value === '') {
        Swal.fire('No hay campos para buscar!');
        return false;
    }else{
        return true;
    }
};




