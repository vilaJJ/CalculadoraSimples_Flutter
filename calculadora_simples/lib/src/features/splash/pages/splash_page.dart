// ignore_for_file: use_build_context_synchronously

import 'package:calculadora_simples/src/shared/widgets/logo_app/logo_app.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _aguardarInicio();
  }

  Future<void> _aguardarInicio() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacementNamed("/auth");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [LogoApp(), CircularProgressIndicator()],
        ),
      ),
    );
  }
}
