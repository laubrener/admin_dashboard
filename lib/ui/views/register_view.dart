import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider = context.watch<RegisterFormProvider>();
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),

            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          if (value.length < 3) {
                            return 'El nombre debe tener al menos 3 caracteres';
                          }

                          return null; //válido
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          label: 'Nombre',
                          hint: 'Ingrese su nombre',
                          icon: Icon(Icons.person_outline),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email inválido';
                          }
                          return null;
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
                            registerFormProvider.password = value,
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
                      TextFormField(
                        onChanged: (value) =>
                            registerFormProvider.confirmPassword = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value != registerFormProvider.password) {
                            return 'Las contraseñas no coinciden';
                          }

                          return null; //válido
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          label: 'Contraseña',
                          hint: 'Confirme su contraseña',
                          icon: Icon(Icons.lock_outline),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {},
                        text: 'Crear cuenta',
                      ),
                      SizedBox(height: 20),
                      LinkText(
                        text: 'ya tenes cuenta?',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
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
