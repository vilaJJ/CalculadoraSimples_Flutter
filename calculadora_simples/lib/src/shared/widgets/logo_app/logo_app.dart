import 'package:calculadora_simples/src/shared/dispositivo/tamanho_tela.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: TamanhoTela.altura(context) * 0.125),
      child: Image(
        image: const AssetImage("assets/images/calculator_icon.png"),
        fit: BoxFit.cover,
        width: TamanhoTela.largura(context),
      ),
    );
  }
}
