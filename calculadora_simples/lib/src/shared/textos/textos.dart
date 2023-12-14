class Textos {
  static String vazio = "";

  static String removerFinalSemValor(double value) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    return value.toString().replaceAll(regex, vazio);
  }
}
