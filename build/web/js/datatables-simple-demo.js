//window.addEventListener('DOMContentLoaded', event => {
//    // Simple-DataTables
//    // https://github.com/fiduswriter/Simple-DataTables/wiki
//
//    const datatablesSimple = document.getElementById('datatablesSimple');
//    if (datatablesSimple) {
//        new simpleDatatables.DataTable(datatablesSimple);
//    }
//});

//window.addEventListener('DOMContentLoaded', evento => {
//    // Simple-DataTables
//    // https://github.com/fiduswriter/Simple-DataTables/wiki
//
//    // Configura las opciones de idioma en español
//    const opcionesIdioma = {
//        perPage: 'Mostrar _MENU_ entradas',
//        zeroRecords: 'No se encontraron resultados',
//        info: 'Mostrando _START_ a _END_ de _TOTAL_ entradas',
//        infoEmpty: 'Mostrando 0 a 0 de 0 entradas',
//        search: 'Buscar:',
//        next: 'Siguiente',
//        previous: 'Anterior',
//        last: 'Último',
//        first: 'Primero',
//        pagination: {
//            first: 'Primero',
//            last: 'Último',
//            next: 'Siguiente',
//            previous: 'Anterior'
//        },
//        sort: 'Ordenar por'
//    };
//
//    // Cargar la biblioteca de idioma
//    simpleDatatables.lang({
//        lang: opcionesIdioma
//    });
//
//    // Obtén el elemento con el id 'datatablesSimple'
//    const datatablesSimple = document.getElementById('datatablesSimple');
//
//    // Verifica si el elemento existe
//    if (datatablesSimple) {
//        // Inicializa una nueva instancia de DataTable con el elemento
//        new simpleDatatables.DataTable(datatablesSimple);
//    }
//});

//window.addEventListener('DOMContentLoaded', event => {
//    // Simple-DataTables
//    // https://github.com/fiduswriter/Simple-DataTables/wiki
//
//    const datatablesSimple = document.getElementById('datatablesSimple');
//    if (datatablesSimple) {
//        new simpleDatatables.DataTable(datatablesSimple);
//    }
//});
window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
//      "language": {
//        showingEntries: 'Mostrando {from} a {to} de {total} entradas',
//        zeroRecords: 'No se encontraron resultados',
//        info: 'Mostrando {start} a {end} de {total} entradas',
//        infoEmpty: 'Mostrando 0 a 0 de 0 entradas',
//        infoFiltered: '(Filtrado de {total} entradas)'
            "language": {
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sSearch": "Buscar:",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                }

//                ,
//                paginate: {
//                    first: 'Primera',
//                    previous: 'Anterior',
//                    next: 'Siguiente',
//                    last: 'Última'
//                }
            }
        });
    }
});


