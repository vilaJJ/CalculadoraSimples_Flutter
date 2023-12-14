import 'package:calculadora_simples/src/features/auth/controllers/auth_controller.dart';
import 'package:calculadora_simples/src/features/auth/controllers/enums/auth_state_enum.dart';
import 'package:calculadora_simples/src/shared/vibracao/vibracao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButtonComponent extends StatelessWidget {
  const AuthButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();

    return ElevatedButton.icon(
        onPressed: controller.state == AuthState.carregando
            ? null
            : () async {
                await Vibracao.vibrar(duracaoMS: 100);
                controller.realizarLogin();
              },
        icon: const Icon(Icons.login),
        label: const Text("Realizar Login"));
  }
}
