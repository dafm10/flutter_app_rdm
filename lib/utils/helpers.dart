import 'package:flutter/material.dart';
import 'package:flutter_app_rdm/widget/widgets.dart';

enum TypeInputTextField {
  dni,
  phone,
  cop,
}

const textMessage = [
  "El registro se eliminó correctamente",
  "El registro se actualizó correctamente",
  "El registro se agregó correctamente",
  "Tu cuenta se creó exitosamente",
  "La cuenta se creó exitosamente",
  "El correo ya se encuentra registrado",
  "Usuario no encontrado",
  "Contraseña incorrecta",
  "Eres doctor",
  "Hubo un inconveniente, inténtalo nuevamente",
  "Usuario desactivado",
  "Demasiadas solicitudes para iniciar sesión en esta cuenta.",
  "Error del servidor, inténtalo de nuevo más tarde.",
  "El correo está errado",
  "Error de inicio de sesion. Inténtalo de nuevo.",
];

void errorSwitch(String variable, BuildContext context) {
  switch (variable) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return messageErrorSnackBar(context, 5);
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return messageErrorSnackBar(context, 7);
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return messageErrorSnackBar(context, 6);
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return messageErrorSnackBar(context, 10);
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return messageErrorSnackBar(context, 11);
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return messageErrorSnackBar(context, 13);
    default:
      return messageErrorSnackBar(context, 14);
  }
}
