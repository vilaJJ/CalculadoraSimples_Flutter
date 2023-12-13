import 'package:calculadora_simples/src/features/calc/models/enums/button_operacoes_enum.dart';
import 'package:flutter/material.dart';

class ButtonOperacaoModel {
  final bool isIcon;
  final ButtonOperacoes operacao;

  ButtonOperacaoModel({
    this.isIcon = false,
    required this.operacao
  });

  String obterTexto() {
    switch(operacao) {
      case ButtonOperacoes.soma:
        return "+";
      case ButtonOperacoes.subtracao:
        return "–";
      case ButtonOperacoes.multiplicacao:
        return "×";
      case ButtonOperacoes.divisao:
        return "÷";
      case ButtonOperacoes.porcentagem:
        return "%";
      case ButtonOperacoes.raiz:
        return "√";
      case ButtonOperacoes.apagarTudo:
        return "AC";
      case ButtonOperacoes.operar:
        return "=";
      case ButtonOperacoes.virgula:
        return ",";
      case ButtonOperacoes.apagar:
        return "apagar";
    }
  }

  IconData obterIcone() {
    switch(operacao) {
      case ButtonOperacoes.apagar:
        return Icons.backspace_outlined;
      default:
        return Icons.circle;
    }
  }
}