$(document).ready(function () {
    $('.editbutton').click(function () {
        console.log("Hola mundo");
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
                    
                    $('#codigoedit').val(equipo.activosfijos.act_codigo);
                    $('#estadoedit').val(equipo.activosfijos.act_estado);
                    $('#marcaedit').val(equipo.activosfijos.act_marca);
                    $('#modeloedit').val(equipo.activosfijos.act_modelo);
                    $('#noserieedit').val(equipo.activosfijos.act_no_serie);                                                            
                    $('#adqufechaedit').val(equipo.activosfijos.act_fecha_adqu);                   
                    
                    // Manejar la respuesta
                    $('#codigoedit').val(equipo.activosfijos.act_modelo);

                    
                    

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

