import 'package:calculadora_simples/src/features/auth/controllers/enums/auth_state_enum.dart';
import 'package:calculadora_simples/src/features/auth/models/auth_request_model.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final String _usuario = "eduarda";
  final String _senha = "eduarda123";

  var authRequest = AuthRequestModel('', '');
  var state = AuthState.parado;

  Future<void> realizarLogin() async {
    state = AuthState.carregando;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (authRequest.usuario == _usuario && authRequest.senha == _senha) {
      state = AuthState.sucesso;
    } else {
      state = AuthState.erro;
    }

    notifyListeners();
  }
}
