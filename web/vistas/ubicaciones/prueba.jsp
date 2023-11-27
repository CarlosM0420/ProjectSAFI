<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventario</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
        

        <div class="container">
            <div class="row">
                <div class="col mx-auto">
                    <h1 class="text-center">Inventario</h1>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Familia</th>
                                <th>Ubicacion</th>
                                <th>Producto</th>
                                <th>Unidad</th>
                                <th>Cantidad</th>
                                <th>Costo de unidad</th>
                                <th>Valor inventario</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                             Ejemplo de un nuevo producto 
                            <tr>
                                <td>0391</td>
                                <td>Aceites</td>
                                <td>Almacen</td>
                                <td>Aceite de oliva</td>
                                <td>25L</td>
                                <td>6</td>
                                <td>26.50</td>
                                <td>159.00</td>
                                <td>
                                    <button class="edit-btn" data-toggle="modal" data-target="#editModal" data-codigo="0391" data-familia="Aceites" data-ubicacion="Almacen" data-producto="Aceite de oliva" data-unidad="25L" data-cantidad="6" data-costo="26.50">Editar</button>
                                </td>
                            </tr>
                             Puedes agregar más productos aquí 
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

         Modal de Edición 
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Producto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                         Formulario de edición 
                        <form id="editForm">
                            <div class="form-group">
                                <label for="editCodigo">Codigo</label>
                                <input type="text" class="form-control" id="editCodigo" readonly>
                            </div>
                            <div class="form-group">
                                <label for="editFamilia">Familia</label>
                                <input type="text" class="form-control" id="editFamilia">
                            </div>
                            <div class="form-group">
                                <label for="editUbicacion">Ubicacion</label>
                                <input type="text" class="form-control" id="editUbicacion">
                            </div>
                            <div class="form-group">
                                <label for="editProducto">Producto</label>
                                <input type="text" class="form-control" id="editProducto">
                            </div>
                            <div class="form-group">
                                <label for="editUnidad">Unidad</label>
                                <input type="text" class="form-control" id="editUnidad">
                            </div>
                            <div class="form-group">
                                <label for="editCantidad">Cantidad</label>
                                <input type="number" class="form-control" id="editCantidad">
                            </div>
                            <div class="form-group">
                                <label for="editCosto">Costo de unidad</label>
                                <input type="number" step="0.01" class="form-control" id="editCosto">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary" id="saveChanges">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
    <script>
        // Manejar la apertura del modal y la actualización de la tabla
        $(document).ready(function () {
            $('.edit-btn').click(function () {
                var codigo = $(this).data('codigo');
                var familia = $(this).data('familia');
                var ubicacion = $(this).data('ubicacion');
                var producto = $(this).data('producto');
                var unidad = $(this).data('unidad');
                var cantidad = $(this).data('cantidad');
                var costo = $(this).data('costo');

                $('#editCodigo').val(codigo);
                $('#editFamilia').val(familia);
                $('#editUbicacion').val(ubicacion);
                $('#editProducto').val(producto);
                $('#editUnidad').val(unidad);
                $('#editCantidad').val(cantidad);
                $('#editCosto').val(costo);
            });

            // Actualizar la tabla cuando se guarda la edición
//            $('#saveChanges').click(function () {
//                var codigo = $('#editCodigo').val();
//                var familia = $('#editFamilia').val();
//                var ubicacion = $('#editUbicacion').val();
//                var producto = $('#editProducto').val();
//                var unidad = $('#editUnidad').val();
//                var cantidad = $('#editCantidad').val();
//                var costo = $('#editCosto').val();
//
//                // Actualizar los datos en la tabla (esto es un ejemplo, debes implementar tu lógica de actualización real aquí)
//                // Aquí solo se actualiza la fila con el código correspondiente
//                $('tr:has(td:contains("' + codigo + '"))').find('td:eq(1)').text(familia);
//                $('tr:has(td:contains("' + codigo + '"))').find('td:eq(2)').text(ubicacion);
//                $('tr:has(td:contains("' + codigo + '"))').find('td:eq(3)').text(producto);
//                $('tr:has(td:contains("' + codigo + '"))').find('td:eq(4)').text(unidad);
//                $('tr:has(td:contains("' + codigo + '"))').find('td:eq(5)').text(cantidad);
//                $('tr:has(td:contains("' + codigo + '"))').find('td:eq(6)').text(costo);
//
//                $('#editModal').modal('hide'); // Cerrar el modal después de guardar
//            });
        });
    </script>
</body>
</html>
