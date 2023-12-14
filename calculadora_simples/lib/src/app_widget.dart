import 'package:calculadora_simples/src/features/auth/controllers/auth_controller.dart';
import 'package:calculadora_simples/src/features/auth/pages/auth_page.dart';
import 'package:calculadora_simples/src/features/calc/controllers/calc_controller.dart';
import 'package:calculadora_simples/src/features/calc/pages/calc_page.dart';
import 'package:calculadora_simples/src/features/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => CalcController())
      ],
      child: MaterialApp(
        title: "Calculadora Simples",
        theme: ThemeData.dark(useMaterial3: true),
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashPage(),
          "/auth": (context) => const AuthPage(),
          "/calc": (context) => const CalcPage()
        },
      ),
    );
  }
}
