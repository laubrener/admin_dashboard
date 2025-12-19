import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      // print('Formulario válido');
      // print('$email - $password');
      return true;
    } else {
      // print('Formulario no válido');
      return false;
    }
  }
}
