import 'package:calculadora_simples/src/features/calc/components/button_numero_component.dart';
import 'package:calculadora_simples/src/features/calc/components/button_operacao_component.dart';
import 'package:calculadora_simples/src/features/calc/components/text_expressao_component.dart';
import 'package:calculadora_simples/src/features/calc/components/text_resultado_component.dart';
import 'package:calculadora_simples/src/features/calc/models/button_numero_model.dart';
import 'package:calculadora_simples/src/features/calc/models/button_operacao_model.dart';
import 'package:calculadora_simples/src/features/calc/models/enums/button_operacoes_enum.dart';
import 'package:calculadora_simples/src/shared/dispositivo/tamanho_tela.dart';
import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora Simples")),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: SizedBox(
              width: TamanhoTela.largura(context),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [TextExpressaoComponent(), TextResultadoComponent()],
              ),
            ),
          )),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: TamanhoTela.altura(context) * 0.025),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.apagarTudo)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            isIcon: true, operacao: ButtonOperacoes.apagar)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.potencia)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.divisao)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 7)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 8)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 9)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.multiplicacao))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 4)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 5)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 6)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.subtracao))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 1)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 2)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 3)),
                    ButtonOperacaoComponent(
                        model:
                            ButtonOperacaoModel(operacao: ButtonOperacoes.soma))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.nulo)),
                    ButtonNumeroComponent(model: ButtonNumeroModel(numero: 0)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.virgula)),
                    ButtonOperacaoComponent(
                        model: ButtonOperacaoModel(
                            operacao: ButtonOperacoes.operar))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
