import 'package:math_expressions/math_expressions.dart';

class OperacoesMatematicas {
  static double realizarOperacao(String expressaoTexto) {
    Parser conversor = Parser();

    Expression expressao = conversor.parse(expressaoTexto);
    
    ContextModel contextModel = ContextModel();
    double resultado = expressao.evaluate(EvaluationType.REAL, contextModel);

    return resultado;
  }
}
