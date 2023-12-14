import 'package:calculadora_simples/src/features/calc/models/button_numero_model.dart';
import 'package:calculadora_simples/src/features/calc/models/button_operacao_model.dart';
import 'package:calculadora_simples/src/features/calc/models/enums/button_operacoes_enum.dart';
import 'package:calculadora_simples/src/shared/operacoes_matematicas/operacoes_matematicas.dart';
import 'package:calculadora_simples/src/shared/textos/textos.dart';
import 'package:flutter/material.dart';

class CalcController extends ChangeNotifier {
  late String _textoExpressao;
  late String _textoResultado;

  bool _primeiroNumeroFoiDigitado = false;
  bool _virgulaFoiDigitada = false;

  CalcController() {
    _textoExpressao = _textoResultado = Textos.vazio;
  }

  String obterExpressao() {
    return _textoExpressao;
  }

  String obterResultado() {
    return _textoResultado;
  }

  void pressionarNumero(ButtonNumeroModel model) {
    if (_primeiroNumeroFoiDigitado == false && model.numero == 0) {
      return;
    }

    _textoExpressao += model.numero.toString();
    _primeiroNumeroFoiDigitado = true;

    notifyListeners();
  }

  void pressionarOperacao(ButtonOperacaoModel model) {
    var operacao = model.operacao;

    switch (operacao) {
      case ButtonOperacoes.operar:
        _operar();
        break;
      case ButtonOperacoes.virgula:
        _escreverVirgula();
        break;
      case ButtonOperacoes.apagar:
        _apagar();
        break;
      case ButtonOperacoes.apagarTudo:
        _limparTudo();
        break;
      case ButtonOperacoes.nulo:
        return;
      default:
        _escreverOperador(operacao);
        break;
    }

    notifyListeners();
  }

  // Métodos privados -------------------------------------------------

  void _operar() {
    try {
      if (_textoExpressao.trim().characters.last == ",") {
        _textoExpressao += "0";
      }

      if (int.tryParse(_textoExpressao.trim().characters.last) == null) {
        _apagar();
        _primeiroNumeroFoiDigitado = true;
      }

      var expressao = _textoExpressao;

      expressao = expressao.replaceAll(ButtonOperacoes.virgula.obterTexto,
          ButtonOperacoes.virgula.obterOperador);

      expressao = expressao.replaceAll(
          ButtonOperacoes.soma.obterTexto, ButtonOperacoes.soma.obterOperador);
      expressao = expressao.replaceAll(ButtonOperacoes.subtracao.obterTexto,
          ButtonOperacoes.subtracao.obterOperador);
      expressao = expressao.replaceAll(ButtonOperacoes.multiplicacao.obterTexto,
          ButtonOperacoes.multiplicacao.obterOperador);
      expressao = expressao.replaceAll(ButtonOperacoes.divisao.obterTexto,
          ButtonOperacoes.divisao.obterOperador);

      var resultado = OperacoesMatematicas.realizarOperacao(expressao);

      var resultadoTexto = Textos.removerFinalSemValor(resultado);

      resultadoTexto = resultadoTexto.replaceAll(
          ButtonOperacoes.virgula.obterOperador,
          ButtonOperacoes.virgula.obterTexto);

      _textoResultado = "= $resultadoTexto";
    } catch (e) {
      _textoResultado = "Operação inválida";
    }
  }

  void _escreverOperador(ButtonOperacoes operacao) {
    if (_ultimoCaracterNumero() == false) {
      return;
    }

    if (operacao == ButtonOperacoes.potencia ||
        operacao == ButtonOperacoes.virgula) {
      _textoExpressao += operacao.obterTexto;
    } else {
      _textoExpressao = "${_textoExpressao.trim()} ${operacao.obterTexto} ";
    }

    if (operacao == ButtonOperacoes.virgula) {
      _virgulaFoiDigitada = true;
    } else {
      _primeiroNumeroFoiDigitado = _virgulaFoiDigitada = false;
    }
  }

  void _escreverVirgula() {
    if (_primeiroNumeroFoiDigitado == false || _virgulaFoiDigitada) {
      return;
    }

    _escreverOperador(ButtonOperacoes.virgula);
    _virgulaFoiDigitada = true;
  }

  void _apagar() {
    if (_textoExpressao.isNotEmpty) {
      if (_textoExpressao.trim().characters.last == ',') {
        _virgulaFoiDigitada = false;
      }

      _textoExpressao = _textoExpressao
          .trim()
          .substring(0, _textoExpressao.trim().length - 1);
    }
  }

  void _limparTudo() {
    _textoExpressao = _textoResultado = Textos.vazio;

    _primeiroNumeroFoiDigitado = false;
    _virgulaFoiDigitada = false;
  }

  bool _ultimoCaracterNumero() {
    var texto = _textoExpressao.trim();

    if (texto.isEmpty) {
      return false;
    }

    var ultimoCaractere = texto.characters.last;
    var ultimoNumero = int.tryParse(ultimoCaractere);

    return ultimoNumero != null;
  }

  // Métodos privados -------------------------------------------------
}
