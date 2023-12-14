import 'package:flutter/material.dart';

class TamanhoTela {
  static double largura(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double altura(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
