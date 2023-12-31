import 'package:calculadora_simples/src/features/auth/components/auth_button_component.dart';
import 'package:calculadora_simples/src/features/auth/controllers/auth_controller.dart';
import 'package:calculadora_simples/src/features/auth/controllers/enums/auth_state_enum.dart';
import 'package:calculadora_simples/src/shared/dispositivo/tamanho_tela.dart';
import 'package:calculadora_simples/src/shared/vibracao/vibracao.dart';
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

        Vibracao.vibrar(duracaoMS: 1000);
      } else if (controller.state == AuthState.sucesso) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Autenticado com sucesso.")));
        Navigator.of(context).pushReplacementNamed("/calc");
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
                  width: TamanhoTela.largura(context) * 0.35,
                  child: const LogoApp()),
              Padding(
                padding:
                    EdgeInsets.only(bottom: TamanhoTela.altura(context) * 0.05),
                child: const Text(
                  "Faça o Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: TamanhoTela.largura(context) * 0.05),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: TamanhoTela.altura(context) * 0.0075),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        enabled: controller.state != AuthState.carregando,
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
                          vertical: TamanhoTela.altura(context) * 0.0075),
                      child: TextField(
                        enabled: controller.state != AuthState.carregando,
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
                    vertical: TamanhoTela.altura(context) * 0.05),
                child: SizedBox(
                    width: TamanhoTela.largura(context) * 0.9,
                    child: const AuthButtonComponent()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
