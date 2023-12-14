import 'package:calculadora_simples/src/features/calc/controllers/calc_controller.dart';
import 'package:calculadora_simples/src/features/calc/models/button_numero_model.dart';
import 'package:calculadora_simples/src/shared/vibracao/vibracao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonNumeroComponent extends StatelessWidget {
  final ButtonNumeroModel model;

  const ButtonNumeroComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CalcController>();

    return FloatingActionButton(
        heroTag: "btn_${model.numero}",
        shape: const CircleBorder(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () async {
          await Vibracao.vibrar(duracaoMS: 50);
          controller.pressionarNumero(model);
        },
        child: Text(
          "${model.numero}",
          style: const TextStyle(fontSize: 24),
        ));
  }
}
