import 'package:calculadora_simples/src/shared/device/screen_size.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: ScreenSize.height(context) * 0.125),
      child: Image(
        image: const AssetImage("assets/images/calculator_icon.png"),
        fit: BoxFit.cover,
        width: ScreenSize.width(context),
      ),
    );
  }
}
