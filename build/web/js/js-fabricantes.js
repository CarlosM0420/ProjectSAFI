var botonAgregar = document.querySelector('.AggButton');

// Callback para habilitar el botón cuando el reCAPTCHA se completa con éxito
function enableSubmitButton() {
    botonAgregar.disabled = false;
    
}
function recaptchaExpiredCallback() {
    botonAgregar.disabled = true;
    
}


