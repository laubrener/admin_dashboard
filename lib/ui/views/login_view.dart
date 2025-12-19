import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider = context.watch<LoginFormProvider>();

          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),

            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => loginFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email inválido';
                          }
                          return null;
                          // String pattern =
                          //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          // RegExp regExp = RegExp(pattern);

                          // return regExp.hasMatch(value ?? '')
                          //     ? null
                          //     : 'El valor ingresado no luce como un correo';
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          label: 'Email',
                          hint: 'Ingrese su correo',
                          icon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) =>
                            loginFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe tener al menos 6 caracteres';
                          }

                          return null; //válido
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          label: 'Contraseña',
                          hint: 'Ingrese su contraseña',
                          icon: Icon(Icons.lock_outline),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          final isValid = loginFormProvider.validateForm();
                          if (isValid) {
                            authProvider.login(
                              loginFormProvider.email,
                              loginFormProvider.password,
                            );
                          }
                        },
                        text: 'Ingresar',
                      ),
                      SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Flurorouter.registerRoute,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
