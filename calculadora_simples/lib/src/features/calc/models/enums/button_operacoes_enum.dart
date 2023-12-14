import 'package:calculadora_simples/src/shared/textos/textos.dart';
import 'package:flutter/material.dart';

enum ButtonOperacoes {
  soma,
  subtracao,
  multiplicacao,
  divisao,
  potencia,
  operar,
  virgula,
  apagar,
  apagarTudo,
  nulo
}

extension ButtonOperacoesExtension on ButtonOperacoes {
  String get obterTexto {
    switch (this) {
      case ButtonOperacoes.soma:
        return "+";
      case ButtonOperacoes.subtracao:
        return "–";
      case ButtonOperacoes.multiplicacao:
        return "×";
      case ButtonOperacoes.divisao:
        return "÷";
      case ButtonOperacoes.potencia:
        return "^";
      case ButtonOperacoes.apagarTudo:
        return "AC";
      case ButtonOperacoes.operar:
        return "=";
      case ButtonOperacoes.virgula:
        return ",";
      case ButtonOperacoes.apagar:
        return "apagar";
      case ButtonOperacoes.nulo:
        return Textos.vazio;
    }
  }

  String get obterOperador {
    switch (this) {
      case ButtonOperacoes.soma:
        return "+";
      case ButtonOperacoes.subtracao:
        return "-";
      case ButtonOperacoes.multiplicacao:
        return "*";
      case ButtonOperacoes.divisao:
        return "/";
      case ButtonOperacoes.potencia:
        return "^";
      case ButtonOperacoes.virgula:
        return ".";
      default:
        return Textos.vazio;
    }
  }

  IconData get obterIcone {
    switch (this) {
      case ButtonOperacoes.apagar:
        return Icons.backspace_outlined;
      default:
        return Icons.circle;
    }
  }
}
