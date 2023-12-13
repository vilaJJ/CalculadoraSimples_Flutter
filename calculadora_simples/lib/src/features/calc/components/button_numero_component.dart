import 'package:calculadora_simples/src/features/calc/models/button_numero_model.dart';
import 'package:flutter/material.dart';

class ButtonNumeroComponent extends StatelessWidget {
  final ButtonNumeroModel model;

  const ButtonNumeroComponent({
    super.key,
    required this.model
    });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        
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