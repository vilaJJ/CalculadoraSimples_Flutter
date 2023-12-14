import 'package:calculadora_simples/src/features/calc/controllers/calc_controller.dart';
import 'package:calculadora_simples/src/shared/dispositivo/tamanho_tela.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextExpressaoComponent extends StatelessWidget {
  const TextExpressaoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalcController>();

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: TamanhoTela.altura(context) * 0.025,
          horizontal: TamanhoTela.largura(context) * 0.05),
      child: Column(
        children: [
          Text(
            controller.obterExpressao(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
