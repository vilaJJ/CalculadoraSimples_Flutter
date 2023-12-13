import 'package:calculadora_simples/src/features/calc/controllers/calc_controller.dart';
import 'package:calculadora_simples/src/features/calc/models/button_numero_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonNumeroComponent extends StatelessWidget {
  final ButtonNumeroModel model;

  const ButtonNumeroComponent({
    super.key,
    required this.model
    });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CalcController>();

    return FloatingActionButton(
      heroTag: "btn_${model.numero}",
      shape: const CircleBorder(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        controller.realizarAcaoNumero(model);
      },
      child: Text(
        "${model.numero}",
        style: const TextStyle(
          fontSize: 24
        ),
      )
      );
  }
}