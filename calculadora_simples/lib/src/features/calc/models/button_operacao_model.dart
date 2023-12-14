import 'package:calculadora_simples/src/features/calc/models/enums/button_operacoes_enum.dart';

class ButtonOperacaoModel {
  final bool isIcon;
  final ButtonOperacoes operacao;

  ButtonOperacaoModel({this.isIcon = false, required this.operacao});
}
