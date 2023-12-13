import 'package:calculadora_simples/src/features/auth/components/auth_button_component.dart';
import 'package:calculadora_simples/src/features/auth/controllers/auth_controller.dart';
import 'package:calculadora_simples/src/features/auth/controllers/enums/auth_state_enum.dart';
import 'package:calculadora_simples/src/shared/device/screen_size.dart';
import 'package:calculadora_simples/src/shared/widgets/logo_app/logo_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final AuthController controller;

  final FocusNode _usuarioFocus = FocusNode();
  final FocusNode _senhaFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = context.read<AuthController>();

    controller.addListener(() {
      if (controller.state == AuthState.erro) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "Erro na autenticação. Verifique se os dados estão corretos.")));
      } else if (controller.state == AuthState.sucesso) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Autenticado com sucesso.")));
        Navigator.of(context).pushReplacementNamed("/home");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  width: ScreenSize.width(context) * 0.35,
                  child: const LogoApp()),
              Padding(
                padding:
                    EdgeInsets.only(bottom: ScreenSize.height(context) * 0.05),
                child: const Text(
                  "Faça o Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenSize.width(context) * 0.05),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.height(context) * 0.0075),
                      child: TextField(
                        focusNode: _usuarioFocus,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(Icons.account_circle_rounded),
                            labelText: "Usuário"),
                        onChanged: (value) {
                          controller.authRequest =
                              controller.authRequest.copyWith(usuario: value);
                        },
                        onEditingComplete: () {
                          _senhaFocus.requestFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenSize.height(context) * 0.0075),
                      child: TextField(
                        focusNode: _senhaFocus,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(Icons.password),
                            labelText: "Senha"),
                        onChanged: (value) {
                          controller.authRequest =
                              controller.authRequest.copyWith(senha: value);
                        },
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenSize.height(context) * 0.05),
                child: SizedBox(
                    width: ScreenSize.width(context) * 0.9,
                    child: const AuthButtonComponent()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
