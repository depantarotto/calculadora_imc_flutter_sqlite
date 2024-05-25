import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _nomeUsuario = "nome_usuario";
  static const String _emailUsuario = "email_usuario";
  static const String _alturaUsuario = "altura_usuario";

  void _setDouble(String chave, double valor) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(chave, valor);
  }

  Future<double> _getDouble(String chave) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(chave) ?? 0;
  }

  void _setString(String chave, String valor) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(chave, valor);
  }

  Future<String> _getString(String chave) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(chave) ?? "";
  }

  void setAltura(double altura) {
    _setDouble(_alturaUsuario, altura);
  }

  Future<double> getAltura() {
    return _getDouble(_alturaUsuario);
  }

  void setNomeUsuario(String nome) {
    _setString(_nomeUsuario, nome);
  }

  Future<String> getNomeUsuario() {
    return _getString(_nomeUsuario);
  }

  void setEmailUsuario(String email) {
    _setString(_emailUsuario, email);
  }

  Future<String> getEmailUsuario() {
    return _getString(_emailUsuario);
  }
}
