
/* global Swal */

document.addEventListener('DOMContentLoaded', function () {
    const camposSoloNumeros = [
        'txtact_codigo',
        'txtact_vida_util',
        'txtact_meses_depreciados',
        'txtequ_ram',
        'txtequ_puertos',
        'txtequ_capacidad_almacenamiento',
        'txtact_precio_adqu'
    ];

    camposSoloNumeros.forEach(function (campoId) {
        const campoInput = document.getElementsByName(campoId)[0];
        soloNumeros(campoInput);
    });

    function soloNumeros(campoInput) {
        campoInput.addEventListener('keypress', function (event) {
            const charCode = event.which ? event.which : event.keyCode;

            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                mostrarNotificacionError();
                event.preventDefault();
            }
        });
    }

    function mostrarNotificacionError() {
        Swal.fire({
            icon: 'warning',
            title: 'Notificación',                             
            text: 'Este campo solo puede contener números.'
        });
    }
});


