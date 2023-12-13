import 'package:calculadora_simples/src/features/calc/controllers/calc_controller.dart';
import 'package:calculadora_simples/src/features/calc/models/button_operacao_model.dart';
import 'package:calculadora_simples/src/features/calc/models/enums/button_operacoes_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonOperacaoComponent extends StatelessWidget {
  final ButtonOperacaoModel model;

  const ButtonOperacaoComponent({
    super.key,
    required this.model
    });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalcController>();
    
    return FloatingActionButton(
      heroTag: "btn_${model.obterTexto()}",
      shape: const CircleBorder(),
      backgroundColor: model.operacao == ButtonOperacoes.operar 
        ? Colors.orange
        : Colors.transparent,
      elevation: 0,
      onPressed: () {
        controller.realizarAcaoOperacao(model);
      },
      child: model.isIcon
        ? Icon(model.obterIcone(), color: Colors.orange)
        : Text(
          model.obterTexto(),
          style: TextStyle(
            fontSize: 36,
            color: model.operacao == ButtonOperacoes.operar || model.operacao == ButtonOperacoes.virgula
              ? Colors.white
              : Colors.orange,
            ),
          )
      );
  }
}