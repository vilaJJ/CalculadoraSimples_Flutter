import 'package:calculadora_simples/src/features/calc/models/button_numero_model.dart';
import 'package:calculadora_simples/src/features/calc/models/button_operacao_model.dart';
import 'package:calculadora_simples/src/features/calc/models/enums/button_operacoes_enum.dart';
import 'package:flutter/material.dart';

class CalcController extends ChangeNotifier {
  bool valor1Ativado = true;
  bool operadorAtivado = false;
  bool valor2Ativado = false;
  bool resultadoAtivado = false;

  String valor1Text = "Valor 1";
  String operadorText = "Operador";
  String valor2Text = "Valor 2";
  String resultadoText = "Resultado";

  Color obterCor(bool ativado) {
    return ativado ? Colors.green : Colors.white;
  }

  void realizarAcaoOperacao(ButtonOperacaoModel model) {
    switch(model.operacao) {
      case ButtonOperacoes.apagarTudo:
        _limparTudo();
        break;
      case ButtonOperacoes.soma:
        _manipularOperador(model);
        break;
      case ButtonOperacoes.subtracao:
        _manipularOperador(model);
        break;
      case ButtonOperacoes.multiplicacao:
        _manipularOperador(model);
        break;
      case ButtonOperacoes.divisao:
        _manipularOperador(model);
        break;
      case ButtonOperacoes.porcentagem:
        _manipularOperador(model);
        break;
      case ButtonOperacoes.raiz:
        _manipularOperador(model);
        break;
      case ButtonOperacoes.operar:
        break;
      case ButtonOperacoes.virgula:
        break;
      case ButtonOperacoes.apagar:
        break;
    }
  }

  void realizarAcaoNumero(ButtonNumeroModel model) {
    
  }

  void _manipularOperador(ButtonOperacaoModel button) {
    operadorText = button.obterTexto();

    operadorAtivado = true;
    valor2Ativado = true;

    notifyListeners();
  }

  void _limparTudo() {
    _reiniciar();

    notifyListeners();
  }

  void _reiniciar() {
    valor1Ativado = true;
    operadorAtivado = false;
    valor2Ativado = false;
    resultadoAtivado = false;

    valor1Text = "Valor 1";
    operadorText = "Operador";
    valor2Text = "Valor 2";
    resultadoText = "Resultado";
  }
}