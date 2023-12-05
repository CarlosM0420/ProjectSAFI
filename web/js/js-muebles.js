
var botonActualizar = document.querySelector('.ActButton');

var botonAgregar = document.querySelector('.AggButton');
// Callback para habilitar el botón cuando el reCAPTCHA se completa con éxito
function enableSubmitButton() {
    botonAgregar.disabled = false;  
}
// Callback para deshabilitar el botón cuando el reCAPTCHA expira
function recaptchaExpiredCallback() {
    botonAgregar.disabled = true; 
}

function enableSubmitButton1() {
    botonActualizar.disabled = false;    
}



function recaptchaExpiredCallback1() {
    
    botonActualizar.disabled = true;
}

$(document).ready(function () {
    $('.editbutton').click(function () {

        var mub_id = $(this).data('mub_id');
        console.log(mub_id);

        // Hacer la solicitud Ajax
        $.ajax({
            url: '../../mueblesServlet', // Reemplaza con la ruta correcta
            method: 'POST',
            data: {accion: 'EditarMuebles', mub_id: mub_id},
            dataType: 'json',
            success: function (data) {
                // Verificar si la respuesta contiene datos
                if (data.length > 0) {
                    var Mueble = data[0];

                    // Manejar la respuesta
//                  Mostramos los valores de la tabla activos fijos
                    $('input[name="txtact_codigoEdit"]').val(Mueble.activosfijos.act_codigo);
                    $('select[name="txtact_estadoEdit"]').val(Mueble.activosfijos.act_estado);
                    $('input[name="txtact_marcaEdit"]').val(Mueble.activosfijos.act_marca);
                    $('input[name="txtact_modeloEdit"]').val(Mueble.activosfijos.act_modelo);
                    $('input[name="txtact_no_serieEdit"]').val(Mueble.activosfijos.act_no_serie);
                    $('input[name="txtact_fecha_adquEdit"]').val(Mueble.activosfijos.act_fecha_adqu);
                    $('input[name="txtact_precio_adquEdit"]').val(Mueble.activosfijos.act_precio_adqu);
                    $('input[name="txtact_vida_utilEdit"]').val(Mueble.activosfijos.act_vida_util);
                    $('input[name="txtact_meses_depreciadosEdit"]').val(Mueble.activosfijos.act_meses_depreciados);
                    $('input[name="txtact_descripcionEdit"]').val(Mueble.activosfijos.act_descripcion);
                    $('select[name="txttblfabricantes_idEdit"]').val(Mueble.activosfijos.tblfabricantes_id);
                    $('select[name="txttblubicacion_idEdit"]').val(Mueble.activosfijos.tblubicacion_id);
                    $('input[name="txtact_idEdit"]').val(Mueble.activosfijos.act_id);
//                  Mostramos los valores de la tabla Equipos de computo
                    $('input[name="txtmub_denominacionEdit"]').val(Mueble.mub_denominacion);
                    $('input[name="txtmub_materialEdit"]').val(Mueble.mub_material);
                    $('input[name="txtmub_pesoEdit"]').val(Mueble.mub_peso);
                    $('input[name="txtmub_anchoEdit"]').val(Mueble.mub_ancho);
                    $('input[name="txtmub_altoEdit"]').val(Mueble.mub_alto);
                    $('input[name="txtmub_largoEdit"]').val(Mueble.mub_largo);
                    $('input[name="txtmub_idEdit"]').val(Mueble.id);
                    $('input[name="txtmub_id_ActEdit"]').val(Mueble.tblactivosfijos_act_id);

                    // Abre la modal
                    $('#EditarMueble').modal('show');
                } else {
                    console.log('No se encontraron datos para el equipo con ID: ' + mub_id);
                }
            },
            error: function (error) {
                console.log('Error en la solicitud Ajax:', error);
            }
        });
    });
});


