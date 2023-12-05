var botonAgregar = document.querySelector('.AggButton');

// Callback para habilitar el botón cuando el reCAPTCHA se completa con éxito
function enableSubmitButton() {
    botonAgregar.disabled = false;
    
}
function recaptchaExpiredCallback() {
    botonAgregar.disabled = true;
    
}


$(document).ready(function () {
    $('.editbutton').click(function () {
        
        var equ_id = $(this).data('equ_id');

        // Hacer la solicitud Ajax
        $.ajax({
            url: '../../equiposServlet', // Reemplaza con la ruta correcta
            method: 'GET',
            data: {accion: 'EditarEquipo', equ_id: equ_id},
            dataType: 'json',
            success: function (data) {
                // Verificar si la respuesta contiene datos
                if (data.length > 0) {
                    var equipo = data[0];

                    // Manejar la respuesta
//                  Mostramos los valores de la tabla activos fijos
                    $('#codigoedit').val(equipo.activosfijos.act_codigo);
                    $('#estadoedit').val(equipo.activosfijos.act_estado);
                    $('#marcaedit').val(equipo.activosfijos.act_marca);
                    $('#modeloedit').val(equipo.activosfijos.act_modelo);
                    $('#noserieedit').val(equipo.activosfijos.act_no_serie);
                    $('#adqufechaedit').val(equipo.activosfijos.act_fecha_adqu);
                    $('#precioedit').val(equipo.activosfijos.act_precio_adqu);
                    $('#vidautiledit').val(equipo.activosfijos.act_vida_util);
                    $('#mesesdepr_edit').val(equipo.activosfijos.act_meses_depreciados);
                    $('#descrip_edit').val(equipo.activosfijos.act_descripcion);
                    $('#fabri_edit').val(equipo.activosfijos.tblfabricantes_id);
                    $('#ubica_edit').val(equipo.activosfijos.tblubicacion_id);
                    $('#ubica_edit').val(equipo.activosfijos.tblubicacion_id);
                    $('#activoid_edit').val(equipo.activosfijos.act_id);
                    
                    
//                  Mostramos los valores de la tabla Equipos de computo
                    $('#marcaproce_edit').val(equipo.equ_procesador);
                    $('#caparam_edit').val(equipo.equ_ram);
                    $('#marcadisco_edit').val(equipo.equ_discoduro_marca);
                    $('#marcatarjeta_edit').val(equipo.equ_tajeta_video);
                    $('#nopuertos_edit').val(equipo.equ_puertos);
                    $('#tipoequi_edit').val(equipo.equ_tipo_equipo);
                    $('#almacapa_edit').val(equipo.equ_capacidad_almacenamiento);
                    $('#equipoid_edit').val(equipo.id);
                    $('#equipoidAct_edit').val(equipo.tblactivosfijos_id);
                    
                    // Abre la modal
                    $('#EditarEquipoComputo').modal('show');
                } else {
                    console.log('No se encontraron datos para el equipo con ID: ' + equ_id);
                }
            },
            error: function (error) {
                console.log('Error en la solicitud Ajax:', error);
            }
        });
    });
});

