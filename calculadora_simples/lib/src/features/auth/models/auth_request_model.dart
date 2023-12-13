class AuthRequestModel {
  final String? usuario;
  final String? senha;

  AuthRequestModel(this.usuario, this.senha);

  AuthRequestModel copyWith({String? usuario, String? senha}) {
    return AuthRequestModel(usuario ?? this.usuario, senha ?? this.senha);
  }
}
