import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Formulario válido');
      print('$email - $password - $confirmPassword');
    } else {
      print('Formulario no válido');
    }
  }
}
